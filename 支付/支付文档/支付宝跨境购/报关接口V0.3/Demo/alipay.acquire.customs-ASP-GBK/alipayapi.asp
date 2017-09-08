<%
' 功能：报关接口接入页
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
<title>支付宝报关接口</title>
</head>
<body>

<!--#include file="class/alipay_submit.asp"-->

<%
'/////////////////////请求参数/////////////////////

        '报关流水号
        out_request_no = Request.Form("WIDout_request_no")
        '支付宝交易号
        trade_no = Request.Form("WIDtrade_no")
        '电商平台编号
        merchant_customs_code = Request.Form("WIDmerchant_customs_code")
        '商户海关备案名称
        merchant_customs_name = Request.Form("WIDmerchant_customs_name")
        '报关金额
        amount = Request.Form("WIDamount")
        '海关编号
        customs_place = Request.Form("WIDcustoms_place")

'/////////////////////请求参数/////////////////////

'构造请求参数数组
sParaTemp = Array("service=alipay.acquire.customs","partner="&partner,"_input_charset="&input_charset  ,"out_request_no="&out_request_no   ,"trade_no="&trade_no   ,"merchant_customs_code="&merchant_customs_code   ,"merchant_customs_name="&merchant_customs_name   ,"amount="&amount   ,"customs_place="&customs_place  )

'建立请求
Set objSubmit = New AlipaySubmit
'请在这里加上商户的业务逻辑程序代码

'——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

'此处请设置您想要获取的节点，请把含有路径的节点名放置到数组中。
sParaNode = Array("alipay")
'例如：sParaNode = Array("response/tradeBase/trade_no","is_success")

'获得指定节点的值
sParaXml = objSubmit.BuildRequestHttpXml(sParaTemp, sParaNode)

response.Write sParaXml(0)

'——请根据您的业务逻辑来编写程序（以上代码仅作参考）——


%>
</body>
</html>
