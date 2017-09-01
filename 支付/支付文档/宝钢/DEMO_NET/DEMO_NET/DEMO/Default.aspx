<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DEMO._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="密码重置" onclick="Button1_Click" /> 
        <asp:Button ID="Button3" runat="server" Text="获取短信验证码接口" 
            onclick="Button3_Click" />   
        <asp:Button ID="Button4" runat="server" Text="验证短信验证码接口" 
            onclick="Button4_Click" />    
        <asp:Button ID="Button5" runat="server" Text="查询用户积分接口" 
            onclick="Button5_Click" />    
        <asp:Button ID="Button6" runat="server" Text="会员身份认证接口" 
            onclick="Button6_Click" />    
        <asp:Button ID="Button7" runat="server" Text="会员卡申请接口" 
            onclick="Button7_Click" />
        <asp:Button ID="Button8" runat="server" Text="查询用户交易明细接口(限喜试网)" 
            onclick="Button8_Click" />
        
        <asp:Button ID="Button2" runat="server" Text="获取积分交易短信验证码接口" 
            onclick="Button2_Click" />
        <asp:Button ID="Button9" runat="server" Text="积分消费接口" onclick="Button9_Click" />
        <asp:Button ID="Button10" runat="server" Text="完成订单接口" 
            onclick="Button10_Click" />
    </div>
    </form>
</body>
</html>
