<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShortLink.aspx.cs" Inherits="Alipay.Demo.ShortLink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:TextBox ID="biz_content" runat="server" Height="325px" Width="611px" TextMode="MultiLine">
{
    "sceneId":"store_pay_1",
    "remark":"门店1支付推广"
}
        </asp:TextBox>
        <br />
        <br />
        <asp:Button ID="submit" runat="server" OnClick="Button_Click" Text="提交" />
    
    </div>
    </form>
</body>
</html>
