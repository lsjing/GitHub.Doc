<html>
<body>
ע�⣺ʹ���������ǰ������ļ���public.key��������C:��Ŀ¼��<br><br>
<pre>
<%
    Dim strPara, mdk
    strPara = Request.QueryString
    Response.Write("���յ��������еĲ�����" & strPara & vbcr)
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
