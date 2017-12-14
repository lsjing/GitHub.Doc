<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnButton_Click(object sender, EventArgs e)
    {
        //1、取得身份验证请求所需要的信息
        //2、生成身份验证请求对象
        com.hitrust.trustpay.client.b2c.OnlineRmtCardVerifyRequest tRequest = new com.hitrust.trustpay.client.b2c.OnlineRmtCardVerifyRequest();
        tRequest.BankCardNo = txtBankCardNo.Text;                    //银行帐号       （必要信息）
        tRequest.AccountName = txtAccountName.Text;              //持卡人姓名       （必要信息）

        //3、传送身份验证请求并取得支付网址
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.postRequest();
        StringBuilder strMessage = new StringBuilder("");
        if (tTrxResponse.isSuccess())
        {
            //4、身份验证请求提交成功，返回结果。
            string tCardVerifyResult = tTrxResponse.getValue("Status").ToString();
            strMessage.Append(tCardVerifyResult);
        }
        else
        {
            //5、身份验证请求提交失败，商户自定后续动作
            strMessage.Append("ReturnCode   = [" + tTrxResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        lblMessage.Text = strMessage.ToString();

    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-网上付款银行卡状态验证</title>
</head>
<body style="font-size: 14px;">
    <center>
        网上付款银行卡状态验证
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <table>
                <tr>
                <td>
                    银行卡号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtBankCardNo' Text='9559980120333681118' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    银行卡持有人姓名</td>
                <td>
                    <asp:TextBox runat="server" ID='txtAccountName' Text='张三' />
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
