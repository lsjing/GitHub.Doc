<%@ Language=VBScript %>
<html>
	<head>
		<title>�˿�</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	</head>
	<body bgcolor="#FFFFFF" text="#000000">
		<%
			merchantID		= Request.Form("merchantID")
			orderNum		= Request.Form("orderNum")
			orgOrderNum	= Request.Form("orgOrderNum")
			refundAmt		= Request.Form("refundAmt")
			
			Set APICtrl = CreateObject("BOS.B2CClientCOM")
			ret = APICtrl.Initialize("C:\Inetpub\wwwroot\ini\B2CMerchant.xml")
			
			If ret <> 0 Then
				
			    Response.Write("��ʼ��ʧ��,������Ϣ:")
			    Err = APICtrl.GetLastErr()
			    Response.Write(Err)
			Else
			    ret = APICtrl.Refund(merchantID, orderNum, orgOrderNum, refundAmt)
			    If ret <> 0 Then
			    	Dim Err
			        Err = APICtrl.GetLastErr()
			        Response.Write("���״�����Ϣ:")
			        Response.Write(Err)
			    Else
			        code = APICtrl.GetRetCode()
			        msg = APICtrl.GetErrorMessage()
			        If msg = "" Then
			            msg = "null"
			        End If
			
			        Response.Write("���׷����룺" + code + "<br>")
			        Response.Write("���״�����Ϣ��" + msg + "<br>")
			        If code = "0" Then
						Response.Write("<br>------------------------<br>")
						orderResult  = APICtrl.GetResultValueByName("orderResult")
			            
						Response.Write("�˿���" + orderResult)
						Response.Write("<p></p>")
					End If
				End If
			End If
		%>	
		<p>
			<a href = "Index.htm">������ҳ</a>
		</p>
	</body>
</html>