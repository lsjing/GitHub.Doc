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

    protected void btnButton_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        lblMessage.ForeColor = System.Drawing.Color.Black;
        
        //1、生成商户订单查询请求对象
        com.hitrust.trustpay.client.b2c.QueryOrderRequest tRequest = new com.hitrust.trustpay.client.b2c.QueryOrderRequest();
        tRequest.OrderNo = txtOrderNo.Text;  //订单号           （必要信息）
        if (txtDetailQuery.Text == "0") //是否查询详细信息 （必要信息）
        {
            tRequest.EnableDetailQuery = false;
        }
        else if (txtDetailQuery.Text == "1")
        {
            tRequest.EnableDetailQuery = true;
        }
        else
        {
            lblMessage.Text = "DetailQuery（0：状态查询； 1：详细查询）设置不正确";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        //2、传送商户订单查询请求并取得订单查询结果
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.postRequest();

        //3、判断商户订单查询结果状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tTrxResponse.isSuccess())
        {
            //4、生成订单对象
            com.hitrust.trustpay.client.b2c.Order tOrder = new com.hitrust.trustpay.client.b2c.Order();
            tOrder.initByString(tTrxResponse.getValue("Order"));

            strMessage.Append("OrderNo      = [" + tOrder.OrderNo + "]<br/>");
            strMessage.Append("OrderAmount  = [" + tOrder.OrderAmount + "]<br/>");
            strMessage.Append("OrderDesc    = [" + tOrder.OrderDesc + "]<br/>");
            strMessage.Append("OrderDate    = [" + tOrder.OrderDate + "]<br/>");
            strMessage.Append("OrderTime    = [" + tOrder.OrderTime + "]<br/>");
            strMessage.Append("OrderURL     = [" + tOrder.OrderURL + "]<br/>");
            strMessage.Append("PayAmount    = [" + tOrder.PayAmount + "]<br/>");
            strMessage.Append("RefundAmount = [" + tOrder.RefundAmount + "]<br/>");
            strMessage.Append("OrderStatus  = [" + tOrder.OrderStatus + "]<br/>");

            //5、取得订单明细
            foreach (com.hitrust.trustpay.client.b2c.OrderItem tOrderItem in tOrder.OrderItems)
            {
                strMessage.Append("ProductID   = [" + tOrderItem.ProductID + "]<br/>");
                strMessage.Append("ProductName = [" + tOrderItem.ProductName + "]<br/>");
                strMessage.Append("UnitPrice   = [" + tOrderItem.UnitPrice + "]<br/>");
                strMessage.Append("Qty         = [" + tOrderItem.Qty + "]<br/>");
            }
        }
        else
        {
            //6、商户订单查询失败
            strMessage.Append("ReturnCode   = [" + tTrxResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-订单查询</title>
</head>
<body style="font-size: 14px;">
        <center>
            订单查询</center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    OrderNo</td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderNo' Text='ON200412230001' /></td>
            </tr>
            <tr>
                <td>
                    DetailQuery（0：状态查询； 1：详细查询）</td>
                <td>
                    <asp:TextBox runat="server" ID='txtDetailQuery' Text='0' /></td>
            </tr>
            <tr>
                <td colspan="2">
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnButton" runat="server" Text="提交页面内容" OnClick="btnButton_Click" />
                        <a href='Merchant.html'>回商户首页</a>
                    </td>
                </tr>
        </table>
    </form>
</body>
</html>
