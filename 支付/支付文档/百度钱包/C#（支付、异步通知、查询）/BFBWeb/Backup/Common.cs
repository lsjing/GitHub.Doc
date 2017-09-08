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
	     * 生成百付宝即时到账支付接口对应的URL
	     *
	     * @param array $params	生成订单的参数数组，具体参数的取值参见接口文档
	     * @param string $url   百付宝即时到账支付接口URL
	     * @return string 返回生成的百付宝即时到账支付接口URL
	     * @throws UnsupportedEncodingException 
	     */
	    public String   create_baifubao_url(String[] ary,String[] ary1 ,String url) 
	    {
		    //首先判断传入的必选参数是否为空
		    //调用make_sign方法，返回签名结果sign，给参数排序和签名 
            StringBuilder sb = new StringBuilder(); 

		    for(int i = 0; i < ary1.Length; i++)
		    { 
			    //判断属性的值是否为空,值为空的不用参与拼接
			    //string strTemp=ary1[i].Substring(ary1[i].IndexOf("=")+1, ary1[i].Length);
			    //if(!strTemp.Equals("") && strTemp!=null)
			    //{
                   sb.Append(ary1[i]+"&");
                //}	
		    } 
		    String newStr =sb.ToString();
            Console.WriteLine(newStr);
            String sign=make_sign(ary);
            //组 URL get串提交串参数 
            //提交
            String urlGet=url+"?"+newStr+"sign="+sign;
		    return  urlGet;
	    }
        /**
         * 计算数组的签名，传入参数为数组，算法如下：
         * 1.
         * 对数组按KEY进行升序排序
         * 2. 在排序后的数组中添加商户密钥，键名为key，键值为商户密钥
         * 3. 将数组拼接成字符串，以key=value&key=value的形式进行拼接，注意这里不能直接调用
         * http_build_query方法，因为该方法会对参数进行URL编码
         * 4. 要所传入数组中的$params ['sign_method']定义的加密算法，对拼接好的字符串进行加密，生成的便是签名。
         * $params ['sign_method']等于1使用md5加密，等于2使用sha-1加密
         *
         * @param array $params 生成签名的数组
         * @return string | boolean 成功返回生成签名，失败返回false
         */
         public String   make_sign(String[] ary)
         {
            
            Array.Sort(ary);   
            //对参数数组进行按key升序排列,然后拼接，最后调用5签名方法 

            StringBuilder sb = new StringBuilder(); 
            for(int i = 0; i < ary.Length; i++)
            {
                sb.Append(ary[i] + "&");	
            }
            string keyStr = System.Configuration.ConfigurationManager.AppSettings["SP_KEY_FILE"];
            string newStrTemp = sb.ToString()+"key="+keyStr;
            //日志记录
            LogWriter newlogwriter =new  LogWriter();
            newlogwriter.appendToLog("待签名串："+newStrTemp, "d:\\NetLogBFB.log");
            //获取sign_method
            String signmethod = System.Configuration.ConfigurationManager.AppSettings["SIGN_METHOD_MD5"];
            //根据sign_method选择使用MD5签名1，还是哈希签名2
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
	         * MD5值计算<p>
	         * MD5的算法在RFC1321 中定义:
	         * 在RFC 1321中，给出了Test suite用来检验你的实现是否正确：
	         * MD5 ("") = d41d8cd98f00b204e9800998ecf8427e
	         * MD5 ("a") = 0cc175b9c0f1b6a831c399e269772661
	         * MD5 ("abc") = 900150983cd24fb0d6963f7d28e17f72
	         * MD5 ("message digest") = f96b697d7cb7938d525a2f31aaf161d0
	         * MD5 ("abcdefghijklmnopqrstuvwxyz") = c3fcd3d76192e4007dfb496cca67e13b
	         *
	         * @param res 源字符串
	         * @return md5值
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
	         * sha1值计算<p>
	         * @return sha1值
	         */
            public string GetSHA1(string text)
            {
                byte[] cleanBytes = System.Text.Encoding.GetEncoding("gbk").GetBytes(text);
                byte[] hashedBytes = System.Security.Cryptography.SHA1.Create().ComputeHash(cleanBytes);
                return BitConverter.ToString(hashedBytes).Replace("-", "");
            }


            /**
             * 查询订单情况，该方法需要商户自己实现，作用是查询商户自己的系统，验证该订单是否已经被处理了.
             * 由于百付宝的后台通知接口可能会调用多次，如果此处商户如果不处理，就直接进行记账等后续操作，
             * 可能会一个订单在商户的系统里重复记录，造成商户的资金缺失.
             *
             * @param string $order_no        	
             * @return int 如果订单处于等待支付状态，返回sp_conf::SP_PAY_RESULT_WAITING
             *         其它情况用户也可以自己定义
             */
            public String query_order_state(String order_no)
            {
                /*
                 * 这里需要商户自己实现查询的相关业务逻辑,返回订单状态,我这里只是简单的返回1
                 */
                return "1";
            }

        }
}
