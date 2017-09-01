using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;
using Com.Alipay;
using System.Threading;
using Aop.Api;
using Aop.Api.Request;
using Aop.Api.Response;




namespace F2FPay
{

    /// <summary>
    /// 功能：收单查询接口接入页
    /// 版本：3.3
    /// 日期：2012-07-05
    /// 说明：
    /// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
    /// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
    /// 
    /// /////////////////注意///////////////////////////////////////////////////////////////
    /// 如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
    /// 1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
    /// 2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
    /// 3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
    /// 
    /// 如果不想使用扩展功能请把扩展功能参数赋空值。
    /// </summary>
    public partial class query : System.Web.UI.Page
    {


        IAopClient client = new DefaultAopClient(Config.serverUrl, Config.appId, Config.merchant_private_key, "", Config.version,
        Config.sign_type, Config.alipay_public_key, Config.charset);

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnAlipay_Click(object sender, EventArgs e)
        {
            ////////////////////////////////////////////请求参数////////////////////////////////////////////

            //商户订单号
            string out_trade_no = WIDout_trade_no.Text.Trim();
            
            //商户网站订单系统中唯一订单号，必填

            StringBuilder sb = new StringBuilder();
            sb.Append("{\"out_trade_no\":\"" + out_trade_no + "\"}");

            AlipayTradeQueryResponse queryResponse = Query(sb.ToString());

            //请在这里加上商户的业务逻辑程序代码

            //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

            string result = queryResponse.Body;
            Response.Redirect("Default2.aspx?Text=" + result);

        }


        private AlipayTradeQueryResponse Query(string biz_content)
        {

            AlipayTradeQueryRequest payRequst = new AlipayTradeQueryRequest();
            payRequst.BizContent = biz_content;

            Dictionary<string, string> paramsDict = (Dictionary<string, string>)payRequst.GetParameters();
            AlipayTradeQueryResponse payResponse = client.Execute(payRequst);

            return payResponse;
        }

    }
}