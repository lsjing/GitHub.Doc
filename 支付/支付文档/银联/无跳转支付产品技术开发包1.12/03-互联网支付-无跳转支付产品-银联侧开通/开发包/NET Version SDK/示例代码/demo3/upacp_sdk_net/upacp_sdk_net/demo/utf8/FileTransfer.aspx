<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileTransfer.aspx.cs" Inherits="upacp_sdk_net.demo.utf8.FileTransfer" %>

<%@ Import Namespace="upacp_sdk_net.com.unionpay.sdk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
<% 
    //以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己需要，按照技术文档编写。该代码仅供参考
    // **************文件传输类交易的请求***********************

    // 使用Dictionary保存参数
    Dictionary<string, string> param = new Dictionary<string, string>();

    // 随机构造一个订单号（演示用）
    Random rnd = new Random();
    string orderID = DateTime.Now.ToString("yyyyMMddHHmmss") + (rnd.Next(900) + 100).ToString().Trim();
    // 填写参数


    //固定填写
    param["version"] = "5.0.0";//M

    //默认取值：UTF-8
    param["encoding"] = "UTF-8";//M

    //通过MPI插件获取
    param["certId"] = CertUtil.GetSignCertId();//M通过插件获取

    //填写对报文摘要的签名
    //param["signature"]= "signature";//M

    //01RSA02 MD5 (暂不支持)
    param["signMethod"] = "01";//M

    //取值:76
    param["txnType"] = "76";//M

    //01：对账文件下载
    param["txnSubType"] = "01";//M

    //默认:000000
    param["bizType"] = "000000";//M

   // param["channelType"] = "07";//M互联网（07）、移动（08）、语音（05）

    //0：普通商户直连接入1：收单机构接入2：平台类商户接入
    param["accessType"] = "0";//M

    //　
    param["merId"] = "898340183980105";//M商户在银联开通的账号

    //接入类型为收单机构接入时需上送
    //param["acqInsCode"]= "acqInsCode";//C

    //商户类型为平台类商户接入时必须上送
    //param["subMerId"]= "subMerId";//C

    //商户类型为平台类商户接入时必须上送
    //param["subMerName"]= "subMerName";//C

    //　
    param["settleDate"] = DateTime.Now.ToString("yyyyMMddHHmmss");//M

    //　
    param["txnTime"] = DateTime.Now.ToString("yyyyMMddHHmmss");//M

    //依据实际业务情况定义，默认值为：00
    //param["fileType"]= "fileType";//O

    //商户自定义保留域，交易应答时会原样返回
    //param["reqReserved"]= "reqReserved";//O

    //交易包含多个子域，所有子域需用“{}”包含，子域间以“&”符号链接。格式如下：{子域名1=值&子域名2=值&子域名3=值}。具体子域的名称、取值根据商户不同而定。
    //param["reserved"]= "reserved";//O




    // 签名
    SDKUtil.Sign(param, Encoding.UTF8);

    Response.Write("请求报文=[" + SDKUtil.PrintDictionaryToString(param) + "]\n");

    // 初始化通信处理类
    HttpClient hc = new HttpClient(SDKConfig.FileTransUrl);

    // 发送请求获取通信应答
    int status = hc.Send(param, Encoding.UTF8);

    // 返回结果
    string result = "";
    if (200 == status)
    {
        //通信成功,获取返回报文
        result = hc.Result;
        Response.Write("返回报文=[" + result + "]\n");

        Dictionary<string, string> resData = SDKUtil.CoverstringToDictionary(result);

        string respcode = resData["respCode"];

        if (SDKUtil.Validate(resData, Encoding.UTF8))
        {
            Response.Write("商户端验证返回报文签名成功\n");
            //商户端根据返回报文内容处理自己的业务逻辑 TODO...

            // 解析返回文件
            string fileContent = resData["fileContent"];
            if (!string.IsNullOrEmpty(fileContent))
            {
                //Base64解码
                byte[] dBase64Byte = Convert.FromBase64String(fileContent);
                //解压缩
                byte[] fileByte = SecurityUtil.inflater(dBase64Byte);

                string filePath = "d:\\FileDown";
                string fileName = resData["fileName"];

                //开始生成对账文件
                string path = System.IO.Path.Combine(filePath, fileName);
                System.IO.FileStream fs = new System.IO.FileStream(path, System.IO.FileMode.Create);
                fs.Write(fileByte, 0, fileByte.Length);
                fs.Close();
                fs.Dispose();

                Response.Write("文件生成路径[" + path + "]<br/>");
            }


        }
        else
        {
            Response.Write("交易失败\n");
        }
    }
    else
    {
        // 通信失败,获取返回报文
        Response.Write("通信失败\n");
        Response.Write("返回报文=[" + result + "]\n");
    }


       
%>
