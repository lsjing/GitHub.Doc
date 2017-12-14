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
using  System.Net ;   
using System.Xml;
using System.IO;
using System.Text;


namespace BFBWeb
{
    public partial class QueryOrderByNo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //日志记录
            LogWriter logwriter = new LogWriter();
            /**
		     * 1、获取 web.xml的常量值
	         */
            //商品分类号
            string service_code =
                    "service_code=" + System.Configuration.ConfigurationManager.AppSettings["BFB_QUERY_INTERFACE_SERVICE_ID"];
            //商户号
            string sp_no = "sp_no=" + System.Configuration.ConfigurationManager.AppSettings["SP_NO"];

            string output_charset = "output_charset=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_ENCODING"];
            //返回格式
            string output_type = "output_type=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_OUTPUT_FORMAT"];
            //版本
            string version = "version=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_VERSION"];
            //加密方式md5或者hash,此处用的md5
            string sign_method = "sign_method=" + System.Configuration.ConfigurationManager.AppSettings["SIGN_METHOD_MD5"];
            //string sign_method = "sign_method=" + System.Configuration.ConfigurationManager.AppSettings["SIGN_METHOD_SHA1"];
            //提交地址
            string BFB_QUERY_ORDER_URL = System.Configuration.ConfigurationManager.AppSettings["BFB_QUERY_ORDER_URL"];
            /**
             *2、获取pay_unlogin.html页面提交的变量值_订单号
             */
            //订单号
            string order_no = "order_no=" + order_no_f.Value.Trim();

            //给提交参数数值赋值
            string[] array ={
				order_no,
				output_type,
				output_charset,
				service_code,
				sign_method,
				sp_no,
				version};
            /**
             * 3、调用bfb_sdk_comm里create_baifubao_url方法生成百度钱包即时到账支付接口URL(不需要登录)
             *
             */
            string getURL = new Common().create_baifubao_url(array, array, BFB_QUERY_ORDER_URL);
            /**
             * 4、向百度钱包发起订单查询请求
             */
            string data = "";
            HttpWebRequest webReqst = (HttpWebRequest)WebRequest.Create(getURL);
            webReqst.Method = "GET";
            webReqst.KeepAlive = true;
            //如果在接收后想保存CookieContainer并再次提交（比如登录后操作）  
            //必须保证url的域名前面有www，比如http://www.a.com，  
            webReqst.Timeout = 30000;

            /**
             *5、接收百度钱包返回数据,返回数据是XML格式
             */
            HttpWebResponse webResponse = (HttpWebResponse)webReqst.GetResponse();
            
            if (webResponse.StatusCode == HttpStatusCode.OK && webResponse.ContentLength < 1024 * 1024)
            {
                StreamReader reader = new StreamReader(webResponse.GetResponseStream(), System.Text.Encoding.Default);
                data = reader.ReadToEnd();
                string streamString = data.Trim().Replace("\n", "");//去掉换行符

                /**
                 *6、解析XML
                 */
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.LoadXml(streamString);//加载文档

                //得到根节点下所有子节点。是一个list集合
                XmlNodeList selectNL = xmldoc.SelectNodes("response");
                XmlElement xmlEle;
                Response.Write("百度钱包返回数据" + "<br/>");
                foreach (XmlNode node in selectNL)
                {
                    xmlEle = (XmlElement)node;
                    XmlNodeList childnode =xmlEle.ChildNodes;
                    //返回xml数据response的子节点个数
                    int count = childnode.Count;
                    //返回xml数据载入字符串数组arry
                    string []arryTemp=new string[count];
                    string[] arry= new string[count - 1];
                    int  i=0;
                    System.Text.StringBuilder sb = new StringBuilder();
                    foreach (XmlNode xmlnode in childnode)
                    {
                        arryTemp[i] = xmlnode.Name + "=" + xmlnode.InnerText;
                        sb.AppendLine(arryTemp[i]+"<br/>");
                        i++;
                    }
                    Response.Write("百度钱包查询返回数据<br/>");
                    Response.Write(sb.ToString());
                    logwriter.appendToLog("百度钱包查询返回数据：" + sb.ToString(), "d:\\NetLogBFB.log");
                    for (int j = 0; j < count - 1; j++) 
                    {
                        arry[j] = arryTemp[j];
                    }
                    /**
                     *7、调用签名方法Common().make_sign，对返回数据进行验证
                     */
                    string backSignTemp = arryTemp[count - 1];
                    string backSign = backSignTemp.Substring(backSignTemp.IndexOf("=") + 1);
                    string localSign = new Common().make_sign(arry);
                    Response.Write("百度钱包返回的签名：" + backSign + "<br/>");
                    Response.Write("本地签名：" + localSign + "<br/>");
                    if (backSign.Equals(localSign))
                    {
                        Response.Write("接收返回数据成功，验签通过，系百度钱包返回数据" + "<br/>");
                    }
                    else {
                        Response.Write("验签失败，不是百度钱包返回数据，请提供警惕" + "<br/>");
                    
                    }
                }
               
              }
              
              
          }
         
    }
}