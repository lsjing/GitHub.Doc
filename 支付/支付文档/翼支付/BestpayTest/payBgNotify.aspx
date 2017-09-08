<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payBgNotify.aspx.cs" Inherits="payBgNotify" %>
<%
    
     System.IO.FileStream fs = new System.IO.FileStream("D://log.txt", System.IO.FileMode.Append);
        System.IO.StreamWriter sw = new System.IO.StreamWriter(fs);
        
       StringBuilder formInfo = new StringBuilder();
       formInfo.Append("------------------后台参数信息接收-----------------------\n\r");

        string UPTRANSEQ = Request.Params["UPTRANSEQ"];
        string TRANDATE = Request.Params["TRANDATE"];
        string RETNCODE = Request.Params["RETNCODE"];
        string RETNINFO = Request.Params["RETNINFO"];
        string ORDERREQTRANSEQ = Request.Params["ORDERREQTRANSEQ"];
        string ORDERSEQ = Request.Params["ORDERSEQ"];
        string ORDERAMOUNT = Request.Params["ORDERAMOUNT"];
        string PRODUCTAMOUNT = Request.Params["PRODUCTAMOUNT"];
        string ATTACHAMOUNT = Request.Params["ATTACHAMOUNT"];
        string CURTYPE = Request.Params["CURTYPE"];
        string ENCODETYPE = Request.Params["ENCODETYPE"];
        string BANKID = Request.Params["BANKID"];
        string ATTACH = Request.Params["ATTACH"];
        string UPREQTRANSEQ = Request.Params["UPREQTRANSEQ"];
        string UPBANKTRANSEQ = Request.Params["UPBANKTRANSEQ"];
        string PRODUCTNO = Request.Params["PRODUCTNO"];
        string SIGN = Request.Params["SIGN"];
        formInfo.Append("UPTRANSEQ:" + UPTRANSEQ + "|");
        formInfo.Append("TRANDATE:" + TRANDATE + "|");
        formInfo.Append("RETNCODE:" + RETNCODE + "|");
        formInfo.Append("RETNINFO:" + RETNINFO + "|");
        formInfo.Append("ORDERREQTRANSEQ:" + ORDERREQTRANSEQ + "|");
        formInfo.Append("ORDERSEQ:" + ORDERSEQ + "|");
        formInfo.Append("ORDERAMOUNT:" + ORDERAMOUNT + "|");
        formInfo.Append("PRODUCTAMOUNT:" + PRODUCTAMOUNT + "|");
        formInfo.Append("ATTACHAMOUNT:" + ATTACHAMOUNT + "|");
        formInfo.Append("CURTYPE:" + CURTYPE + "|");
        formInfo.Append("ENCODETYPE:" + ENCODETYPE + "|");
        formInfo.Append("BANKID:" + BANKID + "|");
        formInfo.Append("ATTACH:" + ATTACH + "|");
        formInfo.Append("UPREQTRANSEQ:" + UPREQTRANSEQ + "|");
        formInfo.Append("UPBANKTRANSEQ:" + UPBANKTRANSEQ + "|");
        formInfo.Append("PRODUCTNO:" + PRODUCTNO + "|");
        formInfo.Append("SIGN:" + SIGN);
        sw.WriteLine(formInfo);
        
        // 商户key
        string key = "DDE02033450D4888"; 
        // 商户号
        string merchantID = "1310000002";

        //UPTRANSEQ=2014041700000001257052&MERCHANTID=3101000003
          //  &ORDERID=20140417000011905268&PAYMENT=5000&RETNCODE=0000&RETNINFO=0000&PAYDATE=20140417&KEY=93B500CBEC674EBC
        String signOrg = "UPTRANSEQ=" + UPTRANSEQ + "&" +
            "MERCHANTID=" + merchantID + "&" +
            "ORDERID=" + ORDERSEQ + "&" +
            "PAYMENT=" + ORDERAMOUNT + "&"+
            "RETNCODE=" + RETNCODE + "&"+
            "RETNINFO=" + RETNINFO + "&"+
            "PAYDATE=" + TRANDATE + "&" +
             "KEY=" + key;
        sw.WriteLine("sign加密前：" + signOrg);
        string signnew = CryptTool.getMd5Hash(signOrg);
        sw.WriteLine("sign加密后：" + signnew);
        if (SIGN != null && SIGN.ToUpper().Equals(signnew.ToUpper()))
        {
            string responseStri = "UPTRANSEQ_" + UPTRANSEQ;
            sw.WriteLine("响应信息：" + responseStri);
            sw.Close();
            fs.Close();
            Response.Write(responseStri);
        }
        else 
        {
            sw.WriteLine("sign 不一致");
            sw.Close();
            fs.Close();
            Response.Write("sign no the same");
        }
    
 %>