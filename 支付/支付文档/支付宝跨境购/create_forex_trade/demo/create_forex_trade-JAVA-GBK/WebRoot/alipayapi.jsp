<%
/* *
 *���ܣ�֧���������̻����״����ӿڽ���ҳ
 *�汾��3.3
 *���ڣ�2012-08-14
 *˵����
 *���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 *�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

 *************************ע��*****************
 *������ڽӿڼ��ɹ������������⣬���԰��������;�������
 *1���̻��������ģ�https://b.alipay.com/support/helperApply.htm?action=consultationApply�����ύ���뼯��Э�������ǻ���רҵ�ļ�������ʦ������ϵ��Э�����
 *2���̻��������ģ�http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9��
 *3��֧������̳��http://club.alipay.com/read-htm-tid-8681712.html��
 *�������ʹ����չ���������չ���ܲ�������ֵ��
 **********************************************
 */
%>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>֧����֧���������̻����״����ӿ�</title>
	</head>
	<%
		////////////////////////////////////�������//////////////////////////////////////

		//Return URL
		String return_url = "http://�̻����ص�ַ/create_forex_trade-JAVA-GBK/return_url.jsp";
		//After the payment transaction is done
		//Notification URL
		String notify_url = "http://�̻����ص�ַ/create_forex_trade-JAVA-GBK/notify_url.jsp";
		//The URL for receiving notifications after the payment process.
		//Goods name
		String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"GBK");
		//required��The name of the goods.
		//Goods description
		String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"GBK");
		//A detailed description of the goods.
		//Outside trade ID
		String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"GBK");
		//required��A numbered transaction ID ��Unique inside the partner system��
		//Currency
		String currency = new String(request.getParameter("WIDcurrency").getBytes("ISO-8859-1"),"GBK");
		//required��The settlement currency merchant named in contract.
		//Payment sum
		String total_fee = new String(request.getParameter("WIDtotal_fee").getBytes("ISO-8859-1"),"GBK");
		//required��A floating number ranging 0.01��1000000.00
		
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//������������������
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "create_forex_trade");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("subject", subject);
		sParaTemp.put("body", body);
		sParaTemp.put("out_trade_no", out_trade_no);
		sParaTemp.put("currency", currency);
		sParaTemp.put("total_fee", total_fee);
		
		//��������
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","ȷ��");
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
