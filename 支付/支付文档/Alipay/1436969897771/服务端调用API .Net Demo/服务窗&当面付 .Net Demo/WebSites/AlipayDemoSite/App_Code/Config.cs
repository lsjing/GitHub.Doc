using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Config
/// </summary>
namespace Alipay.Demo
{
    public class Config
    {
        public static string alipay_public_key = HttpRuntime.AppDomainAppPath.ToString() + "Demo\\alipay_rsa_public_key.pem";
        //这里要配置没有经过PKCS8转换的原始私钥
        public static string merchant_private_key = HttpRuntime.AppDomainAppPath.ToString() + "Demo\\rsa_private_key.pem";
         public static string merchant_public_key = HttpRuntime.AppDomainAppPath.ToString() + "Demo\\rsa_public_key.pem";
         public static string charset = "GBK";
         public static string appId = "2014071800007108";
         public static string serverUrl = "https://openapi.alipay.com/gateway.do";

        public Config()
        {
            //
            // TODO: Add constructor logic here
            //

        }

        public static string getMerchantPublicKeyStr()
        {
            StreamReader sr = new StreamReader(merchant_public_key);
            string pubkey = sr.ReadToEnd();
            sr.Close();
            if (pubkey != null)
            {
              pubkey=  pubkey.Replace("-----BEGIN PUBLIC KEY-----", "");
              pubkey = pubkey.Replace("-----END PUBLIC KEY-----", "");
              pubkey = pubkey.Replace("\r", "");
              pubkey = pubkey.Replace("\n", "");
            }
            return pubkey;
        }
    }
}