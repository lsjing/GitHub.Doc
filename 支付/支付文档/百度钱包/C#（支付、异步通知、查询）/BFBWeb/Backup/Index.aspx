<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BFBWeb._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <strong>百度钱包企业版商户系统接入演示：</strong></div>
<br>
<div><a href="PayUnlogin.aspx">即时到账支付接口（不要求登录百度钱包）</a></div>
<div><a href="PayNeedlogin.aspx">即时到账支付接口（要求登录百度钱包）</a></div>
<div><a href="PayWap.aspx">百付宝移动端即时到账（要求登录百度钱包）</a></div>
<div><a href="QueryOrderByNo.aspx">按订单号查询支付结果接口（不要求登录百度钱包）</a>
    </div>
    </form>
</body>
</html>
