<%
' ���ܣ���ʱ���������˿����ܽӿڽ���ҳ
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
<title>֧������ʱ���������˿����ܽӿ�</title>
</head>
<body>

<!--#include file="class/alipay_submit.asp"-->

<%
'/////////////////////�������/////////////////////

        '�������첽֪ͨҳ��·��
        notify_url = "http://www.xxx.com/refund_fastpay_by_platform_nopwd-ASP-GBK/notify_url.asp"
        '��http://��ʽ������·�����������?id=123�����Զ������
        '�˿����κ�
        batch_no = Request.Form("WIDbatch_no")
        '���ÿ����һ�μ�ʱ���������˿����Ҫ�ṩһ�����κţ����뱣֤Ψһ��
        '�˿�����ʱ��
        refund_date = Request.Form("WIDrefund_date")
        '�����ʽΪ��yyyy-MM-dd hh:mm:ss
        '�˿��ܱ���
        batch_num = Request.Form("WIDbatch_num")
        '���������detail_data��ֵ�У���#���ַ����ֵ�������1�����֧��1000�ʣ�����#���ַ����ֵ��������999����
        '�������ݼ�
        detail_data = Request.Form("WIDdetail_data")
        '�����ʽ�����4.3 �������ݼ�����˵����

'/////////////////////�������/////////////////////

'���������������
sParaTemp = Array("service=refund_fastpay_by_platform_nopwd","partner="&partner,"_input_charset="&input_charset  ,"notify_url="&notify_url   ,"batch_no="&batch_no   ,"refund_date="&refund_date   ,"batch_num="&batch_num   ,"detail_data="&detail_data  )

'��������
Set objSubmit = New AlipaySubmit
'������������̻���ҵ���߼��������

'�������������ҵ���߼�����д�������´�������ο�������

'�˴�����������Ҫ��ȡ�Ľڵ㣬��Ѻ���·���Ľڵ������õ������С�
sParaNode = Array("is_success")
'���磺sParaNode = Array("response/tradeBase/trade_no","is_success")

'���ָ���ڵ��ֵ
sParaXml = objSubmit.BuildRequestHttpXml(sParaTemp, sParaNode)

response.Write sParaXml(0)

'�������������ҵ���߼�����д�������ϴ�������ο�������


%>
</body>
</html>
