<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryOrderByNo.aspx.cs" Inherits="BFBWeb.QueryOrderByNo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title> 百度钱包查询接口</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    订单号: <input type="text" id="order_no_f" value="2013122523260286" runat="server"/>*必填<br/> 
     <asp:Button id="btnSubmit" runat="server" font-size="Smaller"
                        onclick="btnSubmit_Click" text="提交" height="25px" />
    </div>
    </form>
</body>
</html>
