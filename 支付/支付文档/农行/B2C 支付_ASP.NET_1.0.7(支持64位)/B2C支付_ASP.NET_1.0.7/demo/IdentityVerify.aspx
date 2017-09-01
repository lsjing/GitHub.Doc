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
        //1、取得身份验证请求所需要的信息
        //2、生成身份验证请求对象
        com.hitrust.trustpay.client.b2c.IdentityVerifyRequest tRequest = new com.hitrust.trustpay.client.b2c.IdentityVerifyRequest();
        tRequest.BankCardNo = txtBankCardNo.Text;                    //银行帐号       （必要信息）
        tRequest.CertificateNo = txtCertificateNo.Text;              //证件号码       （必要信息）
        tRequest.CertificateType = ddlCertificateType.SelectedValue; //证件类型       （必要信息）
        tRequest.ResultNotifyURL = txtResultNotifyURL.Text;          //身份验证回传网址（必要信息）
        tRequest.RequestDate = txtRequestDate.Text;              //验证请求日期 （必要信息 - YYYY/MM/DD）
        tRequest.RequestTime = txtRequestTime.Text;              //验证请求时间 （必要信息 - HH:MM:SS）

        //3、传送身份验证请求并取得支付网址
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.postRequest();
        StringBuilder strMessage = new StringBuilder("");
        if (tTrxResponse.isSuccess())
        {
            //4、身份验证请求提交成功，将客户端导向身份验证页面
            Response.Redirect(tTrxResponse.getValue("VerifyURL"));
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
    <title>农行网上支付平台-商户接口范例-身份验证</title>
</head>
<body style="font-size: 14px;">
    <center>
        身份验证
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    请求日期</td>
                <td>
                    <asp:TextBox runat="server" ID='txtRequestDate' Text='2008/01/17' />
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
                    <asp:DropDownList ID="ddlCertificateType" runat="server">
                        <asp:ListItem Value="I">公民身份证</asp:ListItem>
                        <asp:ListItem Value="P">中国护照</asp:ListItem>
                        <asp:ListItem Value="S">军人身份证</asp:ListItem>
                        <asp:ListItem Value="J">警官证</asp:ListItem>
                        <asp:ListItem Value="K">户口簿</asp:ListItem>
                        <asp:ListItem Value="T">临时身份证</asp:ListItem>
                        <asp:ListItem Value="F">外国护照</asp:ListItem>
                        <asp:ListItem Value="D">港澳通行证</asp:ListItem>
                        <asp:ListItem Value="W">台胞通行证</asp:ListItem>
                        <asp:ListItem Value="R">离休干部荣誉证</asp:ListItem>
                        <asp:ListItem Value="B">军官退休证</asp:ListItem>
                        <asp:ListItem Value="A">文职干部退休证</asp:ListItem>
                        <asp:ListItem Value="C">军事院校学员证</asp:ListItem>
                        <asp:ListItem Value="E">武装警察身份证</asp:ListItem>
                        <asp:ListItem Value="G">军官证</asp:ListItem>
                        <asp:ListItem Value="H">文职干部证</asp:ListItem>
                        <asp:ListItem Value="L">军人士兵证</asp:ListItem>
                        <asp:ListItem Value="M">武警士兵证</asp:ListItem>
                        <asp:ListItem Value="U">其他证件</asp:ListItem>
                    </asp:DropDownList>
                    *必须
                </td>
            </tr>
            <tr>
                <td>
                    证件号码</td>
                <td>
                    <asp:TextBox runat="server" ID='txtCertificateNo' Text='350624560911051' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    银行卡号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtBankCardNo' Text='9559980120333681118' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    结果接收URL</td>
                <td>
                    <asp:TextBox runat="server" ID='txtResultNotifyURL' Text='http://172.30.7.117/demo/IdentityVerifyResult.aspx' /><strong
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
