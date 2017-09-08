<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcpQueryDeal.aspx.cs" Inherits="upacp_sdk_net.demo.utf8.AcpQueryDeal" %>

<!DOCTYPE html>
<%@ Import Namespace="upacp_sdk_net.com.unionpay.sdk" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
</body>
</html>


<%
  
   //以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己需要，按照技术文档编写。该代码仅供参考

    // **************交易状态查询***********************

    Dictionary<string, string> param = new Dictionary<string, string>(); // 使用Dictionary保存参数

    Random rnd = new Random();
    string orderID = DateTime.Now.ToString("yyyyMMddHHmmss") + (rnd.Next(900) + 100).ToString().Trim();

    //备注

    //固定填写
    param["version"] = "5.0.0";//M

    //默认取值：
    param["encoding"] = "UTF-8";//M

    //通过SDK插件获取
    param["certId"]= CertUtil.GetSignCertId();//M

    //填写对报文摘要的签名
    //param["signature"]= "signature";//M

    //01RSA02 MD5 (暂不支持)
    param["signMethod"] = "01";//M

    param["channelType"] = "07";//M

    //交易类型 00
    param["txnType"] = "00";//M

    //默认00
    param["txnSubType"] = "00";//M

    //默认:000000
    param["bizType"] = "000000";//M

    //接入类型为收单机构接入时需上送
    //param["acqInsCode"]= "01";//C

    //0：普通商户直连接入1：收单机构接入2：平台类商户接入
    param["accessType"] = "0";//M

    //　
    param["merId"] = "898340183980105";//M商户填写自己在银联开通的账号

    //查询交易的交易时间
    param["txnTime"] = DateTime.Now.ToString("yyyyMMddHHmmss");//M

    //交易的订单号
    param["orderId"] = orderID;//M当前日期时分秒

    //待查询交易的流水号
    //param["queryId"]= "queryId";//C

    //格式如下：{子域名1=值&子域名2=值&子域名3=值} 子域： origTxnType N2原交易类型余额查询时必送
    //param["reserved"]= "reserved";//O


        SDKUtil.Sign(param, Encoding.UTF8);

        Response.Write("请求报文=[" +Server.HtmlEncode( SDKUtil.PrintDictionaryToString(param)) + "]\n");
        HttpClient hc = new HttpClient(SDKConfig.SingleQueryUrl);
        int status = hc.Send(param, Encoding.UTF8);
        string result = "";
        if (status == 200)
        {
            //通信成功,获取返回报文
            result = hc.Result;
            Response.Write("返回报文=[" +Server.HtmlEncode( result) + "]\n");

            Dictionary<string, string> resData = SDKUtil.CoverstringToDictionary(result);

            string respcode = resData["respCode"];

            if (!respcode.StartsWith("upog"))
            {
                if (SDKUtil.Validate(resData, Encoding.UTF8))
                {
                    Response.Write("商户端验证返回报文签名成功\n");
                }
                else
                {
                    Response.Write("商户端验证返回报文签名失败\n");
                }

            }
            else
            {

                Response.Write("查询失败\n");
            }
        }
        else
        {
            Response.Write("查询失败\n");
            Response.Write("返回报文=[" + result + "]\n");
        }
    //}
    
    
    
%>


