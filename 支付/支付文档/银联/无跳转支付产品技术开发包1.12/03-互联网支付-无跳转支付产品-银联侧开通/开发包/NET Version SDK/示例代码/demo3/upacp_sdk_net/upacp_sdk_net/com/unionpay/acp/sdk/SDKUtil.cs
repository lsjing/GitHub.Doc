using System.Collections.Generic;
using System.Text;
using System;
using System.IO.IsolatedStorage;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Web.Script.Serialization;



namespace upacp_sdk_net.com.unionpay.sdk
{
    public class SDKUtil
    {

        /// <summary>
        /// 签名
        /// </summary>
        /// <param name="dataStr"></param>
        /// <param name="encoder"></param>
        /// <returns></returns>
        public static bool Sign(Dictionary<string, string> data, Encoding encoder)
        {
            //设置签名证书序列号 ？

            data["certId"] = CertUtil.GetSignCertId();

            //将Dictionary信息转换成key1=value1&key2=value2的形式
            string stringData = CoverDictionaryToString(data);

            string stringSign = null;

            byte[] signDigest = SecurityUtil.Sha1X16(stringData, encoder);

            string stringSignDigest = BitConverter.ToString(signDigest).Replace("-", "").ToLower();
            
            byte[] byteSign = SecurityUtil.SignBySoft(CertUtil.GetSignProviderFromPfx(), encoder.GetBytes(stringSignDigest));

            stringSign = Convert.ToBase64String(byteSign);

            //设置签名域值
          
            data["signature"] = stringSign;

            return true;//
        }

        /// <summary>
        /// 验证签名
        /// </summary>
        /// <param name="data"></param>
        /// <param name="encoder"></param>
        /// <returns></returns>
        public static bool Validate(Dictionary<string, string> data, Encoding encoder)
        {
            //获取签名
            string signValue = data["signature"];
            byte[] signByte = Convert.FromBase64String(signValue);
            data.Remove("signature");
            string stringData = CoverDictionaryToString(data);
            byte[] signDigest = SecurityUtil.Sha1X16(stringData, encoder);
            string stringSignDigest = BitConverter.ToString(signDigest).Replace("-", "").ToLower();
            RSACryptoServiceProvider provider = CertUtil.GetValidateProviderFromPath(data["certId"]);
            if (null == provider)
            {
                return false;
            }
            return SecurityUtil.ValidateBySoft(provider, signByte, encoder.GetBytes(stringSignDigest));
        }


        /// <summary>
        /// 将Dictionary内容排序后输出为键值对字符串
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string CoverDictionaryToString(Dictionary<string, string> data)
        {
            //如果不加stringComparer.Ordinal，排序方式和java treemap有差异
            SortedDictionary<string, string> treeMap = new SortedDictionary<string, string>(StringComparer.Ordinal); 
           
            foreach (KeyValuePair<string, string> kvp in data)
            {
                treeMap.Add(kvp.Key, kvp.Value);
            }

            StringBuilder builder = new StringBuilder();
         
            foreach (KeyValuePair<string, string> element in treeMap)
            {
                builder.Append(element.Key + "=" + element.Value + "&");
            }

            return builder.ToString().Substring(0, builder.Length - 1);
        }

        /// <summary>
        /// 将字符串key1=value1&key2=value2转换为Dictionary数据结构
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static Dictionary<string, string> CoverstringToDictionary(string data)
        {
            if (null == data || 0 == data.Length)
            {
                return null;
            }
            string[] arrray = data.Split(new char[] { '&' });
            Dictionary<string, string> res = new Dictionary<string, string>();
            foreach (string s in arrray)
            {
                int n = s.IndexOf("=");
                string key = s.Substring(0, n);
                string value = s.Substring(n + 1);
               // Console.WriteLine(key + "=" + value);
                res.Add(key, value);
            }
            return res;
        }

        
        public static string CreateAutoSubmitForm(string url, Dictionary<string, string> data, Encoding encoder)
        {
            StringBuilder html = new StringBuilder();
            html.AppendLine("<html>");
            html.AppendLine("<head>");
            html.AppendFormat("<meta http-equiv=\"Content-Type\" content=\"text/html; charset={0}\" />", encoder.BodyName);
            html.AppendLine("</head>");
            html.AppendLine("<body onload=\"OnLoadSubmit();\">");
            html.AppendFormat("<form id=\"pay_form\" action=\"{0}\" method=\"post\">", url);
            foreach (KeyValuePair<string, string> kvp in data)
            {
                html.AppendFormat("<input type=\"hidden\" name=\"{0}\" id=\"{0}\" value=\"{1}\" />", kvp.Key, kvp.Value);
            }
            html.AppendLine("</form>");
            html.AppendLine("<script type=\"text/javascript\">");
            html.AppendLine("<!--");
            html.AppendLine("function OnLoadSubmit()");
            html.AppendLine("{");
            html.AppendLine("document.getElementById(\"pay_form\").submit();");
            html.AppendLine("}");
            html.AppendLine("//-->");
            html.AppendLine("</script>");
            html.AppendLine("</body>");
            html.AppendLine("</html>");
            return html.ToString();
        }

        /// <summary>
        /// 将Dictionary内容排序后输出为键值对字符串,供打印报文使用
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string PrintDictionaryToString(Dictionary<string, string> data)
        {
            //如果不加stringComparer.Ordinal，排序方式和java treemap有差异
            SortedDictionary<string, string> treeMap = new SortedDictionary<string, string>(StringComparer.Ordinal); 

            foreach (KeyValuePair<string, string> kvp in data)
            {
                treeMap.Add(kvp.Key, kvp.Value);
            }

            StringBuilder builder = new StringBuilder();
            foreach (KeyValuePair<string, string> element in treeMap)
            {
                builder.Append(element.Key + "=" + element.Value + "&");
            }

            return builder.ToString().Substring(0, builder.Length - 1);
        }

            
         /// <summary>
        /// pinblock 16进制计算
        /// </summary>
        /// <param name="encoder"></param>
        /// <returns></returns>

        public static string printHexString(byte[] b)
        {

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < b.Length; i++)
            {
                string hex = Convert.ToString(b[i] & 0xFF, 16);
                if (hex.Length == 1)
                {
                    hex = '0' + hex;
                }
                sb.Append("0x");
                sb.Append(hex + " ");
            }
            sb.Append("");
            return sb.ToString();
        }


        //public sealed class X509Certificate2
        //{
        //    private static X509Certificate2 pc;

        //    /// <summary>
        //    /// 构造方法私有，外键不能通过New类实例化此类
        //    /// </summary>
        //    private X509Certificate2()
        //    {
        //    }
        //    /// <summary>
        //    /// 此方法是本类实例的唯一全局访问点           
        //    /// <returns></returns>
        //    public static X509Certificate2 GetInstance()
        //    {
        //        //如实例不存在，则New一个新实例，否则返回已有实例
        //        if (pc == null)
        //        {
        //            pc = new X509Certificate2();
        //        }
        //        return pc;
        //    }
        //}

        /// <summary>
        /// 密码pinblock加密
        /// </summary>
        /// <param name="card"></param>
        /// <param name="pwd"></param>
        /// <param name="encoding"></param>
        /// <returns></returns>
        public static string encryptPin(string card, string pwd, string encoding)
        {

            /** 生成PIN Block **/
            byte[] pinBlock = SecurityUtil.pin2PinBlockWithCardNO(pwd, card);
            printHexString(pinBlock);


            X509Certificate2 pc = new X509Certificate2(SDKConfig.EncryptCert);


            RSACryptoServiceProvider p = new RSACryptoServiceProvider();

            p = (RSACryptoServiceProvider)pc.PublicKey.Key;

            byte[] enBytes = p.Encrypt(pinBlock, false);

            return Convert.ToBase64String(enBytes);


           // return SecurityUtil.EncryptPin(pwd, card, encoding);
        }

        /// <summary>
        /// 数据加密
        /// </summary>
        /// <param name="encoder"></param>
        /// <returns></returns>


        public static string encryptData(string data, string encoding)
        {

            X509Certificate2 pc = new X509Certificate2(SDKConfig.EncryptCert);


            RSACryptoServiceProvider p = new RSACryptoServiceProvider();

            p = (RSACryptoServiceProvider)pc.PublicKey.Key;

            byte[] enBytes = p.Encrypt(UTF8Encoding.UTF8.GetBytes(data), false);

            return Convert.ToBase64String(enBytes);
        }



        /// <summary>
        /// 将Dictionary中的数据转换成key1=value1&key2=value2的形式 不包含签名域signature
        /// </summary>
        /// <param name="encoder"></param>
        /// <returns></returns>
        public static string CustomerInfo(Dictionary<string, string> date)
        {
            // {key1=v1&key2=v2}

            //  Dictionary<string, string> tree = new Dictionary<string, string>();
            StringBuilder str = new StringBuilder();

            foreach (string key in date.Keys)
            {
                if (upacp_sdk_net.com.unionpay.sdk.SDKConstants.param_signature.Equals(key.Trim()))
                {
                    continue;
                }
                str.Append(key + SDKConstants.EQUAL + date[key] + SDKConstants.AMPERSAND);
            }
            return str.ToString().Substring(0, str.Length - 1);

        }


	

        /// <summary>
        ///  根据获取到的biz文件要求填写 参看数据元相关子域说明，json报文结构
        /// </summary>
        /// 
        /// <returns></returns>


        public static string getbillDetailInfo()
        {

            JavaScriptSerializer js = new JavaScriptSerializer();
            //js.Serialize("usr_num", "88888");

            //js.Serialize("query_month", "000000");

          
            Dictionary<string, object> di = new Dictionary<string, object>();
            di.Add("usr_num", "88888");
            di.Add("query_month", "000000");      
            string result = js.Serialize(di);
            return result;


            //Dictionary<string, object> di = new Dictionary<string, object>();
            //di.Add("usr_num", "88888");

            //di.Add("query_month", "000000");
            //return di.ToString();
        }




        /// <summary>
        ///组装银行卡验证信息及身份信息(customerInfo):
        /// </summary>
        /// <param name="customerInfo01" >证件类型</param>
        /// <param name="customerInfo02">证件号码</param>
        /// <param name="customerInfo03">姓名</param>
        /// <param name="customerInfo04">手机号</param>
        /// <param name="customerInfo05">短信验证码</param>
        ///<param name="customerInfo06">持卡人密码</param>
        ///  <param name="customerInfo07">CVN2</param>
        /// <param name="customerInfo08"> 有效期</param>
        /// <returns></returns>
        public static string generateCustomerInfo(Dictionary<string,string> p_param, string pan, string encoding,
                bool isEncrypt)
        {

            // 设置编码方式
            if ((encoding).Equals(null))
            {
                encoding = SDKConstants.UTF_8_ENCODING;
            }
            // 持卡人身份信息 --证件类型&证件号码&姓名&手机号&短信验证码&持卡人密码&CVN2&有效期
            StringBuilder sf = new StringBuilder("{");               
            if (!string.IsNullOrEmpty( p_param["customerInfo01"]))//
            {
                sf.Append(p_param["customerInfo01"] + SDKConstants.AMPERSAND);
            }
            if (!string.IsNullOrEmpty(p_param["customerInfo02"]))//
            {
                sf.Append(p_param["customerInfo02"] + SDKConstants.AMPERSAND);
            }
            if (!string.IsNullOrEmpty(p_param["customerInfo03"]))//
            {
                sf.Append(p_param["customerInfo03"] + SDKConstants.AMPERSAND);
            }
            if (!string.IsNullOrEmpty(p_param["customerInfo04"]))//
            {
                sf.Append(p_param["customerInfo04"] + SDKConstants.AMPERSAND);
            }
            if (!string.IsNullOrEmpty(p_param["customerInfo05"]))//
            {
                sf.Append(p_param["customerInfo05"] + SDKConstants.AMPERSAND);
            }  
            // 密码处理
            if (!string.IsNullOrEmpty(p_param["customerInfo06"]))
            {
                if (!string.IsNullOrEmpty(pan))
                {
                    sf.Append(SDKUtil.encryptPin(pan.Trim(), p_param["customerInfo06"],
                            encoding)
                            + SDKConstants.AMPERSAND);
                }
                else
                {
                    sf.Append(p_param["customerInfo06"] + SDKConstants.AMPERSAND);
                }
                                                              
            }           
            // CVN2处理
            if (!string.IsNullOrEmpty(p_param["customerInfo07"]))
            {
                if (isEncrypt)
                {
                    sf.Append(SDKUtil.encryptData(p_param["customerInfo07"], encoding)
                            + SDKConstants.AMPERSAND);
                }
                else
                {
                    sf.Append(p_param["customerInfo07"] + SDKConstants.AMPERSAND);
                }
            }
           
            // 有效期处理
            if (!string.IsNullOrEmpty(p_param["customerInfo087"]))
            {
                if (isEncrypt)
                {
                    sf.Append(SDKUtil.encryptData(p_param["customerInfo087"], encoding));
                }
                else
                {
                    sf.Append(p_param["customerInfo087"]);
                }
            }
            sf.Append("}");
            try
            {
                return SecurityUtil.EncodeBase64(Encoding.Default,sf.ToString());
            }
            
            catch (Exception e)
            {
                Console.WriteLine(e.Message); ;
                return "";
            }
          
        }


    }
}