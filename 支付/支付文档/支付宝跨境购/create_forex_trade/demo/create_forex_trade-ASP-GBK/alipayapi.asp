<%
' ���ܣ�֧���������̻����״����ӿڽ���ҳ
' �汾��3.3
' ���ڣ�2012-07-17
' ˵����
' ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
' �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���
	
' /////////////////ע��/////////////////
' ������ڽӿڼ��ɹ������������⣬���԰��������;�������
' 1���̻��������ģ�https://b.alipay.com/support/helperApply.htm?action=consultationApply�����ύ���뼯��Э�������ǻ���רҵ�ļ�������ʦ������ϵ��Э�����
' 2���̻��������ģ�http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9��
' 3��֧������̳��http://club.alipay.com/read-htm-tid-8681712.html��
' /////////////////////////////////////

%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>֧����֧���������̻����״����ӿ�</title>
</head>
<body>

<!--#include file="class/alipay_submit.asp"-->

<%
'/////////////////////�������/////////////////////

        'Return URL
        return_url = "http://�̻����ص�ַ/create_forex_trade-ASP-GBK/return_url.asp"
        'After the payment transaction is done
        'Notification URL
        notify_url = "http://�̻����ص�ַ/create_forex_trade-ASP-GBK/notify_url.asp"
        'The URL for receiving notifications after the payment process.
        'Goods name
        subject = Request.Form("WIDsubject")
        'required��The name of the goods.
        'Goods description
        body = Request.Form("WIDbody")
        'A detailed description of the goods.
        'Outside trade ID
        out_trade_no = Request.Form("WIDout_trade_no")
        'required��A numbered transaction ID ��Unique inside the partner system��
        'Currency
        currency = Request.Form("WIDcurrency")
        'required��The settlement currency merchant named in contract.
        'Payment sum
        total_fee = Request.Form("WIDtotal_fee")
        'required��A floating number ranging 0.01��1000000.00

'/////////////////////�������/////////////////////

'���������������
sParaTemp = Array("service=create_forex_trade","partner="&partner,"_input_charset="&input_charset  ,"return_url="&return_url   ,"notify_url="&notify_url   ,"subject="&subject   ,"body="&body   ,"out_trade_no="&out_trade_no   ,"currency="&currency   ,"total_fee="&total_fee  )

'��������
Set objSubmit = New AlipaySubmit
sHtml = objSubmit.BuildRequestForm(sParaTemp, "get", "ȷ��")
response.Write sHtml


%>
</body>
</html>
