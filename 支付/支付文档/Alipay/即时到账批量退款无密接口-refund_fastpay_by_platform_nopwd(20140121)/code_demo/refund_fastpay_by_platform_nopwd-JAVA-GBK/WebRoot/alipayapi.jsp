<%
/* *
 *���ܣ���ʱ���������˿����ܽӿڽ���ҳ
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
		<title>֧������ʱ���������˿����ܽӿ�</title>
	</head>
	<%
		////////////////////////////////////�������//////////////////////////////////////

		//�������첽֪ͨҳ��·��
		String notify_url = "http://www.xxx.com/refund_fastpay_by_platform_nopwd-JAVA-GBK/notify_url.jsp";
		//��http://��ʽ������·�����������?id=123�����Զ������
		//�˿����κ�
		String batch_no = new String(request.getParameter("WIDbatch_no").getBytes("ISO-8859-1"),"GBK");
		//���ÿ����һ�μ�ʱ���������˿����Ҫ�ṩһ�����κţ����뱣֤Ψһ��
		//�˿�����ʱ��
		String refund_date = new String(request.getParameter("WIDrefund_date").getBytes("ISO-8859-1"),"GBK");
		//�����ʽΪ��yyyy-MM-dd hh:mm:ss
		//�˿��ܱ���
		String batch_num = new String(request.getParameter("WIDbatch_num").getBytes("ISO-8859-1"),"GBK");
		//���������detail_data��ֵ�У���#���ַ����ֵ�������1�����֧��1000�ʣ�����#���ַ����ֵ��������999����
		//�������ݼ�
		String detail_data = new String(request.getParameter("WIDdetail_data").getBytes("ISO-8859-1"),"GBK");
		//�����ʽ�����4.3 �������ݼ�����˵����
		
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//������������������
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "refund_fastpay_by_platform_nopwd");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("batch_no", batch_no);
		sParaTemp.put("refund_date", refund_date);
		sParaTemp.put("batch_num", batch_num);
		sParaTemp.put("detail_data", detail_data);
		
		//��������
		String sHtmlText = AlipaySubmit.buildRequest("", "", sParaTemp);
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
