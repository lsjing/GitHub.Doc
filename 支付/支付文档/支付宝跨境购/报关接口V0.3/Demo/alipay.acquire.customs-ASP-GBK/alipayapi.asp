<%
' ���ܣ����ؽӿڽ���ҳ
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
<title>֧�������ؽӿ�</title>
</head>
<body>

<!--#include file="class/alipay_submit.asp"-->

<%
'/////////////////////�������/////////////////////

        '������ˮ��
        out_request_no = Request.Form("WIDout_request_no")
        '֧�������׺�
        trade_no = Request.Form("WIDtrade_no")
        '����ƽ̨���
        merchant_customs_code = Request.Form("WIDmerchant_customs_code")
        '�̻����ر�������
        merchant_customs_name = Request.Form("WIDmerchant_customs_name")
        '���ؽ��
        amount = Request.Form("WIDamount")
        '���ر��
        customs_place = Request.Form("WIDcustoms_place")

'/////////////////////�������/////////////////////

'���������������
sParaTemp = Array("service=alipay.acquire.customs","partner="&partner,"_input_charset="&input_charset  ,"out_request_no="&out_request_no   ,"trade_no="&trade_no   ,"merchant_customs_code="&merchant_customs_code   ,"merchant_customs_name="&merchant_customs_name   ,"amount="&amount   ,"customs_place="&customs_place  )

'��������
Set objSubmit = New AlipaySubmit
'������������̻���ҵ���߼��������

'�������������ҵ���߼�����д�������´�������ο�������

'�˴�����������Ҫ��ȡ�Ľڵ㣬��Ѻ���·���Ľڵ������õ������С�
sParaNode = Array("alipay")
'���磺sParaNode = Array("response/tradeBase/trade_no","is_success")

'���ָ���ڵ��ֵ
sParaXml = objSubmit.BuildRequestHttpXml(sParaTemp, sParaNode)

response.Write sParaXml(0)

'�������������ҵ���߼�����д�������ϴ�������ο�������


%>
</body>
</html>
