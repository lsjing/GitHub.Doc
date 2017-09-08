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
            //��־��¼
            LogWriter logwriter = new LogWriter();
            /**
		     * 1����ȡ web.xml�ĳ���ֵ
	         */
            //��Ʒ�����
            string service_code =
                    "service_code=" + System.Configuration.ConfigurationManager.AppSettings["BFB_QUERY_INTERFACE_SERVICE_ID"];
            //�̻���
            string sp_no = "sp_no=" + System.Configuration.ConfigurationManager.AppSettings["SP_NO"];

            string output_charset = "output_charset=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_ENCODING"];
            //���ظ�ʽ
            string output_type = "output_type=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_OUTPUT_FORMAT"];
            //�汾
            string version = "version=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_VERSION"];
            //���ܷ�ʽmd5����hash,�˴��õ�md5
            string sign_method = "sign_method=" + System.Configuration.ConfigurationManager.AppSettings["SIGN_METHOD_MD5"];
            //string sign_method = "sign_method=" + System.Configuration.ConfigurationManager.AppSettings["SIGN_METHOD_SHA1"];
            //�ύ��ַ
            string BFB_QUERY_ORDER_URL = System.Configuration.ConfigurationManager.AppSettings["BFB_QUERY_ORDER_URL"];
            /**
             *2����ȡpay_unlogin.htmlҳ���ύ�ı���ֵ_������
             */
            //������
            string order_no = "order_no=" + order_no_f.Value.Trim();

            //���ύ������ֵ��ֵ
            string[] array ={
				order_no,
				output_type,
				output_charset,
				service_code,
				sign_method,
				sp_no,
				version};
            /**
             * 3������bfb_sdk_comm��create_baifubao_url�������ɰٶ�Ǯ����ʱ����֧���ӿ�URL(����Ҫ��¼)
             *
             */
            string getURL = new Common().create_baifubao_url(array, array, BFB_QUERY_ORDER_URL);
            /**
             * 4����ٶ�Ǯ�����𶩵���ѯ����
             */
            string data = "";
            HttpWebRequest webReqst = (HttpWebRequest)WebRequest.Create(getURL);
            webReqst.Method = "GET";
            webReqst.KeepAlive = true;
            //����ڽ��պ��뱣��CookieContainer���ٴ��ύ�������¼�������  
            //���뱣֤url������ǰ����www������http://www.a.com��  
            webReqst.Timeout = 30000;

            /**
             *5�����հٶ�Ǯ����������,����������XML��ʽ
             */
            HttpWebResponse webResponse = (HttpWebResponse)webReqst.GetResponse();
            
            if (webResponse.StatusCode == HttpStatusCode.OK && webResponse.ContentLength < 1024 * 1024)
            {
                StreamReader reader = new StreamReader(webResponse.GetResponseStream(), System.Text.Encoding.Default);
                data = reader.ReadToEnd();
                string streamString = data.Trim().Replace("\n", "");//ȥ�����з�

                /**
                 *6������XML
                 */
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.LoadXml(streamString);//�����ĵ�

                //�õ����ڵ��������ӽڵ㡣��һ��list����
                XmlNodeList selectNL = xmldoc.SelectNodes("response");
                XmlElement xmlEle;
                Response.Write("�ٶ�Ǯ����������" + "<br/>");
                foreach (XmlNode node in selectNL)
                {
                    xmlEle = (XmlElement)node;
                    XmlNodeList childnode =xmlEle.ChildNodes;
                    //����xml����response���ӽڵ����
                    int count = childnode.Count;
                    //����xml���������ַ�������arry
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
                    Response.Write("�ٶ�Ǯ����ѯ��������<br/>");
                    Response.Write(sb.ToString());
                    logwriter.appendToLog("�ٶ�Ǯ����ѯ�������ݣ�" + sb.ToString(), "d:\\NetLogBFB.log");
                    for (int j = 0; j < count - 1; j++) 
                    {
                        arry[j] = arryTemp[j];
                    }
                    /**
                     *7������ǩ������Common().make_sign���Է������ݽ�����֤
                     */
                    string backSignTemp = arryTemp[count - 1];
                    string backSign = backSignTemp.Substring(backSignTemp.IndexOf("=") + 1);
                    string localSign = new Common().make_sign(arry);
                    Response.Write("�ٶ�Ǯ�����ص�ǩ����" + backSign + "<br/>");
                    Response.Write("����ǩ����" + localSign + "<br/>");
                    if (backSign.Equals(localSign))
                    {
                        Response.Write("���շ������ݳɹ�����ǩͨ����ϵ�ٶ�Ǯ����������" + "<br/>");
                    }
                    else {
                        Response.Write("��ǩʧ�ܣ����ǰٶ�Ǯ���������ݣ����ṩ����" + "<br/>");
                    
                    }
                }
               
              }
              
              
          }
         
    }
}