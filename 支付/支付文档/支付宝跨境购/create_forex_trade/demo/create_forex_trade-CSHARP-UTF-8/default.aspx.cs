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

/// <summary>
/// 功能：支付宝境外商户交易创建接口接入页
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
public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void BtnAlipay_Click(object sender, EventArgs e)
    {
        ////////////////////////////////////////////请求参数////////////////////////////////////////////

        //Return URL
        string return_url = "http://商户网关地址/create_forex_trade-CSHARP-UTF-8/return_url.aspx";
        //After the payment transaction is done
        //Notification URL
        string notify_url = "http://商户网关地址/create_forex_trade-CSHARP-UTF-8/notify_url.aspx";
        //The URL for receiving notifications after the payment process.
        //Goods name
        string subject = WIDsubject.Text.Trim();
        //required，The name of the goods.
        //Goods description
        string body = WIDbody.Text.Trim();
        //A detailed description of the goods.
        //Outside trade ID
        string out_trade_no = WIDout_trade_no.Text.Trim();
        //required，A numbered transaction ID （Unique inside the partner system）
        //Currency
        string currency = WIDcurrency.Text.Trim();
        //required，The settlement currency merchant named in contract.
        //Payment sum
        string total_fee = WIDtotal_fee.Text.Trim();
        //required，A floating number ranging 0.01～1000000.00


        ////////////////////////////////////////////////////////////////////////////////////////////////

        //把请求参数打包成数组
        SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
        sParaTemp.Add("partner", Config.Partner);
        sParaTemp.Add("_input_charset", Config.Input_charset.ToLower());
        sParaTemp.Add("service", "create_forex_trade");
        sParaTemp.Add("return_url", return_url);
        sParaTemp.Add("notify_url", notify_url);
        sParaTemp.Add("subject", subject);
        sParaTemp.Add("body", body);
        sParaTemp.Add("out_trade_no", out_trade_no);
        sParaTemp.Add("currency", currency);
        sParaTemp.Add("total_fee", total_fee);

        //建立请求
        string sHtmlText = Submit.BuildRequest(sParaTemp, "get", "确认");
        Response.Write(sHtmlText);
        
    }
}
