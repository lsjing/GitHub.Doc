<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcpDeal.aspx.cs" Inherits="upacp_sdk_net.demo.utf8.AcpDeal" %>


<%@ Import Namespace="upacp_sdk_net.com.unionpay.sdk" %>

<% 
    //以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己需要，按照技术文档编写。该代码仅供参考
    // **************银联全渠道支付开通交易***********************

    Dictionary<string, string> param = new Dictionary<string, string>();
    Random rnd = new Random();
    string orderID = DateTime.Now.ToString("yyyyMMddHHmmss") + (rnd.Next(900) + 100).ToString().Trim();


    //固定填写
    param["version"] = "5.0.0";//M

    //默认取值：
    param["encoding"] = "UTF-8";//M

    //通过MPI插件获取
    param["certId"] = CertUtil.GetSignCertId();//M

    //填写对报文摘要的签名
  //  param["signature"] = "";//M

    //01RSA02 MD5 (暂不支持)
    param["signMethod"] = "01";//M

    //取值:79
    param["txnType"] = "79";//M

    //00——默认开通01——评级开通(后台)02——验密开通（前台跳转）
    param["txnSubType"] = "00";//M

    param["bizType"] = "000000";//M

    //0：普通商户直连接入1：收单机构接入2：平台类商户接入
    param["accessType"] = "0";//M

    param["channelType"] = "07";//M

    //后台返回商户结果时使用，如上送，则发送商户后台交易结果通知
    //param["backUrl"] = "backUrl";//O

    //接入类型为收单机构接入时需上送
    //param["acqInsCode"] = "acqInsCode";//C

    //接入类型为商户接入时需上送
    //param["merId"] = "merId";//C

    //接入类型为收单机构接入时需上送
    //param["merCatCode"] = "merCatCode";//C

    //接入类型为收单机构接入时需上送
    //param["merName"] = "merName";//C

    //接入类型为收单机构接入时需上送
   // param["merAbbr"] = "merAbbr";//C
   
    //商户端生成
    param["orderId"] = orderID;//M商户可根据自己需求填写

    //商户发送交易时间
    param["txnTime"] = DateTime.Now.ToString("yyyyMMddHHmmss");//M商户可根据自己需求填写时间

    //　
   // param["accType"] = "accType";//O

    //　后台交易时必送，前台交易时选送
    //param["accNo"] = "accNo";//C

    //商户自定义保留域，交易应答时会原样返回
    //param["reqReserved"]= "reqReserved";//O

    //格式如下：{子域名1=值&子域名2=值&子域名3=值} 移动支付参考消费
    //param["reserved"]= "reserved";//O

    //请求时：如果是后台开通，借记卡手机号必填，证件类型，证件号码及姓名选填；贷记卡需上送：手机号，有效期，CVN2必填，证件类型，证件号，姓名选填；后台开通时需填写用户的短信验证码至该域；应答时：根据商户配置可返回：手机号、贷记卡有效期
    //param["customerInfo"]= "customerInfo";//C

    //当使用银联公钥加密密码等信息时，需上送加密证书的CertID
    //param["encryptCertId"]= "encryptCertId";//C

    //渠道类型为语音支付时使用用法见VPC交易信息组合域子域用法 
    //param["vpcTransData"]= "vpcTransData";//C

    SDKUtil.Sign(param, Encoding.UTF8);
    HttpClient hc = new HttpClient(SDKConfig.BackTransUrl);
    Response.Write("请求报文=[" + SDKUtil.PrintDictionaryToString(param) + "]\n");
    int status = hc.Send(param, Encoding.UTF8);
    string result = "";
    if (status == 200)
    {
        result = hc.Result;
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
        Response.Write("交易失败");
        Response.Write("返回报文=[" + result + "]\n");
    }
%>
