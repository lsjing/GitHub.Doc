<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateBinding.aspx.cs" Inherits="upacp_sdk_net.demo.utf8.CreateBinding" %>

<%@ Import Namespace="upacp_sdk_net.com.unionpay.sdk" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    // **************建立绑定关系**********************
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

    //取值:72
    param["txnType"] = "72";//M

    //01：实名认证02：免验建立绑定关系
    param["txnSubType"] = "01";//M

    param["bizType"] = "000000";//M

    param["channelType"] = "07";//M

    //前台交易需填写
    //param["frontUrl"]= "frontUrl";//C

    //后台返回商户结果时使用，如上送，则发送商户后台交易结果通知
    //param["backUrl"]= "backUrl";//C

    //0：普通商户直连接入1：收单机构接入2：平台类商户接入
    param["accessType"] = "0";//M

    //接入类型为收单机构接入时需上送
    //param["acqInsCode"]= "acqInsCode";//C

    //填写MCC码，接入类型为收单机构接入时需上送
    //param["merCatCode"]= "merCatCode";//C

    //　
    param["merId"] = "898340183980105";//M

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
    //param["accType"]= "accType";//O

    //对于前台类交易，返回卡号后4位，后台类交易，原样返回
    //param["accNo"]= "accNo";//O

    //　
    //param["customerInfo"]= "customerInfo";//O

    //商户自定义保留域，交易应答时会原样返回
    //param["reqReserved"]= "reqReserved";//O

    //格式如下：{子域名1=值&子域名2=值&子域名3=值} 移动支付参考消费绑定信息 {bindInfo=XXXXX}  特殊商户上送
    //param["reserved"]= "reserved";//O

    //格式如下：{子域名1=值&子域名2=值&子域名3=值}有风险级别要求的商户必填 风险级别 {riskLevel=XX}
    //param["riskRateInfo"]= "riskRateInfo";//O

    //当使用银联公钥加密密码等信息时，需上送加密证书的CertID
    //param["encryptCertId"]= "encryptCertId";//C

    //移动支付业务需要上送
    //param["userMac"]= "userMac";//O

    //需做绑定时填写
    //param["bindId"]= "bindId";//C

    //用于填写账户验证交易的关联业务类型01：消费02：代收
    //param["　relTxnType"]= "　relTxnType";//C

    //　
    //param["payCardType"]= "payCardType";//O

    //　
    //param["issInsCode"]= "issInsCode";//O

    //渠道类型为语音支付时使用用法见VPC交易信息组合域子域用法
    //param["vpcTransData"]= "vpcTransData";//C



    SDKUtil.Sign(param, Encoding.UTF8);
    // 将SDKUtil产生的Html文档写入页面，从而引导用户浏览器重定向   
    string html = SDKUtil.CreateAutoSubmitForm(SDKConfig.FrontTransUrl, param, Encoding.UTF8);
    Response.ContentEncoding = Encoding.UTF8; // 指定输出编码
    Response.Write(html);
%>

