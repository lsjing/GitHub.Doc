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

        //1、取得商户对账单下载所需要的信息    
        //2、生成商户对账单下载请求对象
        com.hitrust.trustpay.client.b2c.SettleRequest tRequest = new com.hitrust.trustpay.client.b2c.SettleRequest();
        tRequest.SettleDate = txtSettleDate.Text;               //对账日期YYYY/MM/DD （必要信息）
        tRequest.SettleType = com.hitrust.trustpay.client.b2c.SettleFile.SETTLE_TYPE_CREDIT_TRX;//对账类型 （必要信息）

        //3、传送商户对账单下载请求并取得对账单
        com.hitrust.trustpay.client.TrxResponse tResponse = tRequest.postRequest();

        //4、判断商户对账单下载结果状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tResponse.isSuccess())
        {
            //5、商户对账单下载成功，生成对账单对象
            com.hitrust.trustpay.client.b2c.SettleFile tSettleFile = new com.hitrust.trustpay.client.b2c.SettleFile();
            tSettleFile.init(tResponse);
            strMessage.Append("SettleDate        = [" + tSettleFile.SettleDate + "]<br/>");
            strMessage.Append("SettleType        = [" + tSettleFile.SettleType + "]<br/>");
            strMessage.Append("NumOfPayments     = [" + tSettleFile.NumOfPayments + "]<br/>");
            strMessage.Append("SumOfPayAmount    = [" + tSettleFile.SumOfPayAmount + "]<br/>");
            strMessage.Append("NumOfRefunds      = [" + tSettleFile.NumOfRefunds + "]<br/>");
            strMessage.Append("SumOfRefundAmount = [" + tSettleFile.SumOfRefundAmount + "]<br/>");

            //6、取得对账单明细
            ArrayList tRecords = tSettleFile.DetailRecords;
            for (int i = 0; i < tRecords.Count; i++)
            {
                strMessage.Append("Record-" + i + " = [" + tRecords[i] + "]<br/>");
            }
        }
        else
        {
            //7、商户账单下载失败
            strMessage.Append("ReturnCode   = [" + tResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        lblMessage.Text = strMessage.ToString();
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-贷记卡交易对账单下载</title>
</head>
<body style="font-size: 14px;">
    <center>
        贷记卡交易对账单下载
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    SettleDate</td>
                <td>
                    <asp:TextBox runat="server" ID='txtSettleDate' Text='2009/06/01' />（YYYY/MM/DD）</td>
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
