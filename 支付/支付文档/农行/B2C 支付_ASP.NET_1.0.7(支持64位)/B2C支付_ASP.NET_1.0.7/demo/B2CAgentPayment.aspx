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
        //1、取得委托扣款单笔代扣请求所需要的信息
        //2、生成委托扣款单笔代扣请求对象
        com.hitrust.trustpay.client.b2c.B2CAgentPaymentRequest tRequest = new com.hitrust.trustpay.client.b2c.B2CAgentPaymentRequest();
        tRequest.OrderNo = txtOrderNo.Text;         //订单编号（必要信息）
        tRequest.ExpiredDate = int.Parse(txtExpiredDate.Text);//订单有效期
        tRequest.RequestDate = txtRequestDate.Text; //验证请求日期 （必要信息 - YYYY/MM/DD）
        tRequest.RequestTime = txtRequestTime.Text; //验证请求时间 （必要信息 - HH:MM:SS）
        tRequest.Currency = txtCurrency.Text;
        tRequest.Amount = txtAmount.Text;
        tRequest.ProductId = txtProductId.Text;
        tRequest.ProductName = txtProductName.Text;
        tRequest.Quantity = txtQuantity.Text;
        tRequest.CertificateNo = txtCertificateNo.Text;
        tRequest.AgentSignNo = txtAgentSignNo.Text;

        //3、传送委托扣款单笔代扣请求
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.postRequest();
        StringBuilder strMessage = new StringBuilder("");
        if (tTrxResponse.isSuccess())
        {
            //4、委托扣款单笔代扣请求提交成功
            strMessage.Append("Success!!!");
        }
        else
        {
            //5、委托扣款单笔代扣请求提交失败，商户自定后续动作
            strMessage.Append("ReturnCode   = [" + tTrxResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-委托扣款单笔代扣</title>
</head>
<body style="font-size: 14px;">
    <center>
        委托扣款单笔代扣
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    订单编号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderNo' Text='ON200905070001' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    订单有效期</td>
                <td>
                    <asp:TextBox runat="server" ID='txtExpiredDate' Text='30' />
                    *必须,大于30的整数</td>
            </tr>
            <tr>
                <td>
                    请求日期</td>
                <td>
                    <asp:TextBox runat="server" ID='txtRequestDate' Text='2009/05/07' />
                    *必须，格式要求为YYYY/MM/DD</td>
            </tr>
            <tr>
                <td>
                    请求时间</td>
                <td>
                    <asp:TextBox runat="server" ID='txtRequestTime' Text='09:10:10' />
                    *必须，格式为HH:MM:SS</td>
            </tr>
            <tr>
                <td>
                    客户证件号码</td>
                <td>
                    <asp:TextBox runat="server" ID='txtCertificateNo' Text='340121198403084619' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    签约协议号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtAgentSignNo' Text='No200905150001' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    账单币种</td>
                <td>
                    <asp:TextBox runat="server" ID='txtCurrency' Text='RMB' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    账单金额</td>
                <td>
                    <asp:TextBox runat="server" ID='txtAmount' Text='0.01' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    商品编号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtProductId' Text='000001' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    商品名称</td>
                <td>
                    <asp:TextBox runat="server" ID='txtProductName' Text='点卡' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    商品数量</td>
                <td>
                    <asp:TextBox runat="server" ID='txtQuantity' Text='1' />
                    *必须</td>
            </tr>
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
