using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace Utils
{
    class Util
    {

        public static int getNowSeconds()
        {
            DateTime d1 = DateTime.Now.ToUniversalTime();
            DateTime d2 = new DateTime(1970, 1, 1);
            double d = d1.Subtract(d2).TotalSeconds;
            return (int)d;
        }

        public static string dictToString(Dictionary<string, string> arguments)
        {
            string outstr = "";
            int i = 0;
            foreach (string key in arguments.Keys)
            {
                i++;
                if (i == 1)
                {
                    outstr = outstr + key + "=" + arguments[key];
                }
                else
                {
                    outstr = outstr + "&" + key + "=" + arguments[key];
                }
            }
            return outstr;
        }

        //简易工具函数，实际应用请用其他第三方库
        public static string dictToJasonString(Dictionary<string, string> arguments)
        {
            if (arguments == null || arguments.Count == 0)
                return "";

            string outstr = "{";
            int i = 0;
            foreach (string key in arguments.Keys)
            {
                i++;
                if (i == arguments.Count)
                {
                    outstr = outstr + "\"" + key + "\":\"" + arguments[key] + "\"";
                }
                else
                {
                    outstr = outstr + "\"" + key + "\":\"" + arguments[key] + "\"" + ",";
                }
            }
            outstr = outstr + "}";
            return outstr;
        }

        //{"access_token":"MlfTORyg_dRTuiQThmKUxaAfH3k40GMv9bS5_-YIxRvwBpCkuAasRxm_t1dJvP3fnpQDnFXCLCb7FtmwYbGoITTmgnDbFC_th535L8T6GW6r6S-hhGSnpjIAN8nAbcHGdPejuVpklYqW6fdwvqcGJg","expires_in":7200}
        //简易工具函数，实际应用请用其他第三方库
        public static Dictionary<string, string> jasonStringToDict(string jasson)
        {
            if (string.IsNullOrWhiteSpace(jasson))
                return null;

            string[] keyvalues= jasson.Split(',');
            if (keyvalues.Length == 0)
                return null;

            Dictionary<string, string> dict = new Dictionary<string, string>();
            foreach(string kv in keyvalues)
            {
                string[] temp = kv.Split(':');
                if (temp == null || temp.Length != 2)
                    continue;

                string k = temp[0].Replace("{", "");
                k = k.Replace("\"", "");
                string v = temp[1].Replace("}", "");
                v = v.Replace("\"", "");

                dict.Add(k, v);
            }

            return dict;
        }

        //大写的部分要放最前面
        public static string stringWithFormEncodedComponentsAscending(Dictionary<string, string> queryPairs, bool ascending, bool skipempty, string sep, bool urlEncode, bool toLowerKey)
        {
            //获取所有Key，并进行排序
            List<string> keys;

            if (ascending)
            {
                keys = queryPairs.Select(m => m.Key).OrderBy(b => b, StringComparer.Ordinal).ToList();
            }
            else
            {
                keys = queryPairs.Select(m => m.Key).OrderByDescending(b => b, StringComparer.Ordinal).ToList();
            }

            string output = null;
            foreach (string keyitem in keys)
            {
                string key = keyitem;
                string value = queryPairs[key] as string;

                if (skipempty && (string.IsNullOrEmpty(value)))
                {
                    continue;
                }

                if (urlEncode)
                {
                    value = UrlEncode(value);
                }

                if (toLowerKey)
                {
                    key = key.ToLower();
                }

                //利用指定的分割符连接成字符串并返回
                if (output == null)
                {
                    output = key + "=" + value;
                }
                else
                {
                    output = output + sep + key + "=" + value;
                }
            }
            return output;
        }

        //这里只能大写encode的部分
        //in = "http://weixin.qq.com"
        //out = http%3A%2F%2Fweixin.qq.com
        private static string UrlEncode(string url)
        {
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < url.Length; i++)
            {
                string t = url[i].ToString();
                string k = System.Net.HttpUtility.UrlEncode(t);
                if (t == k)
                {
                    stringBuilder.Append(t);
                }
                else
                {
                    stringBuilder.Append(k.ToUpper());
                }
            }
            return stringBuilder.ToString();
        }

        public static string Sha1(string orgStr)
        {
            var sha1 = new SHA1Managed();
            var sha1bytes = System.Text.Encoding.UTF8.GetBytes(orgStr);
            byte[] resultHash = sha1.ComputeHash(sha1bytes);
            string sha1String = BitConverter.ToString(resultHash).ToLower();
            sha1String = sha1String.Replace("-", "");

            return sha1String;
        }
    }
}
