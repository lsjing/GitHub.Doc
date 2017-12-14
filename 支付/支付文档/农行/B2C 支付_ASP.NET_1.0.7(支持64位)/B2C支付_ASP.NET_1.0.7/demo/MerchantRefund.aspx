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

        //1、生成退货请求对象
        com.hitrust.trustpay.client.b2c.RefundRequest tRequest = new com.hitrust.trustpay.client.b2c.RefundRequest();
        tRequest.OrderNo = txtOrderNo.Text;                     //订单号   （必要信息）
        tRequest.TrxAmount = double.Parse(txtTrxAmount.Text);   //退货金额 （必要信息）

        //2、传送退货请求并取得退货结果
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.postRequest();

        //3、判断退货结果状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tTrxResponse.isSuccess())
        {
            //4、退货成功
            strMessage.Append("OrderNo   = [" + tTrxResponse.getValue("OrderNo") + "]<br/>");
            strMessage.Append("TrxAmount = [" + tTrxResponse.getValue("TrxAmount") + "]<br/>");
            strMessage.Append("BatchNo   = [" + tTrxResponse.getValue("BatchNo") + "]<br/>");
            strMessage.Append("VoucherNo = [" + tTrxResponse.getValue("VoucherNo") + "]<br/>");
            strMessage.Append("HostDate  = [" + tTrxResponse.getValue("HostDate") + "]<br/>");
            strMessage.Append("HostTime  = [" + tTrxResponse.getValue("HostTime") + "]<br/>");
        }
        else
        {
            //5、退货失败
            strMessage.Append("ReturnCode   = [" + tTrxResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        
        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-退货</title>
</head>
<body style="font-size: 14px;">
        <center>
            退货</center>
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
                    TrxAmount
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtTrxAmount' Text='100' /></td>
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
