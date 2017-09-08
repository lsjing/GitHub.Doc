using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace BFBWeb
{
    public class Common
    {
       
         /**
	     * ���ɰٸ�����ʱ����֧���ӿڶ�Ӧ��URL
	     *
	     * @param array $params	���ɶ����Ĳ������飬���������ȡֵ�μ��ӿ��ĵ�
	     * @param string $url   �ٸ�����ʱ����֧���ӿ�URL
	     * @return string �������ɵİٸ�����ʱ����֧���ӿ�URL
	     * @throws UnsupportedEncodingException 
	     */
	    public String   create_baifubao_url(String[] ary,String[] ary1 ,String url) 
	    {
		    //�����жϴ���ı�ѡ�����Ƿ�Ϊ��
		    //����make_sign����������ǩ�����sign�������������ǩ�� 
            StringBuilder sb = new StringBuilder(); 

		    for(int i = 0; i < ary1.Length; i++)
		    { 
			    //�ж����Ե�ֵ�Ƿ�Ϊ��,ֵΪ�յĲ��ò���ƴ��
			    //string strTemp=ary1[i].Substring(ary1[i].IndexOf("=")+1, ary1[i].Length);
			    //if(!strTemp.Equals("") && strTemp!=null)
			    //{
                   sb.Append(ary1[i]+"&");
                //}	
		    } 
		    String newStr =sb.ToString();
            Console.WriteLine(newStr);
            String sign=make_sign(ary);
            //�� URL get���ύ������ 
            //�ύ
            String urlGet=url+"?"+newStr+"sign="+sign;
		    return  urlGet;
	    }
        /**
         * ���������ǩ�����������Ϊ���飬�㷨���£�
         * 1.
         * �����鰴KEY������������
         * 2. ������������������̻���Կ������Ϊkey����ֵΪ�̻���Կ
         * 3. ������ƴ�ӳ��ַ�������key=value&key=value����ʽ����ƴ�ӣ�ע�����ﲻ��ֱ�ӵ���
         * http_build_query��������Ϊ�÷�����Բ�������URL����
         * 4. Ҫ�����������е�$params ['sign_method']����ļ����㷨����ƴ�Ӻõ��ַ������м��ܣ����ɵı���ǩ����
         * $params ['sign_method']����1ʹ��md5���ܣ�����2ʹ��sha-1����
         *
         * @param array $params ����ǩ��������
         * @return string | boolean �ɹ���������ǩ����ʧ�ܷ���false
         */
         public String   make_sign(String[] ary)
         {
            
            Array.Sort(ary);   
            //�Բ���������а�key��������,Ȼ��ƴ�ӣ�������5ǩ������ 

            StringBuilder sb = new StringBuilder(); 
            for(int i = 0; i < ary.Length; i++)
            {
                sb.Append(ary[i] + "&");	
            }
            string keyStr = System.Configuration.ConfigurationManager.AppSettings["SP_KEY_FILE"];
            string newStrTemp = sb.ToString()+"key="+keyStr;
            //��־��¼
            LogWriter newlogwriter =new  LogWriter();
            newlogwriter.appendToLog("��ǩ������"+newStrTemp, "d:\\NetLogBFB.log");
            //��ȡsign_method
            String signmethod = System.Configuration.ConfigurationManager.AppSettings["SIGN_METHOD_MD5"];
            //����sign_methodѡ��ʹ��MD5ǩ��1�����ǹ�ϣǩ��2
            String sign=null;
            if(signmethod.Equals("1")){
                sign = GetMD5(newStrTemp).ToLower(); 
            }
            else if (signmethod.Equals("2"))
            {
                sign = GetSHA1(newStrTemp).ToLower();
            }
            return sign;;
            }
            /**
	         * MD5ֵ����<p>
	         * MD5���㷨��RFC1321 �ж���:
	         * ��RFC 1321�У�������Test suite�����������ʵ���Ƿ���ȷ��
	         * MD5 ("") = d41d8cd98f00b204e9800998ecf8427e
	         * MD5 ("a") = 0cc175b9c0f1b6a831c399e269772661
	         * MD5 ("abc") = 900150983cd24fb0d6963f7d28e17f72
	         * MD5 ("message digest") = f96b697d7cb7938d525a2f31aaf161d0
	         * MD5 ("abcdefghijklmnopqrstuvwxyz") = c3fcd3d76192e4007dfb496cca67e13b
	         *
	         * @param res Դ�ַ���
	         * @return md5ֵ
	         */
            public string GetMD5(string encryptString)
            {

                byte[] result = Encoding.Default.GetBytes(encryptString);

                MD5 md5 = new MD5CryptoServiceProvider();

                byte[] output = md5.ComputeHash(result);

                string encryptResult = BitConverter.ToString(output).Replace("-", "");
                encryptResult.ToLower();
                return encryptResult;

            }
            /**
	         * sha1ֵ����<p>
	         * @return sha1ֵ
	         */
            public string GetSHA1(string text)
            {
                byte[] cleanBytes = System.Text.Encoding.GetEncoding("gbk").GetBytes(text);
                byte[] hashedBytes = System.Security.Cryptography.SHA1.Create().ComputeHash(cleanBytes);
                return BitConverter.ToString(hashedBytes).Replace("-", "");
            }


            /**
             * ��ѯ����������÷�����Ҫ�̻��Լ�ʵ�֣������ǲ�ѯ�̻��Լ���ϵͳ����֤�ö����Ƿ��Ѿ���������.
             * ���ڰٸ����ĺ�̨֪ͨ�ӿڿ��ܻ���ö�Σ�����˴��̻������������ֱ�ӽ��м��˵Ⱥ���������
             * ���ܻ�һ���������̻���ϵͳ���ظ���¼������̻����ʽ�ȱʧ.
             *
             * @param string $order_no        	
             * @return int ����������ڵȴ�֧��״̬������sp_conf::SP_PAY_RESULT_WAITING
             *         ��������û�Ҳ�����Լ�����
             */
            public String query_order_state(String order_no)
            {
                /*
                 * ������Ҫ�̻��Լ�ʵ�ֲ�ѯ�����ҵ���߼�,���ض���״̬,������ֻ�Ǽ򵥵ķ���1
                 */
                return "1";
            }

        }
}
