<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="signClient/SignClientClass.asp"-->
<%
Dim socketObj 
Dim signRetVal

Set client = new SocketClient  

'调用方式说明：exeSign("服务器IP",端口,"验签字符串")
signRetVal = client.exeSign("128.128.96.2",55533,"POSID=100001329&BRANCHID=500000000&ORDERID=GWA10081217305965959&PAYMENT=0.01&CURCODE=01&REMARK1=&REMARK2=&SUCCESS=Y&TYPE=1&REFERER=http://114.255.7.208/page/bankpay.do&CLIENTIP=114.255.7.194&SIGN=9a7efc7f15f4b0e7f8fba52649d6b97ae33fad44598a7ca1c26196e8ddba00ecf91a596346e4bfd3cc6d2bdba6c085a3cdb0f231d865d7856e37de89846a371c8bc09f8f2643284260499e1d3f464d9ca9d379fe8af3202a09fc83d39f5c68501a4627d62a3ae891d4b0ff6aa21d61f6ba0e9c8bc5840b292af853d2736ce04a")

Response.Write signRetVal  '输出验签返回字符串

%>
