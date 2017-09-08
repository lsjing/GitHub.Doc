<html>
<body>
注意：使用这个例子前，请把文件“public.key”，放在C:根目录下<br><br>
<pre>
<%
    Dim strPara, mdk
    strPara = Request.QueryString
    Response.Write("接收到来自银行的参数：" & strPara & vbcr)
    set mdk = Server.createObject("CMBChina.FirmClient")
    mdk.exLoginC "0755","000354","852456"
    if mdk.QuerySingleOrder("20111111","111111",s) <> 0 then
        Response.Write("Error: " + mdk.exGetLastErr(1))
    else
        Response.Write("Result: " + s)
    end if
%>
</pre>
</body>
</html>
