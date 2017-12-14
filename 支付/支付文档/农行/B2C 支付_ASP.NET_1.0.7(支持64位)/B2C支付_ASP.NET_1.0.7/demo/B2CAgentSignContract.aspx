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
        //1、取得委托扣款签约请求所需要的信息
        //2、生成委托扣款签约请求对象
        com.hitrust.trustpay.client.b2c.B2CAgentSignContractRequest tRequest = new com.hitrust.trustpay.client.b2c.B2CAgentSignContractRequest();
        tRequest.OrderNo = txtOrderNo.Text;                         //订单编号（必要信息）
        tRequest.CertificateNo = txtCertificateNo.Text;             //证件号码       （必要信息）
        tRequest.CertificateType = ddlCertificateType.SelectedValue;//证件类型       （必要信息）
        tRequest.CardType = txtCardType.Text;                         //农行卡类型
        tRequest.ResultNotifyURL = txtResultNotifyURL.Text;         //身份验证回传网址（必要信息）
        tRequest.RequestDate = txtRequestDate.Text;                 //验证请求日期 （必要信息 - YYYY/MM/DD）
        tRequest.RequestTime = txtRequestTime.Text;                 //验证请求时间 （必要信息 - HH:MM:SS）
        tRequest.NotifyType = txtNotifyType.Text;

        //3、传送委托扣款签约请求并取得签约网址
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.postRequest();
        StringBuilder strMessage = new StringBuilder("");
        if (tTrxResponse.isSuccess())
        {
            //4、委托扣款签约请求提交成功，将客户端导向签约页面
            Response.Redirect(tTrxResponse.getValue("B2CAgentSignContractURL"));
        }
        else
        {
            //5、委托扣款签约请求提交失败，商户自定后续动作
            strMessage.Append("ReturnCode   = [" + tTrxResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-委托扣款签约</title>
</head>
<body style="font-size: 14px;">
    <center>
        委托扣款签约
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    订单编号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderNo' Text='ON200905080001' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    请求日期</td>
                <td>
                    <asp:TextBox runat="server" ID='txtRequestDate' Text='2009/05/08' />
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
                    证件类型</td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlCertificateType">
                        <asp:ListItem Value="I">公民身份证</asp:ListItem>
                    </asp:DropDownList>
                    *必须，目前只支持公民身份证
                </td>
            </tr>
            <tr>
                <td>
                    证件号码</td>
                <td>
                    <asp:TextBox runat="server" ID='txtCertificateNo' Text='340121198403084619' />
                    *必须</td>
            </tr>
            <tr>
                <td>签约卡类型</td>
                <td><asp:TextBox runat="server" ID='txtCardType' Text='1'/> 1:农行借记卡准贷记卡 2:农行贷记卡  A:农行卡合并</td>
            </tr>
            <tr>
                <td>
                    NotifyType
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtNotifyType' Text='1' />0：URL页面通知 1：服务器通知</td>
            </tr>
            <tr>
                <td>
                    结果接收URL</td>
                <td>
                    <asp:TextBox runat="server" ID='txtResultNotifyURL' Text='http://172.30.7.117/demo/B2CAgentSignResult.aspx' /><strong
                        style="color: #ff0000">*必须</strong></td>
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
