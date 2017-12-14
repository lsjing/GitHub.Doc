<%@ Language=VBScript %>
<html>
	<head>
		<title>上海银行商户测试结果页面</title>
		<meta http-equiv = "Content-Type" content = "text/html charset=gb2312">
	</head>
	<body bgcolor = "#FFFFFF" text = "#000000">
		<%
		Response.Write("商户结果页面")
		Response.Write("<br>")
		Response.Write("--------------------------")
		Response.Write("<br>")
		Dim signData
		Dim signDataStr
		
		Set APICtrl = Server.CreateObject("BOS.B2CClientCOM")
		ret = APICtrl.Initialize("C:\Inetpub\wwwroot\b2cCOM\ini\B2CMerchant.xml")
		
		If ret <> 0 Then
			
		    Response.Write("初始化失败,错误代码：")
		    Err = APICtrl.GetLastErr()
		    Response.Write(Err)
		End If
		
		signData   = Request.QueryString("signData")
		signDataStr = Request.QueryString("signDataStr")
		
		Dim ret
		Dim msg
		ret = APICtrl.Sign_detachverify(signDataStr, signData)
       

		If(ret<=0) Then
			Response.Write("验签失败" & ret)
			msg = APICtrl.GetErrorMessage()
			Dim Err
			Err = APICtrl.GetLastErr()
			Response.Write("交易错误信息" + msg)
			Response.Write(Err)
		Else
		    arr = Split(signDataStr, "|")
		%>	
			<table width="" border="0" cellspacing="0" cellpadding="0">
			<tr>
			    <td width="">商户代码</td>
			    <td width=""><%Response.write(arr(0))%></td>
			  </tr>
			  <tr>
			    <td width="">订单号</td>
			    <td width=""><%Response.write(arr(1))%></td>
			  </tr>
			  <tr>
			    <td width="">订单金额</td>
			    <td width=""><%Response.write(arr(2))%></td>
			  </tr>
			  <tr>
			    <td width="">支付币种</td>
			    <td width=""><%Response.write(arr(3))%></td>
			  </tr>
			  <tr>
			    <td width="">交易流水号</td>
			    <td width=""><%Response.write(arr(4))%></td>
			  </tr>
			  <tr>
			    <td width="">交易结果</td>
			    <td width=""><%Response.write(arr(5))%></td>
			  </tr>
			  <tr>
			    <td width="">银行签名</td>
				<td><textarea name=""cols="16"rows="16"><%Response.write(signData)%></textarea>
			  </tr>
			</table>
		<%End if%>
		<p>
		&nbsp
		</p>
	</body>
</html>
