using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security;
using System.Security.Cryptography;
using System.Security.Cryptography.Pkcs;
using System.Security.Cryptography.X509Certificates;
using System.IO;

namespace P7Verify_CSharp
{
    class PKCS7Tool
    {
        public static byte[] DecodeFromFile(string inFileName)
        {
            FromBase64Transform myTransform = new FromBase64Transform(FromBase64TransformMode.IgnoreWhiteSpaces);

            byte[] myOutputBytes = new byte[myTransform.OutputBlockSize];

            //Open the input and output files.
            FileStream myInputFile = new FileStream(inFileName, FileMode.Open, FileAccess.Read);

            //Retrieve the file contents into a byte array.
            byte[] myInputBytes = new byte[myInputFile.Length];
            myInputFile.Read(myInputBytes, 0, myInputBytes.Length);

            MemoryStream outputDataStream = new MemoryStream(myInputBytes.Length);

            //Transform the data in chunks the size of InputBlockSize.
            int i = 0;
            int inputBlockSize = 4;
            while (myInputBytes.Length - i > inputBlockSize)
            {
                int nOutput = myTransform.TransformBlock(myInputBytes, i, inputBlockSize, myOutputBytes, 0);
                i += inputBlockSize;
                if (nOutput > 0)
                {
                    outputDataStream.Write(myOutputBytes, 0, nOutput);
                }
            }

            //Transform the final block of data.
            myOutputBytes = myTransform.TransformFinalBlock(myInputBytes, i, myInputBytes.Length - i);
            outputDataStream.Write(myOutputBytes, 0, myOutputBytes.Length);

            //Free up any used resources.
            myTransform.Clear();

            myInputFile.Close();
            outputDataStream.Position = 0;
            byte[] outputData = new byte[outputDataStream.Length];
            outputDataStream.Read(outputData, 0, (int)outputDataStream.Length);
            outputDataStream.Close();

            return outputData;
        }

        public static Boolean Verify(byte[] sig, byte[] msg,string dn)
        {
            Boolean b = true;
            try
            {
                ContentInfo signedData = new ContentInfo(msg);
                SignedCms cms = new SignedCms(signedData, true);
                cms.Decode(sig);
                //Check Signature
                cms.CheckSignature(true);
                //Check dn
                if (cms.Certificates.Count > 0 )
                {
                    X509Certificate2 cert = cms.Certificates[0];
                    if (!string.IsNullOrEmpty(dn) && !dn.Equals(cert.Subject))
                    {
                        b = false;
                    }
                }

                byte[] data = cms.Encode();
            }
            catch (Exception e)
            {
                b = false;
            }
            return b;
        }

        public static string SignatureMessage(string certFileName, string password, byte[] dataTobeSign, string outputFileName)
        {
            byte[] pfxCert = File.ReadAllBytes(certFileName);
          //  byte[] dataTobeSign = File.ReadAllBytes(dataFileName);
            SecureString pwd = new SecureString();
            char[] pwdCharArray = password.ToCharArray();
            for (int i = 0; i < pwdCharArray.Length; i++)
            {
                pwd.AppendChar(pwdCharArray[i]);
            }
            X509Certificate2 cert = new X509Certificate2(pfxCert, pwd);
            CmsSigner signer = new CmsSigner(cert);
            signer.DigestAlgorithm = new Oid("1.3.14.3.2.26", "sha1");

            signer.IncludeOption = X509IncludeOption.EndCertOnly;

            ContentInfo signedData = new ContentInfo(dataTobeSign);
            SignedCms cms = new SignedCms(signedData, true);
            cms.ComputeSignature(signer);
            byte[] signature = cms.Encode();

            //base64
            ToBase64Transform base64Transform = new ToBase64Transform();
            byte[] inputBytes = signature;
            byte[] outputBytes = new byte[base64Transform.OutputBlockSize];
            int inputOffset = 0;
            int inputBlockSize = base64Transform.InputBlockSize;
            MemoryStream outputDataStream = new MemoryStream();
            while (inputBytes.Length - inputOffset > inputBlockSize)
            {
                base64Transform.TransformBlock(inputBytes, inputOffset, inputBytes.Length - inputOffset, outputBytes, 0);

                inputOffset += base64Transform.InputBlockSize;
                outputDataStream.Write(outputBytes, 0, base64Transform.OutputBlockSize);
            }
            outputBytes = base64Transform.TransformFinalBlock(inputBytes, inputOffset, inputBytes.Length - inputOffset);
            outputDataStream.Write(outputBytes, 0, outputBytes.Length);

            outputDataStream.Position = 0;
            byte[] outputData = new byte[outputDataStream.Length];
            outputDataStream.Read(outputData, 0, (int)outputDataStream.Length);
            outputDataStream.Close();
            if (string.IsNullOrEmpty(outputFileName))
            {
                string outputStr = System.Text.Encoding.Default.GetString(outputData);
                Console.WriteLine("输出字符");
                Console.WriteLine(outputStr);
                Console.ReadKey();
            }
            else
            {
                File.WriteAllBytes(outputFileName, outputData);
            }
            return "";
        }
    }
}
