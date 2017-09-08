<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackPay.aspx.cs" Inherits="upacp_sdk_net.demo.utf8.BackPay" %>

<%@ Import Namespace="upacp_sdk_net.com.unionpay.sdk" %>


<% 
    //以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己需要，按照技术文档编写。该代码仅供参考
    // **************后台交易***********************

    // 使用Dictionary保存参数
    Dictionary<string, string> param = new Dictionary<string, string>();

    // 随机构造一个订单号
    Random rnd = new Random();
    string orderID = DateTime.Now.ToString("yyyyMMddHHmmss") + (rnd.Next(900) + 100).ToString().Trim();


    //填写参数

    param["version"] = "5.0.0";//M  版本号

    param["encoding"] = "UTF-8";//O

    param["signMethod"] = "01";//M
    //取值：01
    param["txnType"] = "01";//M

    //01：自助消费，通过地址的方式区分前台消费和后台消费（含无跳转支付）02：订购03：分期付款
    param["txnSubType"] = "01";//M

    //000000
    param["bizType"] = "000000";//M


    param["backUrl"] = "http://localhost:9544/upacp_sdk_net/demo/utf8/FrontRcvResponse.aspx";//O

    param["accessType"] = "0";//M

    param["channelType"] = "07";//M

    param["merId"] = "898340183980105";//M商户在银联开通的账号

    //商户类型为平台类商户接入时必须上送
    //param["subMerId"]= "subMerId";//C

    //商户类型为平台类商户接入时必须上送
    //param["subMerName"]= "subMerName";//C

    //商户类型为平台类商户接入时必须上送
    //param["subMerAbbr"]= "subMerAbbr";//C

    param["orderId"] = orderID;//M

    param["txnTime"] = DateTime.Now.ToString("yyyyMMddHHmmss");//M

    //后台类消费交易时上送
   param["accType"]= "01";//C

    //后台类消费交易时上送全卡号或卡号后4位，前台类交易可通过配置后返回前台类交易可选上送
   // param["accNo"] = "6225882118008447";//C

    param["txnAmt"] = "1";//M //用户根据需求可直接填写

    //默认156
    param["currencyCode"]= "156";//M


    
    //1、后台类消费交易时上送2、认证支付2.0，后台交易时可选
    //param["orderTimeoutInterval"]= "orderTimeoutInterval";//O

    //param["payTimeoutTime"]= "payTimeoutTime";//O

    //param["defaultPayType"]= "defaultPayType";//O

    //param["supPayType"]= "supPayType";//O

    //param["customPayType"]= "customPayType";//O

    //param["issInsCode"]= "issInsCode";//O

    //param["merNote"]= "merNote";//O

    //param["termId"]= "termId";//O

    //param["termType"]= "termType";//O

    //param["interactMode"]= "interactMode";//O

    //param["merUserId"]= "merUserId";//O

    //有风控要求的商户上送
    //param["shippingFlag"]= "shippingFlag";//C

    //有风控要求的商户上送
    //param["shippingCountryCode"]= "shippingCountryCode";//C

    //有风控要求的商户上送
    //param["shippingProvinceCode"]= "shippingProvinceCode";//C

    //有风控要求的商户上送
    //param["shippingCityCode"]= "shippingCityCode";//C

    //有风控要求的商户上送
    //param["shippingDistrictCode"]= "shippingDistrictCode";//C

    //有风控要求的商户上送
    //param["shippingStreet"]= "shippingStreet";//C

    //param["commodityCategory"]= "commodityCategory";//O

    //有风控要求的商户上送
    //param["commodityName"]= "commodityName";//C

    //有风控要求的商户上送
    //param["commodityUrl"]= "commodityUrl";//C

    //有风控要求的商户上送
    //param["commodityUnitPrice"]= "commodityUnitPrice";//C

    //有风控要求的商户上送
    //param["commodityQty"]= "commodityQty";//C

    //param["reqReserved"]= "reqReserved";//O

    //param["reserved"]= "reserved";//O

    //前台交易，有IP防钓鱼要求的商户上送
    //param["customerIp"]= "customerIp";//C

    //param["merUserRegDt"]= "merUserRegDt";//O

    //param["merUserEmail"]= "merUserEmail";//O

    //当使用银联公钥加密密码等信息时，需上送加密证书的CertID
    //param["encryptCertId"]= "encryptCertId";//C

    //移动支付业务需要上送
    //param["userMac"]= "userMac";//O

    //前台消费交易若商户上送此字段，则在支付失败时，页面跳转至商户该URL（不带交易信息，仅跳转）
    //param["frontFailUrl"]= "frontFailUrl";//O

    //分期付款交易，商户端选择分期期数时，需上送
    //param["numberOfInstallments"]= "numberOfInstallments";//C
  
    SDKUtil.Sign(param, Encoding.UTF8);  // 签名
    Response.Write("\n" + "请求报文=[" + Server.HtmlEncode(SDKUtil.PrintDictionaryToString(param)) + "]\n");

    // 初始化通信处理类
    HttpClient hc = new HttpClient(SDKConfig.BackTransUrl);
    //// 发送请求获取通信应答
    int status = hc.Send(param, Encoding.UTF8);
    // 返回结果
    string result = "";
    if (status == 200)
    {
        //通信成功,获取返回报文
        result = hc.Result;
        Response.Write("返回报文=[" + Server.HtmlEncode(result) + "]\n");

        Dictionary<string, string> resData = SDKUtil.CoverstringToDictionary(result);

        string respcode = resData["respCode"];


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
        Response.Write("返回报文=[" + result + "]\n");
    }
   


       
%>