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
        //1、取得退款批量发送请求所需要的信息
        //2、生成退款批量发送请求对象
        com.hitrust.trustpay.client.b2c.BatchSendRequest tBatchSendRequest = new com.hitrust.trustpay.client.b2c.BatchSendRequest();
        tBatchSendRequest.SerialNumber = txtSerialNumber.Text; //设定批量退款请求的流水号（必要信息）

        //3、传送退款批量发送请求并取得结果
        com.hitrust.trustpay.client.TrxResponse tResponse = tBatchSendRequest.postRequest();

        //4、判断商户退款批量发送状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tResponse.isSuccess())
        {
            //5、发送成功
            strMessage.Append("TrxType      = [" + tResponse.getValue("TrxType") + "]<br/>");
            strMessage.Append("SerialNumber = [" + tResponse.getValue("SerialNumber") + "]<br/>");
            strMessage.Append("SendTime     = [" + tResponse.getValue("SendTime") + "]<br/>");
        }
        else
        {
            //6、发送失败
            strMessage.Append("ReturnCode   = [" + tResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-退款批量文件发送</title>
</head>
<body style="font-size: 14px;">
    <center>
        退款批量文件发送
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    SerialNumber</td>
                <td>
                    <asp:TextBox runat="server" ID='txtSerialNumber' Text='1234' />
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
