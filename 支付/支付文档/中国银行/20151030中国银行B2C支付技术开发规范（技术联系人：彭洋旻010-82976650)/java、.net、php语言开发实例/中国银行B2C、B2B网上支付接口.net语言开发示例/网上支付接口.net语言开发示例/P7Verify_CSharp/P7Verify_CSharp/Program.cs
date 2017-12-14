using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Security.Cryptography.Pkcs;

namespace P7Verify_CSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            //签名"/s"，验证"/v"
            string usage_s = "/s demo.pfx 11111111 text.txt signDotNET.txt";
            string usage_v = "/v BOC-CA.cer  signDotNET.txt text.txt";
            if (args.Length < 1)
            {
                Console.WriteLine("Usage: \n"
                       + "/s keystorefile keystorepassword [inputfile [outputfile]]\n");
                Console.WriteLine("Usage: \n"
                       + "/v rootcertfile signaturefile [inputfile] [dn]\n");
                Console.ReadKey();
                return;
            }

            if (args[0].Equals("/s"))
            {
                if (args.Length < 3 || args.Length > 6)
                {
                    Console.WriteLine("Usage: \n"
                            + "/s keystorefile keystorepassword [inputfile [outputfile]]\n");
                    Console.ReadKey();
                    return;
                }
           
                byte[] dataTobeSign = null;
                string outFile = "";
                try
                {
                    if (args.Length > 3)
                    {
                        dataTobeSign = File.ReadAllBytes(args[3]);
                    }
                    else
                    {
                        Console.WriteLine("请输入:");
                        string inFile = Console.ReadLine();
                        dataTobeSign = System.Text.Encoding.Default.GetBytes(inFile);
                    }
                    if (args.Length > 4)
                    {
                        outFile = args[4];
                    }

                }
                catch (Exception e)
                {
                    Console.WriteLine("错误：{0}", e.Message);
                }

                PKCS7Tool.SignatureMessage(args[1], args[2], dataTobeSign, outFile);
                //  PKCS7Tool.SignatureMessage("demo.pfx", "11111111", "text.txt", "signDotNET.txt");
                return;

            }

            if (args[0].Equals("/v"))
            {
                byte[] msg = null;
                if (args.Length < 1 || args.Length > 5)
                {
                    Console.WriteLine("Usage: \n"
                    + "/v rootcertfile signaturefile [inputfile] [dn]\n");
                    Console.ReadKey();
                    return;
                }
              //  String fileContent = File.ReadAllText(args[2]);
                byte[] signedData = PKCS7Tool.DecodeFromFile(args[2]);
                if (args.Length > 3)
                {
                    msg = File.ReadAllBytes(args[3]);
                }
                else
                {
                    Console.WriteLine("请输入:");
                    string inFile = Console.ReadLine();
                    msg = System.Text.Encoding.Default.GetBytes(inFile);
                }
                //如果做更严格的验证，可以给出期望的签名证书DN
                String dn = null;
                if (args.Length > 4)
                {
                    dn = args[4];
                }
                bool flag = false;
                flag = PKCS7Tool.Verify(signedData, msg, dn);
                if (flag)
                {
                    Console.WriteLine("[VERIFY OK]");
                    Console.ReadKey();
                }else
                {
                    Console.WriteLine("[VERIFY FAILED]");
                    Console.ReadKey();
                }
                //File.WriteAllBytes("BinarySignResultNET.bin", signedData);
            }
            return;
        }
    }
}
