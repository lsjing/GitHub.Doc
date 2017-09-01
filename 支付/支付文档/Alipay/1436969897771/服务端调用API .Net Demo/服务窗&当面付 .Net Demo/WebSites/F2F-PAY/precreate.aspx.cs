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
    /// 功能：统一下单并支付接口接入页
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
    public partial class PreCreate : System.Web.UI.Page
    {

        private LogHelper log = new LogHelper(AppDomain.CurrentDomain.BaseDirectory + "/log/log.txt");

        IAopClient client = new DefaultAopClient(Config.serverUrl, Config.appId, Config.merchant_private_key, "", Config.version,
    Config.sign_type, Config.alipay_public_key, Config.charset);

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Alipay_RSA_Submit(object sender, EventArgs e)
        {
            //线上联调时，请输入真实的外部订单号。
            string out_trade_no = String.IsNullOrEmpty(WIDout_request_no.Text.Trim()) ?
                System.DateTime.Now.ToString("yyyyMMddHHmmss") + "0000" + (new Random()).Next(1, 10000).ToString() : WIDout_request_no.Text.Trim();  //商户唯一订单号
            string subject = WIDsubject.Text.Trim();
            string total_amount = WIDamount.Text.Trim();

            //请根据实际请求需要biz_content参数
            StringBuilder sb = new StringBuilder();
		    sb.Append("{\"out_trade_no\":\"" + out_trade_no + "\",");
		    sb.Append("\"total_amount\":\""+total_amount+"\",\"discountable_amount\":\"0.00\",");
		    sb.Append("\"subject\":\""+subject+"\",\"body\":\"test\",");
		    sb.Append("\"goods_detail\":[{\"goods_id\":\"apple-01\",\"goods_name\":\"ipad\",\"goods_category\":\"7788230\",\"price\":\"5.00\",\"quantity\":\"1\"},{\"goods_id\":\"apple-02\",\"goods_name\":\"iphone\",\"goods_category\":\"7788231\",\"price\":\"2.76\",\"quantity\":\"1\"}],");
		    sb.Append("\"operator_id\":\"op001\",\"store_id\":\"pudong001\",\"terminal_id\":\"t_001\",");

            string expire_time = System.DateTime.Now.AddHours(1).ToString("yyyy-MM-dd HH:mm:ss");
            sb.Append("\"time_expire\":\"" + expire_time + "\"}");

            AlipayTradePrecreateResponse payResponse = Prepay(sb.ToString());

            //以下返回结果的处理供参考。
            //payResponse.QrCode即二维码对于的链接
            //将链接用二维码工具生成二维码打印出来，顾客可以用支付宝钱包扫码支付。
            string result = payResponse.Body;

            if (payResponse != null)
            {

                switch (payResponse.Code)
                {
                    case ResultCode.SUCCESS:
                        System.Console.Write(" 预下单成功");
                        StringBuilder sb1 = new StringBuilder();
                        sb1.Append("{\"out_trade_no\":\"" + out_trade_no + "\"}");

                        //1.根据业务需要，选择是否新起线程进行轮询
                        //ParameterizedThreadStart ParStart = new ParameterizedThreadStart(LoopQuery);
                        //Thread myThread = new Thread(ParStart);
                        //object o = payResponse;
                        //myThread.Start(o);

                        //打印出二维码，调用查询接口需要进行轮询订单支付结果
                        //AlipayTradeQueryResponse queryResponse = LoopQuery(sb1.ToString());   //用订单号trade_no进行轮询也是可以的。
                        //if (queryResponse != null)
                        //{
                        //    result = queryResponse.Body;
                        //}
                        break;

                    case ResultCode.FAIL:
                        StringBuilder sb2 = new StringBuilder();
                        sb2.Append("{\"out_trade_no\":\"" + out_trade_no + "\"}");
                        Cancel(sb2.ToString());
                        break;

                }
            }

            Response.Redirect("Default2.aspx?Text=" + result);
        }

        private AlipayTradePrecreateResponse Prepay(string biz_content)
        {
            AlipayTradePrecreateRequest payRequst = new AlipayTradePrecreateRequest();
            payRequst.BizContent = biz_content;
           
            //需要异步通知的时候，需要是指接收异步通知的地址。
            payRequst.SetNotifyUrl("http://10.5.21.14/notify_url.aspx");

            Dictionary<string, string> paramsDict = (Dictionary<string, string>)payRequst.GetParameters();
            //new DefaultAopClient(Config.serverUrl, Config.appId, Config.merchant_private_key);

            AlipayTradePrecreateResponse payResponse = client.Execute(payRequst);
            return payResponse;
        }




        private AlipayTradeCancelResponse Cancel(string biz_content)
        {
            AlipayTradeCancelRequest cancelRequest = new AlipayTradeCancelRequest();
            cancelRequest.BizContent = biz_content;
            AlipayTradeCancelResponse cancelResponse = client.Execute(cancelRequest);


            if (null != cancelResponse)
            {
                if (cancelResponse.Code == ResultCode.FAIL && cancelResponse.RetryFlag == "Y")
                {
                    //if (cancelResponse.Body.Contains("\"retry_flag\":\"Y\""))		
                    //cancelOrderRetry(biz_content);
                    // 新开一个线程重试撤销
                    ParameterizedThreadStart ParStart = new ParameterizedThreadStart(cancelOrderRetry);
                    Thread myThread = new Thread(ParStart);
                    object o = biz_content;
                    myThread.Start(o);
                }
            }

            return cancelResponse;

        }


        public void cancelOrderRetry(object o)
        {
            int retryCount = 50;

            for (int i = 0; i < retryCount; ++i)
            {

                Thread.Sleep(10000);
                AlipayTradeCancelRequest cancelRequest = new AlipayTradeCancelRequest();
                cancelRequest.BizContent = o.ToString();
                // Dictionary<string, string> paramsDict = (Dictionary<string, string>)cancelRequest.GetParameters();
                AlipayTradeCancelResponse cancelResponse = client.Execute(cancelRequest);

                if (null != cancelResponse)
                {
                    if (cancelResponse.Code == ResultCode.FAIL)
                    {
                        //if (cancelResponse.Body.Contains("\"retry_flag\":\"N\""))		
                        if (cancelResponse.RetryFlag == "N")
                        {
                            break;
                        }
                    }
                    if ((cancelResponse.Code == ResultCode.SUCCESS))
                    {
                        break;
                    }
                }

                if (i == retryCount - 1)
                {
                    // 处理到最后一次，还是未撤销成功，需要在商户数据库中对此单最标记，人工介入处理

                }

            }
        }


        private AlipayTradeQueryResponse LoopQuery(string biz_content)
        {

            AlipayTradeQueryRequest payRequst = new AlipayTradeQueryRequest();
            payRequst.BizContent = biz_content;

            Dictionary<string, string> paramsDict = (Dictionary<string, string>)payRequst.GetParameters();
            AlipayTradeQueryResponse payResponse = null;

            for (int i = 1; i <= 6; i++)
            {
                Thread.Sleep(5000);

                payResponse = client.Execute(payRequst);
                if (string.Compare(payResponse.Code, ResultCode.SUCCESS, false) == 0)
                {
                    if (payResponse.TradeStatus == "TRADE_FINISHED"
                        || payResponse.TradeStatus == "TRADE_SUCCESS"
                        || payResponse.TradeStatus == "TRADE_CLOSED")
                        break;
                }

            }

            StringBuilder sb1 = new StringBuilder();
            sb1.Append("{\"out_trade_no\":\"" + payResponse.OutTradeNo + "\"}");
            biz_content = sb1.ToString();
            Cancel(biz_content);

            return payResponse;

        }
    }

}
