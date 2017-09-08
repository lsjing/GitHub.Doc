<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsumeUndo.aspx.cs" Inherits="upacp_sdk_net.demo.utf8.ConsumeUndo" %>

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
    // **************消费撤销***********************

    // 使用Dictionary保存参数
    Dictionary<string, string> param = new Dictionary<string, string>();
    // 随机构造一个订单号（演示用）
    Random rnd = new Random();
    string orderID = DateTime.Now.ToString("yyyyMMddHHmmss") + (rnd.Next(900) + 100).ToString().Trim();


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

    //取值：31
    param["txnType"] = "31";//M

    //默认:00
    param["txnSubType"] = "00";//M

    param["bizType"] = "000000";//M

    param["channelType"] = "07";//M

    //后台返回商户结果时使用，如上送，则发送商户后台交易结果通知
    param["backUrl"] = "http://aa.com";//M商户可根据自己需求定义地址

    //0：普通商户直连接入1：收单机构接入2：平台类商户接入
    param["accessType"] = "0";//M

    //接入类型为收单机构接入时需上送
    //param["acqInsCode"]= "acqInsCode";//C

    //接入类型为收单机构接入时需上送
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

    //商户类型为平台类商户接入时必须上送
    //param["subMerAbbr"]= "subMerAbbr";//C

    //预授权撤销的订单号，由商户生成
    param["orderId"] = orderID;//M

    //原始预授权交易的queryId
    param["origQryId"] = "201303071540145467132";//M商户可根据自己需求定义内容

    //　
    param["txnTime"] = DateTime.Now.ToString("yyyyMMddHHmmss");//M

    //与原始预授权交易一致
    param["txnAmt"] = "1";//M商户可根据自己需求定义内容

    //　
    //param["termId"]= "termId";//O

    //商户自定义保留域，交易应答时会原样返回
    //param["reqReserved"]= "reqReserved";//O

    //格式如下：{子域名1=值&子域名2=值&子域名3=值} 移动支付参考消费
    //param["reserved"]= "reserved";//O

    //渠道类型为语音支付时使用用法见VPC交易信息组合域子域用法：
    //param["vpcTransData"]= "vpcTransData";//C


    string result = "";//返回结果
    SDKUtil.Sign(param, Encoding.UTF8);

    HttpClient hc = new HttpClient(SDKConfig.BackTransUrl);

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
        Response.Write("撤销失败");
        Response.Write("返回报文=[" + result + "]\n");
    }
%>
