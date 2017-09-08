<%
' 功能：支付宝境外商户交易创建接口接入页
' 版本：3.3
' 日期：2012-07-17
' 说明：
' 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
' 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
	
' /////////////////注意/////////////////
' 如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
' 1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
' 2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
' 3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
' /////////////////////////////////////

%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>支付宝支付宝境外商户交易创建接口</title>
</head>
<body>

<!--#include file="class/alipay_submit.asp"-->

<%
'/////////////////////请求参数/////////////////////

        'Return URL
        return_url = "http://商户网关地址/create_forex_trade-ASP-GBK/return_url.asp"
        'After the payment transaction is done
        'Notification URL
        notify_url = "http://商户网关地址/create_forex_trade-ASP-GBK/notify_url.asp"
        'The URL for receiving notifications after the payment process.
        'Goods name
        subject = Request.Form("WIDsubject")
        'required，The name of the goods.
        'Goods description
        body = Request.Form("WIDbody")
        'A detailed description of the goods.
        'Outside trade ID
        out_trade_no = Request.Form("WIDout_trade_no")
        'required，A numbered transaction ID （Unique inside the partner system）
        'Currency
        currency = Request.Form("WIDcurrency")
        'required，The settlement currency merchant named in contract.
        'Payment sum
        total_fee = Request.Form("WIDtotal_fee")
        'required，A floating number ranging 0.01～1000000.00

'/////////////////////请求参数/////////////////////

'构造请求参数数组
sParaTemp = Array("service=create_forex_trade","partner="&partner,"_input_charset="&input_charset  ,"return_url="&return_url   ,"notify_url="&notify_url   ,"subject="&subject   ,"body="&body   ,"out_trade_no="&out_trade_no   ,"currency="&currency   ,"total_fee="&total_fee  )

'建立请求
Set objSubmit = New AlipaySubmit
sHtml = objSubmit.BuildRequestForm(sParaTemp, "get", "确认")
response.Write sHtml


%>
</body>
</html>
