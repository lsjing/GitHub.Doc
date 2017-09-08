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
		    * 1��֧�����ش�,�鿴������Щ�ֶΣ����ص��ֶβ����Ƿ�Ϊ�գ�������ǩ��
		    */
            //��־��¼
            LogWriter logwriter = new LogWriter();
            

		    string getStrPre=Request.QueryString.ToString();
            logwriter.appendToLog("notifyUrl֧�����ص�ַ�����ݣ�" + getStrPre, "d:\\NetLogBFB.log");
	    	//url����
		    string getStr=Server.UrlDecode(getStrPre);
		    //logger.log(Level.INFO,"�������ַ���У�������ַ���:"+getStr+";��ӡ����");
		    //�ѷ��صĲ�����splitȡ����
		    string  []resultStrTemp=getStr.Split('&');
            //ȥ��sign�Ժ�Ĵ�ǩ����
		    string  []resultStr=new String[resultStrTemp.Length-1];
		    //ȡǩ����
            string signtemp = resultStrTemp[resultStrTemp.LongLength - 1];
            int stateInd=signtemp.IndexOf("=")+1;  
		    string sign=signtemp.Substring(stateInd);
            logwriter.appendToLog("�ٶ�Ǯ�����ص�ǩ������" + sign, "d:\\NetLogBFB.log");

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
		    for(int i=0;i<resultStrTemp.Length-1;i++){ 
		    	resultStr[i]=resultStrTemp[i];
		    	sb.AppendLine(resultStr[i]);
		    }
            logwriter.appendToLog("�ٶ�Ǯ�����ز���" , "d:\\NetLogBFB.log");
            logwriter.appendToLog(sb.ToString(), "d:\\NetLogBFB.log");
			/**
			 *2�� ����bfb_sdk_comm��make_sign��������ǩ����
			 * 
			 */
	        
			//ǩ��ƴ�ӣ���Ҫȥ�����ص�ǩ�����ֶ�sign
			String  Localsign=new Common().make_sign(resultStr);
            logwriter.appendToLog("����ǩ������" + Localsign, "d:\\NetLogBFB.log");
            logwriter.appendToLog("�ٸ�������ǩ������" + sign, "d:\\NetLogBFB.log");

			//�ȶ�ǩ��
            if (Request["pay_result"].Equals("1"))
			{
                Response.Write("����ǩ����"+sign.Trim());
                Response.Write("������֤ǩ����" + Localsign.Trim());
				if(sign.Trim().Equals(Localsign.Trim()))
				{    
					
					
					/**
					 * 3��֧��֪ͨ����Ļ�ִ
					 * ���ã�	�յ�֪ͨ������֤ͨ������ٸ��������ִ���ٸ���GET�����̻���return_urlҳ�棬�̻���ߵ���Ӧ
					 * �б���������²��֣��ٸ���ֻ�н��յ��ض�����Ӧ��Ϣ�󣬲���ȷ���̻��Ѿ��յ�֪ͨ������֤ͨ��������
					 * �ٸ����Ų��������̻�����֧�����֪ͨ
					 */
					Response.Write("<HTML><head>");
					Response.Write("<meta name=\"VIP_BFB_PAYMENT\" content=\"BAIFUBAO\">");
					Response.Write("</head>");
					Response.Write("<body>");
					Response.Write("֧���ɹ�����ǩͨ��"+"�����ţ�"+Request["order_no"]+"<br/>");
					Response.Write("�ٸ������ص�ǩ���� :"+sign+"<br/>");
					Response.Write("�������ɵ�ǩ����     :"+Localsign+"<br/>");
					Response.Write("</body></html>");
					/**
					*   ��Ҫ�����յ��ٶ�Ǯ���ĺ�̨֪ͨ���̻��뷵���ض���HTMLҳ�档��ҳ��Ӧ����������Ҫ��
					*	��Ҫ��HTMLͷ�������<meta name="VIP_BFB_PAYMENT" content="BAIFUBAO">
					*	��Ҫ�� �̻�����ͨ���ٸ���������ѯ�ӿ��ٴβ�ѯ����״̬������У��
					*	��Ҫ�� �ò�ѯ�ӿڴ���һ�����ӳ٣��̻����Բ��ö���У�飬���κ�̨��֧�����֪ͨ����
					* */
				}else if(!sign.Trim().Equals(Localsign.Trim()))
				{
					Response.Write("֧���ɹ�����ǩʧ��"+"<br/>");
                    logwriter.appendToLog("֧���ɹ�����ǩʧ��", "d:\\NetLogBFB.log");
				}   
			}else{
				Response.Write("֧��ʧ��"+"<br/>");
                logwriter.appendToLog("֧��ʧ��", "d:\\NetLogBFB.log");
			}
        }
    }
}
