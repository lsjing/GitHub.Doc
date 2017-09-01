<%@ Language=VBScript %>
<html>
	<head>
		<title>批量订单查询</title>
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
				
			    Response.Write("初始化失败,错误信息：")
			    Err = APICtrl.GetLastErr()
			    Response.Write(Err)
			Else		   
		
				ret = APICtrl.QueryBatchOrder(merchantID, orderList, orderBeginDate, orderEndDate)
				
				If ret<>0 Then
					Dim Err
				    Err = APICtrl.GetLastErr()
				    Response.Write("交易错误信息：")
				    Response.Write(Err)
				Else
				    Dim code
				    Dim msg
				    code = APICtrl.GetRetCode()
				    msg = APICtrl.GetErrorMessage()
				    If msg = "" Then
				        msg = "null"
				    End If
				
				    Response.Write("交易返回码：" + code + "<br>")
				    Response.Write("交易错误信息：" + msg + "<br>")
				    If code = "0" Then
				       
						orderListResult = APICtrl.GetResultValueByName("orderListResult")
				    
				
						Response.Write("订单号集合：" + orderListResult)
					End If
				End If
			End If
		%>
		<p><a href = "Index.htm">返回首页</a></p>
	</body>
</html>