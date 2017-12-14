<html>
<body>
注意：使用这个例子前，请把文件“public.key”，放在C:根目录下<br><br>
<pre>
<%
    Dim strPara, mdk
    strPara = Request.QueryString
    Response.Write("接收到来自银行的参数：" & strPara & vbcr)
    set mdk = Server.createObject("CMBChina.FirmClient")
    if mdk.exCheckInfoFromBank("c:\Public.key",strPara)=0 then
        Response.Write("验证数字签名是正确的")
    else
        Response.Write("验证数字签名不正确，是伪冒信息")
    end if
%>
</pre>
</body>
</html>
