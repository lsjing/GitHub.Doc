<%@ Language=VBScript %>
<html>
	<head>
		<title>�Ϻ������̻����Խ��ҳ��</title>
		<meta http-equiv = "Content-Type" content = "text/html charset=gb2312">
	</head>
	<body bgcolor = "#FFFFFF" text = "#000000">
		<%
		Response.Write("�̻����ҳ��")
		Response.Write("<br>")
		Response.Write("--------------------------")
		Response.Write("<br>")
		Dim signData
		Dim signDataStr
		
		Set APICtrl = Server.CreateObject("BOS.B2CClientCOM")
		ret = APICtrl.Initialize("C:\Inetpub\wwwroot\b2cCOM\ini\B2CMerchant.xml")
		
		If ret <> 0 Then
			
		    Response.Write("��ʼ��ʧ��,������룺")
		    Err = APICtrl.GetLastErr()
		    Response.Write(Err)
		End If
		
		signData   = Request.QueryString("signData")
		signDataStr = Request.QueryString("signDataStr")
		
		Dim ret
		Dim msg
		ret = APICtrl.Sign_detachverify(signDataStr, signData)
       

		If(ret<=0) Then
			Response.Write("��ǩʧ��" & ret)
			msg = APICtrl.GetErrorMessage()
			Dim Err
			Err = APICtrl.GetLastErr()
			Response.Write("���״�����Ϣ" + msg)
			Response.Write(Err)
		Else
		    arr = Split(signDataStr, "|")
		%>	
			<table width="" border="0" cellspacing="0" cellpadding="0">
			<tr>
			    <td width="">�̻�����</td>
			    <td width=""><%Response.write(arr(0))%></td>
			  </tr>
			  <tr>
			    <td width="">������</td>
			    <td width=""><%Response.write(arr(1))%></td>
			  </tr>
			  <tr>
			    <td width="">�������</td>
			    <td width=""><%Response.write(arr(2))%></td>
			  </tr>
			  <tr>
			    <td width="">֧������</td>
			    <td width=""><%Response.write(arr(3))%></td>
			  </tr>
			  <tr>
			    <td width="">������ˮ��</td>
			    <td width=""><%Response.write(arr(4))%></td>
			  </tr>
			  <tr>
			    <td width="">���׽��</td>
			    <td width=""><%Response.write(arr(5))%></td>
			  </tr>
			  <tr>
			    <td width="">����ǩ��</td>
				<td><textarea name=""cols="16"rows="16"><%Response.write(signData)%></textarea>
			  </tr>
			</table>
		<%End if%>
		<p>
		&nbsp
		</p>
	</body>
</html>
