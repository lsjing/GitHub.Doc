 <HTML> 
 <HEAD> 
 <META HTTP-EQUIV= "Content-Type " CONTENT=text/html; charset=GB2312> 
 <TITLE>ǩ���ͷ��Ͳ���</TITLE> 
 </HEAD> 
 <BODY BACKGROUND="/images/logo2.gif" BGCOLOR= "#FFFFFF" LINK= "#0000FF " VLINK= "#800080 " TEXT= "#000000 " TOPMARGIN=0 LEFTMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 > 
   <%
	'����ǩ���ؼ�����
	Dim SafeSign
   	Set SafeSign = Server.CreateObject("SAFESIGN.SIGN.1")

	

	Dim Plain		' ԭʼ����
	
	Plain="TranAbbr=IPER|MercDtTm=20060112165509|TermSsn=00621515114|OsttDate=|OacqSsn=|MercCode=990108160003311|TermCode=00000000|TranAmt=9.2|MercUrl=http://10.102.12.212:81/remote/receive.asp|Remark1=hello|Remark2=iamfine"
	
	'����ǩ��
	Dim Signature		' ����ǩ������
	Signature = SafeSign.SignEx("001",Plain)
		
	'�ͷſؼ�
	Set Safesign = nothing
%>
	
Plain:		<%=Plain%>
Signature:   <%=Signature%>
  
  
  
<form action=https://10.1.1.1/payment/main  method=post>
<input type=hidden name=transName value=��IPER��>
<input type=hidden name=Plain value=<%=Plain%>>
<input type=hidden name= Signature  value=<%=Signature%>>
<input type=submit name=submit value=�ֶ���չ����֧������>
</form>
  
</BODY>
</HTML> 
