<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import = "com.abc.trustpay.client.ebus.*" %>
<% response.setHeader("Cache-Control", "no-cache"); %>
<HTML>
<HEAD><TITLE>ũ������֧��ƽ̨-�̻��ӿڷ���-֧���������</TITLE></HEAD>
<BODY BGCOLOR='#FFFFFF' TEXT='#000000' LINK='#0000FF' VLINK='#0000FF' ALINK='#FF0000'>
<CENTER>֧�����<br>
<%
//1��ȡ��MSG�����������ô˲���ֵ����֧���������
String msg = request.getParameter("MSG");
PaymentResult tResult = new PaymentResult(msg);

//2���ж�֧�����״̬�����к�������
if (tResult.isSuccess()) {
  //3��֧���ɹ�������ǩ�������ɹ�
  out.println("TrxType         = [" + tResult.getValue("TrxType"        ) + "]<br>");
  out.println("OrderNo         = [" + tResult.getValue("OrderNo"        ) + "]<br>");
  out.println("Amount          = [" + tResult.getValue("Amount"         ) + "]<br>");
  out.println("BatchNo         = [" + tResult.getValue("BatchNo"        ) + "]<br>");
  out.println("VoucherNo       = [" + tResult.getValue("VoucherNo"      ) + "]<br>");
  out.println("HostDate        = [" + tResult.getValue("HostDate"       ) + "]<br>");
  out.println("HostTime        = [" + tResult.getValue("HostTime"       ) + "]<br>");
  out.println("MerchantRemarks = [" + tResult.getValue("MerchantRemarks") + "]<br>");
  out.println("PayType         = [" + tResult.getValue("PayType"        ) + "]<br>");
  out.println("NotifyType      = [" + tResult.getValue("NotifyType"     ) + "]<br>");
  out.println("TrnxNo          = [" + tResult.getValue("iRspRef"        ) + "]<br>");
}
else {
  //4��֧���ɹ�����������ǩ���߽������ĵȲ���ʧ��
  out.println("ReturnCode   = [" + tResult.getReturnCode  () + "]<br>");
  out.println("ErrorMessage = [" + tResult.getErrorMessage() + "]<br>");
}
%>
<a href='Merchant.html'>���̻���ҳ</a></CENTER>
</BODY></HTML>