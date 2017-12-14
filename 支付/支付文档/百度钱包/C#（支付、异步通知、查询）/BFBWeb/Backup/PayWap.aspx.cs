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
            //��־��¼
            LogWriter logwriter = new LogWriter();
            /*
             * 1��ȡ�����ļ�web.config�����ֵ
             */
            

            //��Ʒ�����BFB_INTERFACE_CURRENTCY
            string service_code =
                    "service_code=" + System.Configuration.ConfigurationManager.AppSettings["BFB_PAY_INTERFACE_SERVICE_ID"];
            //�̻���
            string sp_no = "sp_no=" + System.Configuration.ConfigurationManager.AppSettings["SP_NO"];
            //���׵ĳ�ʱʱ��,��ǰʱ���2��
            DateTime dt1 = DateTime.Now;
            DateTime dt2 = dt1.AddDays(2);
            string expire_time =
                    "expire_time=" + string.Format("{0:yyyyMMddHHmmss}", dt2);

            //��������ʱ��
            string order_create_time1 = string.Format("{0:yyyyMMddHHmmss}", dt1);
            string order_create_time = "order_create_time=" + order_create_time1;
            //������
            Random Random1 = new Random();
            string order_no = "order_no=" + string.Format("{0:yyyyMMddHHmmssffff}", dt2) + Random1.Next(0, 101);

            //����
            string currency = "currency=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_CURRENTCY"];
            //����
            string input_charset = "input_charset=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_ENCODING"];
            //�汾
            string version = "version=" + System.Configuration.ConfigurationManager.AppSettings["BFB_INTERFACE_VERSION"];
            //���ܷ�ʽmd5����hash
            string sign_method = "sign_method=" + System.Configuration.ConfigurationManager.AppSettings["SIGN_METHOD_MD5"];
            //string sign_method = "sign_method=" + scon.getServletContext().getInitParameter("IGN_METHOD_SHA1");
            //�ύ��ַ
            string BFB_PAY_WAP_DIRECT_URL = System.Configuration.ConfigurationManager.AppSettings["BFB_PAY_WAP_DIRECT_URL"];

            /*
            * 2����ȡҳ����ύ��ֵ
            */
            //��Ʒ����
            String tempgoods_name = goods_name_f.Value;
            String goods_name = "goods_name=" + tempgoods_name;
            String goods_name1 = "goods_name=" + Server.UrlDecode(tempgoods_name);
            //String goods_ame1 ="goods_name="+tempgoods_name;
            //��Ʒ����
            String tempgoods_desc = goods_desc_f.Value;
            String goods_desc = "goods_desc=" + tempgoods_desc;
            String goods_desc1 = "goods_desc=" + Server.UrlDecode(tempgoods_desc);
            //��Ʒ���̻���վ�ϵ�URL
            String goods_url = "goods_url=" + goods_url_f.Value;
            String goods_url1 = "goods_url=" + Server.UrlDecode(goods_url_f.Value);

            //����
            String unit_amount = "unit_amount=" + unit_amount_f.Value;
            //����
            String unit_count = "unit_count=" + unit_count_f.Value;
            //�˷�
            String transport_amount = "transport_amount=" + transport_amount_f.Value;
            //�ܽ��
            String total_amount = "total_amount=" + total_amount_f.Value;
            //������̻���վ���û���
            String tempSPUserName = buyer_sp_username_f.Value;
            String buyer_sp_username = "buyer_sp_username=" + tempSPUserName;
            String buyer_sp_username1 = "buyer_sp_username=" + Server.UrlDecode(tempSPUserName);
            //��̨֪ͨ��ַ
            String return_url = "return_url=" + return_url_f.Value;
            String return_url1 = "return_url=" + Server.UrlDecode(return_url_f.Value);
            //ǰ̨֪ͨ��ַ
            String page_url = "page_url=" + page_url_f.Value;
            String page_url1 = "page_url=" + Server.UrlDecode(page_url_f.Value);
            //֧����ʽ
            String pay_type = "pay_type=" + pay_type_f.Value;
            //Ĭ�����еı���
            String bank_no = "bank_no=" + bank_no_f.Value;
            //�û����̻��˵��û�ID
            String sp_uno = "sp_uno=" + sp_uno_f.Value;
            //�̻��Զ�������
            String tempextra = extra_f.Value.Trim();
            String extra = "extra=" + tempextra;
            String extra1 = "extra=" + Server.UrlDecode(tempextra);


            //ǩ����ƴ������
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
            //���������ƴ������
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
		     * 3������common.cs��create_baifubao_pay_order_url�������ɰٸ�����ʱ����֧���ӿ�URL(����Ҫ��¼)
		     *  array�Ǵ�ǩ����
		     *  array1��ַ��ƴ�Ӵ�
		     */
            string getURL = new Common().create_baifubao_url(array, array1, BFB_PAY_WAP_DIRECT_URL);
            //Response.Write(new Common().make_sign(array));
            logwriter.appendToLog("�ύ����" + getURL, "d:\\NetLogBFB.log");
            Response.Redirect(getURL);

        } 
    }
}
