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

namespace BFBWeb
{
    public partial class PayWap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //日志记录
            LogWriter logwriter = new LogWriter();
            /*
             * 1、取配置文件web.config里面的值
             */
            

            //商品分类号BFB_INTERFACE_CURRENTCY
            string service_code =
                    "service_code=" + System.Configuration.ConfigurationManager.AppSettings["BFB_PAY_INTERFACE_SERVICE_ID"];
            //商户号
            string sp_no = "sp_no=" + System.Configuration.ConfigurationManager.AppSettings["SP_NO"];
            //交易的超时时间,当前时间加2天
            DateTime dt1 = DateTime.Now;
            DateTime dt2 = dt1.AddDays(2);
            string expire_time =
                    "expire_time=" + string.Format("{0:yyyyMMddHHmmss}", dt2);

            //订单创建时间
            string order_create_time1 = string.Format("{0:yyyyMMddHHmmss}", dt1);
            string order_create_time = "order_create_time=" + order_create_time1;
            //订单号
            Random Random1 = new Random();
            string order_no = "order_no=" + string.Format("{0:yyyyMMddHHmmssffff}", dt2) + Random1.Next(0, 101);

            //币种
            string currency = "currency=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_CURRENTCY"];
            //编码
            string input_charset = "input_charset=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_ENCODING"];
            //版本
            string version = "version=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_VERSION"];
            //加密方式md5或者hash
            string sign_method = "sign_method=" + System.Configuration.ConfigurationManager.AppSettings["SIGN_METHOD_MD5"];
            //string sign_method = "sign_method=" + scon.getServletContext().getInitParameter("IGN_METHOD_SHA1");
            //提交地址
            string BFB_PAY_WAP_DIRECT_URL = System.Configuration.ConfigurationManager.AppSettings["BFB_PAY_WAP_DIRECT_URL"];

            /*
            * 2、获取页面表单提交的值
            */
            //商品名称
            String tempgoods_name = goods_name_f.Value;
            String goods_name = "goods_name=" + tempgoods_name;
            String goods_name1 = "goods_name=" + Server.UrlDecode(tempgoods_name);
            //String goods_ame1 ="goods_name="+tempgoods_name;
            //商品描述
            String tempgoods_desc = goods_desc_f.Value;
            String goods_desc = "goods_desc=" + tempgoods_desc;
            String goods_desc1 = "goods_desc=" + Server.UrlDecode(tempgoods_desc);
            //商品在商户网站上的URL
            String goods_url = "goods_url=" + goods_url_f.Value;
            String goods_url1 = "goods_url=" + Server.UrlDecode(goods_url_f.Value);

            //单价
            String unit_amount = "unit_amount=" + unit_amount_f.Value;
            //数量
            String unit_count = "unit_count=" + unit_count_f.Value;
            //运费
            String transport_amount = "transport_amount=" + transport_amount_f.Value;
            //总金额
            String total_amount = "total_amount=" + total_amount_f.Value;
            //买家在商户网站的用户名
            String tempSPUserName = buyer_sp_username_f.Value;
            String buyer_sp_username = "buyer_sp_username=" + tempSPUserName;
            String buyer_sp_username1 = "buyer_sp_username=" + Server.UrlDecode(tempSPUserName);
            //后台通知地址
            String return_url = "return_url=" + return_url_f.Value;
            String return_url1 = "return_url=" + Server.UrlDecode(return_url_f.Value);
            //前台通知地址
            String page_url = "page_url=" + page_url_f.Value;
            String page_url1 = "page_url=" + Server.UrlDecode(page_url_f.Value);
            //支付方式
            String pay_type = "pay_type=" + pay_type_f.Value;
            //默认银行的编码
            String bank_no = "bank_no=" + bank_no_f.Value;
            //用户在商户端的用户ID
            String sp_uno = "sp_uno=" + sp_uno_f.Value;
            //商户自定义数据
            String tempextra = extra_f.Value.Trim();
            String extra = "extra=" + tempextra;
            String extra1 = "extra=" + Server.UrlDecode(tempextra);


            //签名串拼接数组
            string[] array ={
			    service_code,
				sp_no,
				order_create_time,
				order_no,
				goods_name,
				goods_desc,
				goods_url,
				unit_amount,
				unit_count,
				transport_amount,
				total_amount,
				currency,
				buyer_sp_username ,
				return_url,
				page_url,
				pay_type,
				bank_no,
				expire_time,
				input_charset,
				version,
				sign_method
				,extra
				};
            //浏览器参数拼接数组
            string[] array1 ={
			    service_code,
				sp_no,
				order_create_time,
				order_no,
				goods_name1,
				goods_desc1,
				goods_url1,
				unit_amount,
				unit_count,
				transport_amount,
				total_amount,
				currency,
				buyer_sp_username1,
				return_url1,
				page_url1,
				pay_type,
				bank_no,
				expire_time,
				input_charset,
				version,
				sign_method
				,extra1
				};
            /**
		     * 3、调用common.cs里create_baifubao_pay_order_url方法生成百付宝即时到账支付接口URL(不需要登录)
		     *  array是待签名串
		     *  array1地址栏拼接串
		     */
            string getURL = new Common().create_baifubao_url(array, array1, BFB_PAY_WAP_DIRECT_URL);
            //Response.Write(new Common().make_sign(array));
            logwriter.appendToLog("提交串：" + getURL, "d:\\NetLogBFB.log");
            Response.Redirect(getURL);

        } 
    }
}
