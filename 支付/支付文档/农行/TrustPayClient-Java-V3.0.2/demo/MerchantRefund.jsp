<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import = "com.abc.trustpay.client.ebus.*" %>
<%@ page import = "com.abc.trustpay.client.*" %>
<% 
request.setCharacterEncoding("gb2312");
response.setHeader("Cache-Control", "no-cache"); %>
<HTML>
<HEAD><TITLE>ũ������֧��ƽ̨-�̻��ӿڷ���-�����˿�</TITLE></HEAD>
<BODY BGCOLOR='#FFFFFF' TEXT='#000000' LINK='#0000FF' VLINK='#0000FF' ALINK='#FF0000'>
<CENTER>�����˿�<br>
<%
        //1�������˿��������
        RefundRequest tRequest = new RefundRequest();
        tRequest.dicRequest.put("OrderDate", request.getParameter("txtOrderDate"));  //�������ڣ���Ҫ��Ϣ��
        tRequest.dicRequest.put("OrderTime", request.getParameter("txtOrderTime")); //����ʱ�䣨��Ҫ��Ϣ��
        //tRequest.dicRequest.put("MerRefundAccountNo", request.getParameter("txtMerRefundAccountNo"));  //�̻��˿��˺�
        //tRequest.dicRequest.put("MerRefundAccountName", request.getParameter("txtMerRefundAccountName")); //�̻��˿���
        tRequest.dicRequest.put("OrderNo", request.getParameter("txtOrderNo")); //ԭ���ױ�ţ���Ҫ��Ϣ��
        tRequest.dicRequest.put("NewOrderNo", request.getParameter("txtNewOrderNo")); //���ױ�ţ���Ҫ��Ϣ��
        tRequest.dicRequest.put("CurrencyCode", request.getParameter("txtCurrencyCode")); //���ױ��֣���Ҫ��Ϣ��
        tRequest.dicRequest.put("TrxAmount", request.getParameter("txtTrxAmount")); //�˻���� ����Ҫ��Ϣ��
        //tRequest.dicRequest.put("MerchantRemarks", request.getParameter("txtMerchantRemarks"));  //����

        //2�������˿�����ȡ���˻����
        JSON json = tRequest.postRequest();

        //3���ж��˿���״̬�����к�������
        StringBuilder strMessage = new StringBuilder("");
        String ReturnCode = json.GetKeyValue("ReturnCode");
        String ErrorMessage = json.GetKeyValue("ErrorMessage");
        if (ReturnCode.equals("0000"))
        {
            //4���˿�ɹ�
             out.println("ReturnCode   = [" + ReturnCode + "]<br/>");
             out.println("ErrorMessage = [" + ErrorMessage + "]<br/>");
             out.println("OrderNo   = [" + json.GetKeyValue("OrderNo") + "]<br/>");
             out.println("NewOrderNo   = [" + json.GetKeyValue("NewOrderNo") + "]<br/>");
             out.println("TrxAmount = [" + json.GetKeyValue("TrxAmount") + "]<br/>");
             out.println("BatchNo   = [" + json.GetKeyValue("BatchNo") + "]<br/>");
             out.println("VoucherNo = [" + json.GetKeyValue("VoucherNo") + "]<br/>");
             out.println("HostDate  = [" + json.GetKeyValue("HostDate") + "]<br/>");
             out.println("HostTime  = [" + json.GetKeyValue("HostTime") + "]<br/>");
             out.println("iRspRef  = [" + json.GetKeyValue("iRspRef") + "]<br/>");
        }
        else
        {
			out.println("ReturnCode   = [" + ReturnCode + "]<br>");
			out.println("ErrorMessage = [" + ErrorMessage + "]<br>");
		}
%>
<a href='Merchant.html'>���̻���ҳ</a></CENTER>
</BODY></HTML>