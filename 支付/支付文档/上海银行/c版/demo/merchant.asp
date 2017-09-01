<%@ Language=VBScript %>
<html>
	<head>
		<title>商户订单测试</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	</head>
	<body bgcolor="#FFFFFF" text="#000000" onload="javascript:form1.submit()">
		<%
			Dim merchantID
			Dim merOrderNum
			Dim merOrderAmt
			Dim curType
			Dim orderDate
			Dim orderTime
			Dim merNotifySign
			Dim merNotifyUrl
			Dim merGetGoodsSign
			Dim merGetGoodsUrl
			Dim sourceMsg
			
			merchantID = Request("merchantID")
			merOrderNum = Request("merOrderNum")
			merOrderAmt = Request("merOrderAmt")
			curType = Request("curType")
			orderDate = Request("orderDate")
			orderTime = Request("orderTime")
			merNotifySign = Request("merNotifySign")
			merNotifyUrl = Request("merNotifyUrl")
			merGetGoodsSign = Request("merGetGoodsSign")
			merGetGoodsUrl = Request("merGetGoodsUrl")
			
			Response.write(merchantID)
			Response.write("<br />")
			Response.write(merOrderNum)
			Response.write("<br />")
			Response.write(merOrderAmt)
			Response.write("<br />")
			Response.write(curType)
			Response.write("<br />")
			Response.write(orderDate)
			Response.write("<br />")
			Response.write(orderTime)
			Response.write("<br />")
			Response.write(merNotifySign)
			Response.write("<br />")
			Response.write(merNotifyUrl)
			Response.write("<br />")
			Response.write(merGetGoodsSign)
			Response.write("<br />")
			Response.write(merGetGoodsUrl)
			
			Dim ret
			Dim signData
			Set B2CAPIATL = CreateObject("BOS.B2CClientCOM")
			
			ret = B2CAPIATL.Initialize("C:\Inetpub\wwwroot\ini\B2CMerchant.xml")
	
	       Response.write("<br />")
	       Response.write("====")
	       Response.write("====")
			Response.write("<br />")		
		
	       sourceMsg = merchantID & "|" & merOrderNum & "|" & merOrderAmt & "|" & curType 
				
			'签名
			signData = B2CAPIATL.Sign_detachsign(sourceMsg)
			
			'获取base64格式编码证书
			KoalB64Cert = B2CAPIATL.GetMerchantB64Cert()
			
			Response.write("签名原文:<br />"+sourceMsg+"<br />")
			Response.write("签名密文:<br />"+signData+"<br />")
			Response.write("商户证书:<br />"+KoalB64Cert+"<br />")
		%>
		<form name="form1" method="post" action = "http://222.66.10.175:6677/boscartoon/netpay.do">
			<input type="hidden" name="merchantID" value="<%Response.write(merchantID)%>" />
			<input type="hidden" name="merOrderNum" value="<%Response.write(merOrderNum)%>" />
			<input type="hidden" name="merOrderAmt" value="<%Response.write(merOrderAmt)%>" />
			<input type="hidden" name="curType" value="<%Response.write(curType)%>" />
			<input type="hidden" name="orderDate" value="<%Response.write(orderDate)%>" />
			<input type="hidden" name="orderTime" value="<%Response.write(orderTime)%>" />
			<input type="hidden" name="merNotifySign" value="<%Response.write(merNotifySign)%>" />
			<input type="hidden" name="merNotifyUrl" value="<%Response.write(merNotifyUrl)%>" />
			<input type="hidden" name="merGetGoodsSign" value="<%Response.write(merGetGoodsSign)%>" />
			<input type="hidden" name="merGetGoodsUrl" value="<%Response.write(merGetGoodsUrl)%>" />
			<input type="hidden" name="signData" value="<%Response.write(signData)%>" />
			<input type="hidden" name="signDataStr" value="<%Response.write(sourceMsg)%>" />
			<input type="hidden" name="KoalB64Cert" value="<%Response.write(KoalB64Cert)%>" />
		</form>
	</body>
</html>