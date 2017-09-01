<%@ page language="C#" autoeventwireup="true" inherits="Alipay.Demo.MessageSend, App_Web_bsdjf31g" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="biz_content" runat="server" Height="325px" Width="611px" OnTextChanged="TextBox1_TextChanged" TextMode="MultiLine">
{
    "title":"publiccore 2.0老接口测试",
    "remark":"调用publiccore老接口"
}

        </asp:TextBox>
        <br />
        <br />
        <asp:Button ID="submit" runat="server" OnClick="Button1_Click" Text="提交" />
    
    </div>
    </form>
</body>
</html>
