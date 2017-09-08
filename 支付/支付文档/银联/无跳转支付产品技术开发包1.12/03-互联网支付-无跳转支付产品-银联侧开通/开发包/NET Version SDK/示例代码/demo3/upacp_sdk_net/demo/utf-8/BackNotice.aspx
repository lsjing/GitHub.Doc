<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackNotice.aspx.cs" Inherits="upacp_sdk_net.demo.utf8.BackNotice" %>

<%@ Import Namespace="upacp_sdk_net.com.unionpay.sdk" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    //------------------后台通知------------------
    Random rnd = new Random();
    string orderID = DateTime.Now.ToString("yyyyMMddHHmmss") + (rnd.Next(900) + 100).ToString().Trim();
    
    // 使用Dictionary保存参数
    Dictionary<string, string> param = new Dictionary<string, string>();

   
    HttpClient hc = new HttpClient(SDKConfig.BackTransUrl);
    //// 发送请求获取通信应答
    int status = hc.Send(param,Encoding.UTF8);

    string result = "";// 返回结果
    if (status == 200)
    {
        //通信成功,获取返回报文
        result = hc.Result;
        Response.Write("返回报文=[" + result + "]\n");

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
