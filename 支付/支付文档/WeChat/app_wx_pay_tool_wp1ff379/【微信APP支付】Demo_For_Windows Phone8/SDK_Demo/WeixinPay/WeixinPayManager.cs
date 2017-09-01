using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Network;
using Utils;
using SDK_Demo;
using System.Net;
using System.Windows;

namespace WeixinPay
{
    class WeixinPayManager
    {
        private string mPartnerId = "";
        private const string mPackageForSdk = "Sign=WXPay";//这个小写必须完全一致
        private Dictionary<string, string> mArguments = null;
        private Action<Dictionary<string, string>> mPayCb = null;
        private Dictionary<string, string> mReqRict = null;

        public void payFor(string partnerId, Dictionary<string, string> arguments, Action<Dictionary<string, string>> payCb)
        {
            if (string.IsNullOrWhiteSpace(partnerId)
                || arguments == null || arguments.Count == 0 || payCb == null)
            {
                MessageBox.Show("invalid args");
                return;
            }

            mPartnerId = partnerId;
            mPayCb = payCb;
            mArguments = arguments;

            getAccessToken(ConstString.SECRET, ConstString.APPID);
        }

        // 强烈建议此操作中加密部分放在服务器端完成，不要将partnerKey暴露在客户端中，此处只为方便演示
        //private Action<string> mGetAccessTokenCb = null;
        private void getAccessToken(string secret, string appID)
        {
            string url = string.Format("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}", appID, secret);

            //发起网络请求
            HttpClient Client = new HttpClient(url, 1, null);
            Client.send(null, 0, OnHttpResponeGetAccessToken);
        }

        private void OnHttpResponeGetAccessToken(byte[] data_buf)
        {
            if (data_buf == null)
            {
                MessageBox.Show("get token failed1");
                return;
            }

            string Jason = Encoding.UTF8.GetString(data_buf,0,data_buf.Length);
            if (string.IsNullOrWhiteSpace(Jason) || Jason.Contains("errcode"))
            {
                MessageBox.Show("get token failed2"); 
                return;
            }


            Dictionary<string, string> tokenDict = Util.jasonStringToDict(Jason);
            if (tokenDict == null || tokenDict.Count == 0 || !tokenDict.ContainsKey("access_token"))
            {
                MessageBox.Show("get token failed3");
                return;
            }

            string access_token = tokenDict["access_token"];
            string expires_in = tokenDict["expires_in"];
            if(string.IsNullOrWhiteSpace(access_token))
            {
                MessageBox.Show("get token failed4");
                return;
            }

            prepay(access_token, mArguments);
        }

        //这部分处理强烈建议放在服务器，不能把PARTNER_KEY放在客户端。这里只是为了方便演示
        private void prepay(string token, Dictionary<string, string> arguments)
        {
            string originalString = Util.stringWithFormEncodedComponentsAscending(arguments, true, true, "&", false, false);

            //【财付通签名原串】
            string signText = originalString + "&key=" + ConstString.PARTNER_KEY;
            string sign = MD5Core.GetHashString(signText).ToUpper();

            string escapeArguments = Util.stringWithFormEncodedComponentsAscending(arguments, true, true, "&", true, false);
            string package = escapeArguments + "&sign=" + sign;

            mReqRict = new Dictionary<string, string>();
            mReqRict.Add("package", package);
            mReqRict.Add("appid", ConstString.APPID);
            mReqRict.Add("traceid", "traceid");
            mReqRict.Add("noncestr", MD5Core.GetHashString(Util.getNowSeconds().ToString()).ToLower());//这个要小写
            mReqRict.Add("timestamp", Util.getNowSeconds().ToString());
            mReqRict.Add("appkey", ConstString.SECRET_KEY);


            string appOriginalString = Util.stringWithFormEncodedComponentsAscending(mReqRict, true, true, "&", false, false);
            string appSign = Util.Sha1(appOriginalString);
            mReqRict.Remove("appkey");
            mReqRict.Add("app_signature", appSign);
            mReqRict.Add("sign_method", "sha1");


            string appJsonRequestString = Util.dictToJasonString(mReqRict);

            byte[] buf = System.Text.Encoding.UTF8.GetBytes(appJsonRequestString);

            string strbuf = BitConverter.ToString(buf).ToLower();
            strbuf = strbuf.Replace("-", "");

            string url = "https://api.weixin.qq.com/pay/genprepay?access_token=" + token;

            HttpClient Client = new HttpClient(url, 1, null);
            Client.mDefineHeader += onDefineHttpHeader;
            Client.send(buf, buf.Length, OnHttpResponePrepay);
        }

        /// <summary>
        /// 自定义HTTP头
        /// </summary>
        private void onDefineHttpHeader(HttpWebRequest request)
        {
            request.Method = "POST";
            request.UserAgent = "wp7 HTTP Client";
            request.Accept = "*/*";
            request.Headers["Cache-Control"] = "no-cache";
            request.Headers["Host"] = "api.weixin.qq.com";
        }

        private void OnHttpResponePrepay(byte[] data_buf)
        {
            if (data_buf == null)
            {
                MessageBox.Show("get Prepayid failed1");
                return;
            }


            string Jason = Encoding.UTF8.GetString(data_buf, 0, data_buf.Length);

            if (string.IsNullOrWhiteSpace(Jason) || !Jason.Contains("\"errmsg\":\"Success\""))
            {
                Dictionary<string, string> dictionary = Util.jasonStringToDict(Jason);
                MessageBox.Show("get Prepayid failed2,errmsg = " + dictionary["errmsg"]);
                return;
            }

            Dictionary<string, string> Dict = Util.jasonStringToDict(Jason);
            if (Dict == null || Dict.Count == 0 || !Dict.ContainsKey("prepayid"))
            {
                MessageBox.Show("get Prepayid failed3");
                return;
            }

            string prepayid = Dict["prepayid"];
            if(string.IsNullOrWhiteSpace(prepayid))
            {
                MessageBox.Show("get Prepayid failed4");
                return;
            }

            string signsha1 = genOriginalTextWithRequest(prepayid);
            mReqRict.Add("signsha1", signsha1);
            mReqRict.Add("prepayid", prepayid);
            mReqRict.Add("packageforsdk", mPackageForSdk);

            mPayCb(mReqRict);
        }

        private string genOriginalTextWithRequest(string prepayid)
        {
            if (mReqRict == null || mReqRict.Count == 0)
            {
                return "";
            }

            string signText = "";
            Dictionary<string, string> signDict = new Dictionary<string, string>();
            signDict.Add("appid", mReqRict["appid"]);
            signDict.Add("appkey", ConstString.SECRET_KEY);
            signDict.Add("noncestr", mReqRict["noncestr"]);
            signDict.Add("package", mPackageForSdk);
            signDict.Add("partnerid", mPartnerId);
            signDict.Add("prepayid", prepayid);
            signDict.Add("timestamp", mReqRict["timestamp"]);            

            signText = Util.stringWithFormEncodedComponentsAscending(signDict, true, true, "&", false, true);
            string signSha1 = "";
            signSha1 = Util.Sha1(signText);
            return signSha1;
        }
    }
}
