<%@ Language=VBScript %>
<html>
	<head>
		<title>����������ѯ</title>
		<meta http-equiv = "Content-Type" content = "text/html charset=gb2312">
	</head>

	<body bgcolor = "#FFFFFF" text = "#000000">
		<%
			merchantID				= Request.Form("merchantID")
			orderList					= Request.Form("orderList")
			orderBeginDate		= Request.Form("orderBeginDate")
			orderEndDate			= Request.Form("orderEndDate")
		
			
			Set APICtrl = CreateObject("BOS.B2CClientCOM")
			ret = APICtrl.Initialize("C:\Inetpub\wwwroot\ini\B2CMerchant.xml")
	
			If ret <> 0 Then
				
			    Response.Write("��ʼ��ʧ��,������Ϣ��")
			    Err = APICtrl.GetLastErr()
			    Response.Write(Err)
			Else		   
		
				ret = APICtrl.QueryBatchOrder(merchantID, orderList, orderBeginDate, orderEndDate)
				
				If ret<>0 Then
					Dim Err
				    Err = APICtrl.GetLastErr()
				    Response.Write("���״�����Ϣ��")
				    Response.Write(Err)
				Else
				    Dim code
				    Dim msg
				    code = APICtrl.GetRetCode()
				    msg = APICtrl.GetErrorMessage()
				    If msg = "" Then
				        msg = "null"
				    End If
				
				    Response.Write("���׷����룺" + code + "<br>")
				    Response.Write("���״�����Ϣ��" + msg + "<br>")
				    If code = "0" Then
				       
						orderListResult = APICtrl.GetResultValueByName("orderListResult")
				    
				
						Response.Write("�����ż��ϣ�" + orderListResult)
					End If
				End If
			End If
		%>
		<p><a href = "Index.htm">������ҳ</a></p>
	</body>
</html>