using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Collections.Specialized;
using System.IO;
using Aop.Api.Util;
using Aop.Api.Request;
using Aop.Api.Response;
using Jayrock.Json;

namespace Alipay.Demo
{


    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Output.WriteLine(Request.QueryString["biz_content"]);
            //string biz_content = Request.QueryString["biz_content"];
            //getEventType(biz_content);

            //  string alipay_public_key = HttpRuntime.AppDomainAppPath.ToString() + "Demo/alipay_rsa_public_key.pem";
            //   Response.Output.WriteLine(alipay_public_key);
            //string merchant_public_key = Server.MapPath("Test/rsa_public_key.pem");
            //  string merchant_private_key = Server.MapPath("Demo/rsa_private_key.pem");
            //string alipay_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";
            //string merchant_private_key = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAPCjD01sO2LE8UgeIIBpoxMHdK1Hd4Y8yorjk4MBbK2Y9l/kHZ9b0qIDCEizhOsCKcmoBp92860Zr1zz6/eRPmjOg+Vyq90GeM9/4PfycsYpwPUpNXoExoY5U0vGTPpMlu5hX3u+FvcGS1PIq9v4N9ROh70hlO42QU9g8jZu822TAgMBAAECgYBsKq/POo57OFHI/BnZ/yIZhKly1oQoqBzXT7LYGYTTh8V/lxelsW29+6T2oRNnXAKSrd/EQIEKV1hXbSGtl/E35jHlaPU/G9QZFecn9BDy6UXIHTZYzS+2oS0/5NbH1/s4/sdA0+pdyh82itrMFXGttQkar6ZptQlUkKsCnY7wKQJBAPhs614DAc542USoD3tIJ4LJZzhxOesKdBLIn+JTAGn8iwjhxo2mXKFvZhpnxoa7H8a9gmqw7e7Qad0x7+ScDucCQQD3+VjmJ0mFVKxSj8ifjMqWT5TMB5/KaE8lnOcNNHILYodW/oPYfrNvN7T4Cp32OI56raZ0qba/qtzTGoKwHLJ1AkAwgDtXiGjC4c8xW0pifEzSePXBDEINhGXzAN5ONnw/NQIEAuhb4V32WqRphVc6GLB0ga1DnTVmyaPRfp1iWaGDAkB35hCd+BEMbsyDfxI6UxEBbKk9ndIdRCJAxYTSVbFu380gux905o5MEFtoM3n9O4totd3uOsEqG6t6Ry85iCahAkEA4igXN+wZQjqT4vzBmkZfmvzpQKCkdKsOIzDZjfCZICY27KR6twxTj/nWpuT9VVMpVy1GX+pSBL1VrDwtLYcEpg==";
            // string merchant_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDwow9NbDtixPFIHiCAaaMTB3StR3eGPMqK45ODAWytmPZf5B2fW9KiAwhIs4TrAinJqAafdvOtGa9c8+v3kT5ozoPlcqvdBnjPf+D38nLGKcD1KTV6BMaGOVNLxkz6TJbuYV97vhb3BktTyKvb+DfUToe9IZTuNkFPYPI2bvNtkwIDAQAB";

            //string sign = AlipaySignature.encryptAndSign("<success>true</succtss><biz_content>"+Config.merchant_public_key+"</bizcontent/>", Config.alipay_public_key, Config.merchant_private_key, "GBK", false, true);
            //Response.Output.WriteLine(sign);
            //Response.Output.WriteLine();
            // verifygwResponse("true",merchant_public_key,sign);
            //Response.Output.WriteLine(GetUrlParam());
            // Response_Xml();

            // string pemdir = Server.MapPath("Test/");
            // Response.Output.WriteLine(EncryptAndSign(pemdir));

            //Response.Output.WriteLine(Server.MapPath("Test/aop-sandbox-RSA-private-c#.pem"));
            //Response.Output.WriteLine(File.Exists(Server.MapPath("Test/aop-sandbox-RSA-private-c#.pem")));
            //Response.End();
            //verifygw_success_response();

           

        }

       

      

       

       

       

       

       
        


        public void Response_Xml()
        {
            //设置 HTTP 头
            Response.ContentType = "text/xml";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GBK");
            Response.Clear();
            XmlTextWriter writer = null;
            writer = new XmlTextWriter(Response.Output);
            writer.Formatting = Formatting.Indented;
            writer.WriteStartDocument();
            writer.WriteStartElement("root");
            writer.WriteStartElement("appid");
            writer.WriteString("aaa");
            writer.WriteEndElement();

            writer.WriteStartElement("status");
            writer.WriteString("0");
            writer.WriteEndElement();

            writer.WriteStartElement("needcookie");
            writer.WriteString("2");
            writer.WriteEndElement();

            writer.WriteEndElement();
            writer.WriteEndDocument();
            Response.End();
        }



    }
}