<html>
<head>
<title>���ս������</title>
</head>
<body>
<br>

<%
	'����ǩ���ؼ�����
	Dim SafeSign
   	Set SafeSign=Server.CreateObject("SAFESIGN.SIGN.1")

	Dim Plain			' ԭʼ����
	'Plain=Request("Plain")
	
	' ����Plain��signatureʹ�ò��Ի���������֤�������֤˵����ǩ��û������ġ�
	
	Plain="TranAbbr=IPER|MercDtTm=20060112165509|TermSsn=00621515114|OsttDate=|OacqSsn=|MercCode=990108160003311|TermCode=00000000|TranAmt=9.2|MercUrl=http://10.102.12.212:81/remote/receive.asp|Remark1=hello|Remark2=iamfine"
	Signature="12DF97837517786969905C50F6EEA44CC545954AA5DB7A29E4EBCF39052B82280F3634EB91C91887430E28A2B74FC846409373D519461C97EB3AE47B78A2BC3C6996B2CCB23D04C4395828BC2FA4CF8600154E9446CE3E50F399EBF5D45BB9598F73295382717DC95F6035F5970E31B9CE0D56D8970E15D8B42AC0599FEBC2AB"	

	
	Dim sign
	' ��safesignforspdb.cfg�еĵ����������в���֤��Ļ��������signӦ��Ϊ��A:0001����������"E:0003"(֤���Ҳ���)���ߡ�E:1005��(��ǩ����)
	sign=SafeSign.VerifyEx("001",Plain,Signature)	
	
	' ����Plain��signatureʹ����������������֤�������֤˵����ǩ��û������ġ�
	Plain="AcqSsn=995790002195|MercDtTm=20050328101300|TermSsn=464480|TranAbbr=IPER|RespCode=00|TermCode=1|MercCode=911110060000101|TranAmt=000000000001"
	Signature="8721a09d1a90974971cc2869951e09fe541b7f8aea4079b4d57f4f0aa0f719ab1cf3c45760b9ce46e4b7050b3251a88f5beca9053607672b9377e00d4262d3944b36aa28debcd773c36645276f2a3b53a15c23bcda213fe039eaf0951501865cdf90dcb51ded75a14893c74e5ce1ea043e0ca70ca13c274405beb8255b7343d6"
	
	' ��safesignforspdb.cfg�еĵ����������в���֤��Ļ��������signӦ��Ϊ��A:0001����������"E:0003"(֤���Ҳ���)���ߡ�E:1005��(��ǩ����)
	sign=SafeSign.VerifyEx("001",Plain,Signature)
		
	'�ͷſؼ�
	Set Safesign=nothing
	response.write "<br>��ǩ�����" 
	response.write sign
    
	'�ͷſؼ�
	Set Safesign = nothing
%>

if (sign="A:0001")
     
�Ǽǳɹ��Ķ����š�����֪ͨ������������������




<br>
</body>
</html>