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

        //1、取得超期退款结果查询请求所需要的信息
        //2、生成超期退款结果查询请求对象
        com.hitrust.trustpay.client.b2c.QueryOverdueRefundRequest tQueryBatchRequest = new com.hitrust.trustpay.client.b2c.QueryOverdueRefundRequest();
        tQueryBatchRequest.SerialNumber = txtSerialNumber.Text; //设定超期退款结果查询请求的流水号（必要信息）

        //3、传送超期退款结果查询请求并取得结果
        com.hitrust.trustpay.client.TrxResponse tResponse = tQueryBatchRequest.postRequest();
        //4、判断超期退款结果查询状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tResponse.isSuccess())
        {
            //5、生成批量对象
            com.hitrust.trustpay.client.b2c.OverdueBatch tBatch = new com.hitrust.trustpay.client.b2c.OverdueBatch(new com.hitrust.trustpay.client.XMLDocument(tResponse.getValue("QueryOverdueRefund")));
            strMessage.Append("SerialNumber  = [" + tBatch.SerialNumber + "]<br/>");
            strMessage.Append("RefundAmount  = [" + tBatch.RefundAmount + "]<br/>");
            strMessage.Append("RefundCount   = [" + tBatch.RefundCount + "]<br/>");
            strMessage.Append("BatchStatus   = [" + tBatch.Status + "]<br/>");

            //6、取得订单明细
            ArrayList tOrders = tBatch.Orders;
            for (int i = 0; i < tOrders.Count; i++)
            {
                com.hitrust.trustpay.client.b2c.Order tOrder = (com.hitrust.trustpay.client.b2c.Order)tOrders[i];
                strMessage.Append("OrderNo   = [" + tOrder.OrderNo + "]<br/>");
                strMessage.Append("RefundAmount = [" + tOrder.RefundAmount + "]<br/>");
                strMessage.Append("OrderStatus  = [" + tOrder.OrderStatus + "]<br/>");
                strMessage.Append("OrderDesc  = [" + tOrder.OrderDesc + "]<br/>");
            }
        }
        else
        {
            //7、超期退款结果查询失败
            strMessage.Append("ReturnCode   = [" + tResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-查询超期退款处理结果</title>
</head>
<body style="font-size: 14px;">
        <center>
            查询超期退款处理结果</center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    业务流水号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtSerialNumber' Text='30' /></td>
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
