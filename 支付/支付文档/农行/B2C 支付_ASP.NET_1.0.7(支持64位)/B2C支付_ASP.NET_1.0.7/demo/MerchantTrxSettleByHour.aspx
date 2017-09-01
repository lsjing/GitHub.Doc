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


        //1、生成商户对账单下载请求对象
        com.hitrust.trustpay.client.b2c.SettleRequest tRequest = new com.hitrust.trustpay.client.b2c.SettleRequest();
        tRequest.SettleDate = txtSettleDate.Text;           //对账日期YYYY/MM/DD （必要信息）
        tRequest.SettleStartHour = txtSettleStartHour.Text; //对账开始时间（必要信息）
        tRequest.SettleEndHour = txtSettleEndHour.Text;     //对账截止时间（必要信息）
        tRequest.SettleType = "TRXBYHOUR";                  //对账类型 （必要信息）

        //2、传送商户对账单下载请求并取得对账单
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.postRequest();

        //3、判断商户对账单下载结果状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tTrxResponse.isSuccess())
        {
            //4、商户对账单下载成功，生成对账单对象
            com.hitrust.trustpay.client.b2c.SettleFile tSettleFile = new com.hitrust.trustpay.client.b2c.SettleFile();
            tSettleFile.init(tTrxResponse);
            strMessage.Append("SettleDate        = [" + tSettleFile.SettleDate + "]<br/>");
            strMessage.Append("SettleType        = [" + tSettleFile.SettleType + "]<br/>");
            strMessage.Append("NumOfPayments     = [" + tSettleFile.NumOfPayments + "]<br/>");
            strMessage.Append("SumOfPayAmount    = [" + tSettleFile.SumOfPayAmount + "]<br/>");
            strMessage.Append("NumOfRefunds      = [" + tSettleFile.NumOfRefunds + "]<br/>");
            strMessage.Append("SumOfRefundAmount = [" + tSettleFile.SumOfRefundAmount + "]<br/>");

            //5、取得对账单明细
            ArrayList tRecords = tSettleFile.DetailRecords;
            for (int i = 0; i < tRecords.Count; i++)
            {
                strMessage.Append("Record-" + i + " = [" + tRecords[i] + "]<br/>");
            }
        }
        else
        {
            //6、商户账单下载失败
            strMessage.Append("ReturnCode   = [" + tTrxResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");

            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        lblMessage.Text = strMessage.ToString();
    }        

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-指定时间段交易对账单下载</title>
</head>
<body style="font-size: 14px;">
        <center>
            指定时间段交易对账单下载</center>
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
                <td>
                    SettleStartHour</td>
                <td>
                    <asp:TextBox runat="server" ID='txtSettleStartHour' Text='0' />(0-23)</td>
            </tr>
            <tr>
                <td>
                    SettleEndHour</td>
                <td>
                    <asp:TextBox runat="server" ID='txtSettleEndHour' Text='0' />(0-23)</td>
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
