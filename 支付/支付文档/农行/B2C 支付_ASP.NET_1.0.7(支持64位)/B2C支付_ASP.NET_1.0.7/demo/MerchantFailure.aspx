<!--
/*
 * Project: BJP09001
 *
 * Description:
 *    商户接口范例。
 *
 * Modify Information:
 *    Author        Date        Description
 *    ============  ==========  =======================================
 *    abchina       2009/06/02  V2.0.1 Release
 *
 */
-->
<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //1、取得参数，并利用此参数值作后续处理
        string tOrderNo = Request["OrderNo"];

        //
        //后续处理
        //...
        //...
        //
        lblMessage.Text = "接收通知失败，订单号为：" + tOrderNo;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>农行网上支付平台-商户接口范例-支付结果接收</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                支付结果<br/>
                <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>                
                <br />
                <a href='Merchant.html'>回商户首页</a></center>
        </div>
    </form>
</body>
</html>
