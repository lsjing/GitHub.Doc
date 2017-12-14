using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;

namespace BFBWeb
{
    public partial class PageUrl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /**
		    * 1、支付返回串,查看返回那些字段，返回的字段不管是否为空，均参与签名
		    */
            //日志记录
            LogWriter logwriter = new LogWriter();
            

		    string getStrPre=Request.QueryString.ToString();
            logwriter.appendToLog("notifyUrl支付返回地址栏数据：" + getStrPre, "d:\\NetLogBFB.log");
	    	//url解码
		    string getStr=Server.UrlDecode(getStrPre);
		    //logger.log(Level.INFO,"浏览器地址栏中？后面的字符串:"+getStr+";打印结束");
		    //把返回的参数用split取出来
		    string  []resultStrTemp=getStr.Split('&');
            //去掉sign以后的待签名串
		    string  []resultStr=new String[resultStrTemp.Length-1];
		    //取签名串
            string signtemp = resultStrTemp[resultStrTemp.LongLength - 1];
            int stateInd=signtemp.IndexOf("=")+1;  
		    string sign=signtemp.Substring(stateInd);
            logwriter.appendToLog("百度钱包返回的签名串：" + sign, "d:\\NetLogBFB.log");

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
		    for(int i=0;i<resultStrTemp.Length-1;i++){ 
		    	resultStr[i]=resultStrTemp[i];
		    	sb.AppendLine(resultStr[i]);
		    }
            logwriter.appendToLog("百度钱包返回参数" , "d:\\NetLogBFB.log");
            logwriter.appendToLog(sb.ToString(), "d:\\NetLogBFB.log");
			/**
			 *2、 调用bfb_sdk_comm里make_sign方法生成签名串
			 * 
			 */
	        
			//签名拼接，需要去掉返回的签名串字段sign
			String  Localsign=new Common().make_sign(resultStr);
            logwriter.appendToLog("本地签名串：" + Localsign, "d:\\NetLogBFB.log");
            logwriter.appendToLog("百付宝返回签名串：" + sign, "d:\\NetLogBFB.log");

			//比对签名
            if (Request["pay_result"].Equals("1"))
			{
                Response.Write("返回签名册"+sign.Trim());
                Response.Write("本地验证签名串" + Localsign.Trim());
				if(sign.Trim().Equals(Localsign.Trim()))
				{    
					
					
					/**
					 * 3、支付通知结果的回执
					 * 作用：	收到通知，并验证通过，向百付宝发起回执。百付宝GET请求商户的return_url页面，商户这边的响应
					 * 中必须包含以下部分，百付宝只有接收到特定的响应信息后，才能确认商户已经收到通知，并验证通过。这样
					 * 百付宝才不会再向商户发送支付结果通知
					 */
					Response.Write("<HTML><head>");
					Response.Write("<meta name=\"VIP_BFB_PAYMENT\" content=\"BAIFUBAO\">");
					Response.Write("</head>");
					Response.Write("<body>");
					Response.Write("支付成功，验签通过"+"订单号："+Request["order_no"]+"<br/>");
					Response.Write("百付宝返回的签名串 :"+sign+"<br/>");
					Response.Write("本地生成的签名串     :"+Localsign+"<br/>");
					Response.Write("</body></html>");
					/**
					*   重要：接收到百度钱包的后台通知后，商户须返回特定的HTML页面。该页面应该满足以下要求：
					*	重要：HTML头部须包括<meta name="VIP_BFB_PAYMENT" content="BAIFUBAO">
					*	重要： 商户可以通过百付宝订单查询接口再次查询订单状态，二次校验
					*	重要： 该查询接口存在一定的延迟，商户可以不用二次校验，信任后台的支付结果通知便行
					* */
				}else if(!sign.Trim().Equals(Localsign.Trim()))
				{
					Response.Write("支付成功，验签失败"+"<br/>");
                    logwriter.appendToLog("支付成功，验签失败", "d:\\NetLogBFB.log");
				}   
			}else{
				Response.Write("支付失败"+"<br/>");
                logwriter.appendToLog("支付失败", "d:\\NetLogBFB.log");
			}
        }
    }
}
