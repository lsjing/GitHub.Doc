<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveBinding.aspx.cs" Inherits="upacp_sdk_net.demo.utf8.RemoveBinding" %>

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
    // **************解除绑定关系***********************

    Dictionary<string, string> param = new Dictionary<string, string>();
    Random rnd = new Random();
    string orderID = DateTime.Now.ToString("yyyyMMddHHmmss") + (rnd.Next(900) + 100).ToString().Trim();


    //固定填写
    param["version"] = "5.0.0";//M

    //默认取值：UTF-8
    param["encoding"] = "UTF-8";//M

    //通过MPI插件获取
    param["certId"] = CertUtil.GetSignCertId();//M

    //填写对报文摘要的签名
    //param["signature"]= "signature";//M

    //01RSA02 MD5 (暂不支持)
    param["signMethod"] = "01";//M

    //取值:74
    param["txnType"] = "74";//M

    //00：默认
    param["txnSubType"] = "00";//M

    //默认:000000
    param["bizType"] = "000000";//M

    param["channelType"] = "07";//M

    //0：普通商户直连接入1：收单机构接入2：平台类商户接入
    param["accessType"] = "0";//M

    //接入类型为收单机构接入时需上送
    //param["acqInsCode"]= "acqInsCode";//C

    //　
    param["merId"] = "898340183980105";//M 

    //接入类型为收单机构接入时需上送
    //param["merCatCode"]= "merCatCode";//C

    //接入类型为收单机构接入时需上送
    //param["merName"]= "merName";//C

    //接入类型为收单机构接入时需上送
    //param["merAbbr"]= "merAbbr";//C

    //商户类型为平台类商户接入时必须上送
    //param["subMerId"]= "subMerId";//C

    //商户类型为平台类商户接入时必须上送
    //param["subMerName"]= "subMerName";//C

    //　
    param["orderId"] = orderID;//M商户可根据自己需求填写内容

    //　
    param["txnTime"] = DateTime.Now.ToString("yyyyMMddHHmmss");//M商户可根据自己需求填写内容

    //　
    param["bindId"] = "9555542160000001";//M 商户可根据自己需求填写内容

    //上送卡号后4位或完整卡号
    //param["accNo"]= "accNo";//O

    //商户自定义保留域，交易应答时会原样返回
    //param["reqReserved"]= "reqReserved";//O

    //格式如下：{子域名1=值&子域名2=值&子域名3=值} 移动支付参考消费
    //param["reserved"]= "reserved";//O

    //格式如下：{子域名1=值&子域名2=值&子域名3=值}有风险级别要求的商户必填 风险级别 {riskLevel=XX}
    //param["riskRateInfo"]= "riskRateInfo";//O


    SDKUtil.Sign(param, Encoding.UTF8);
    HttpClient hc = new HttpClient(SDKConfig.BackTransUrl);
    string result = "";
    int status = hc.Send(param, Encoding.UTF8);
    if (status == 200)
    {

        result = hc.Result;
        if (result != null && string.IsNullOrEmpty(result))
        {
            Dictionary<string, string> resData = SDKUtil.CoverstringToDictionary(result);
            string respcode = resData["respCode"];

            if (SDKUtil.Validate(resData, Encoding.UTF8))
            {
                Response.Write("商户端验证返回报文签名成功");

            }
            else
            {
                Response.Write("商户端验证返回报文签名失败");
            }

        }
        else
        {
            result = hc.Result;
        }
    }
    else
    {
        Response.Write("查询失败");
        Response.Write("返回报文=[" + result + "]\n");
    }
       
%>