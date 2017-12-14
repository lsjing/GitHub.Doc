using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.IO;
using System.Net.Security;
using System.Text;
using System.Reflection;
using pay.reachlife.com;

namespace DEMO
{
    public partial class _Default : System.Web.UI.Page
    {
        X509Certificate certificate;
        String businessid = "XXXXXXXXXX";
        String storesId = "2";
        String cardNumber = "15221944349";

        protected void Page_Load(object sender, EventArgs e)
        {
            ServicePointManager.ServerCertificateValidationCallback = ValidateServerCertificate;
            certificate = new X509Certificate(@"c:\SSL\XXXXXXXX.p12", "");
        }

        protected void Button1_Click(object sender, EventArgs e)//密码重置
        {
            ResetPasswordService port = new ResetPasswordService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._ResetPassword("100001", "2", "18616562850", "415086", 1);
            MsgBox(ruslet);
        }

        protected void Button3_Click(object sender, EventArgs e)//获取短信验证码接口
        {
            GetVerificationCodeService port = new GetVerificationCodeService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._GetVerificationCode(businessid, storesId,
                cardNumber, 0);
            MsgBox(ruslet);
        }

        protected void Button4_Click(object sender, EventArgs e)//验证短信验证码接口
        {
            CheckVerificationCodeService port = new CheckVerificationCodeService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._CheckVerificationCode(businessid, storesId,
                cardNumber, "457960");
            MsgBox(ruslet);
        }

        protected void Button5_Click(object sender, EventArgs e)//"查询用户积分接口
        {
            QueryUserIntegralService port = new QueryUserIntegralService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._QueryUserIntegral(businessid, storesId, cardNumber,
                "457960");
            MsgBox(ruslet);
        }

        protected void Button6_Click(object sender, EventArgs e)//会员身份认证接口
        {
            CheckUserIdentityService port = new CheckUserIdentityService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._CheckUserIdentity(businessid, storesId,
                cardNumber, "2850", 0);
            MsgBox(ruslet);
        }

        protected void Button7_Click(object sender, EventArgs e)//会员卡申请接口
        {
            SetMembershipCardService port = new SetMembershipCardService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._SetMembershipCard(businessid, storesId,
                "8000011123", "18616562850", "31489");
            MsgBox(ruslet);
        }

        protected void Button8_Click(object sender, EventArgs e)//查询用户交易明细接口(限喜试网)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)//获取积分交易短信验证码接口
        {
            List<order> list = new List<order>();
            for (int i = 1; i < 4; i++)
            {//商品唯一编号    商品名称     商品数量    商品价格（单位 元）
                list.Add(new order() {code="AD100292", goods = "2015新款男士春秋韩版休闲夹克男春装外套修身薄款青年连帽夹克潮", number = i, price = "100" });
            }

            GetPayUserIntegralVerificationCodeService port = new GetPayUserIntegralVerificationCodeService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._GetPayUserIntegralVerificationCode(businessid, storesId,
                cardNumber, "90", "100001", "1111001", "2012-12-02 00:00:00", GetToJson.GetJson<List<order>>(list));
            MsgBox(ruslet);
        }
 

        protected void Button9_Click(object sender, EventArgs e)//积分消费接口
        {
            CheckIntegralConsumptionService port = new CheckIntegralConsumptionService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._CheckIntegralConsumption(businessid, storesId,
                cardNumber, "798205", "751202", "22", "1000010", "11111001", "2012-08-10 00:00:00");
            MsgBox(ruslet);
        }

        protected void Button10_Click(object sender, EventArgs e)//完成订单接口
        {
            List<order> list = new List<order>();
            for (int i = 1; i < 4; i++)
            {//商品唯一编号    商品名称     商品数量    商品价格（单位 元）
                list.Add(new order() { code = "AD100292", goods = "2015新款男士春秋韩版休闲夹克男春装外套修身薄款青年连帽夹克潮", number = i, price = "100" });
            }

            CheckTransactionCompletionService port = new CheckTransactionCompletionService();
            port.ClientCertificates.Add(certificate);
            String ruslet = port._CheckTransactionCompletion(businessid, storesId, cardNumber, "200.39", 1, "2222", "222333",
                "2012-08-10 00:00:00", GetToJson.GetJson<List<order>>(list), 1);
            MsgBox(ruslet);
        }



        private bool ValidateServerCertificate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

        public void MsgBox(string _Msg)
        {
            string StrScript;
            StrScript = ("<script language=javascript>");
            StrScript += ("alert('" + _Msg + "');");
            StrScript += ("</script>");
            System.Web.HttpContext.Current.Response.Write(StrScript);
        }
    } 
}
