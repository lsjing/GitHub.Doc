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
 *    abchina       2012/05/04  V2.0.11 Release
 *
 */
-->
<%@ Page Language="C#"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnButton_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        lblMessage.ForeColor = System.Drawing.Color.Black;

        //1、生成商户对账单下载请求对象
        com.hitrust.trustpay.client.b2c.CBPSettleRequest tRequest = new com.hitrust.trustpay.client.b2c.CBPSettleRequest();
        tRequest.SettleDate = txtSettleDate.Text;   //对账日期YYYY/MM/DD （必要信息）
        tRequest.SettleType = "SETTLE";                //对账类型 （必要信息）

        //2、传送商户对账单下载请求并取得对账单   
        string settleFilePath = txtsettleFilePath.Text;
        string settleFilePaths = settleFilePath.Replace("/","\\\\");
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.extendPostRequest(1);
        
        //3、判断商户对账单下载结果状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tTrxResponse.isSuccess())
        {
            //4、商户对账单下载成功，或者没有可以下载的文件，在ErrorMessage中有说明
            com.hitrust.trustpay.client.b2c.CBPSettleFile tCBPSettleFile = new com.hitrust.trustpay.client.b2c.CBPSettleFile(tTrxResponse, settleFilePath);

            if (tCBPSettleFile.Flag)
            {
                strMessage.Append("下载对账文件成功 <br/>");
                strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");
                //strMessage.Append("SettleDate     = [" + tCBPSettleFile.SettleDate + "]<br>");
                //strMessage.Append("FileName     = [" + tCBPSettleFile.FileName + "]<br>");

            }
            else
            {
                strMessage.Append("文件不存在<br/>");
            }
          
        }
        else
        {
            //5、商户对账单下载失败
            strMessage.Append("下载对账文件失败 <br/>");
            strMessage.Append("ReturnCode   = [" + tTrxResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        
        lblMessage.Text = strMessage.ToString();
        lblMessage.ForeColor = System.Drawing.Color.Red;
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-第三方支付机构对账单下载</title>
</head>
<body style="font-size: 14px;">
        <center>
            交易对账单下载</center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    SettleDate</td>
                <td>
                    <asp:TextBox runat="server" ID='txtSettleDate' Text='2012/05/04' />（YYYY/MM/DD）</td>
            </tr>
             <tr>
                <td>
                    settleFilePath</td>
                <td>
                    <asp:TextBox runat="server" ID='txtsettleFilePath' Text='E:/settle.zip' /></td>
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

