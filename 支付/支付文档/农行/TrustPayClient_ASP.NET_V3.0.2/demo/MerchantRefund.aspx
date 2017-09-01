<!--
/*
 * Project: 
 *
 * Description:
 *    商户接口范例。
 *
 * Modify Information:
 *    Author        Date        Description
 *    ============  ==========  =======================================
 *    abchina       2014/04/02  V3.0.0
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

        //1、生成退款请求对象
        com.abc.trustpay.client.ebus.RefundRequest tRequest = new com.abc.trustpay.client.ebus.RefundRequest();
        tRequest.dicRequest["OrderDate"] = txtOrderDate.Text;  //订单日期（必要信息）
        tRequest.dicRequest["OrderTime"] = txtOrderTime.Text; //订单时间（必要信息）
        tRequest.dicRequest["MerRefundAccountNo"] = txtMerRefundAccountNo.Text;  //商户退款账号
        tRequest.dicRequest["MerRefundAccountName"] = txtMerRefundAccountName.Text; //商户退款名
        tRequest.dicRequest["OrderNo"] = txtOrderNo.Text; //原交易编号（必要信息）
        tRequest.dicRequest["NewOrderNo"] = txtNewOrderNo.Text; //交易编号（必要信息）
        tRequest.dicRequest["CurrencyCode"] = txtCurrencyCode.Text; //交易币种（必要信息）
        tRequest.dicRequest["TrxAmount"] = txtTrxAmount.Text; //退货金额 （必要信息）
        tRequest.dicRequest["MerchantRemarks"] = txtMerchantRemarks.Text;  //附言

        //2、传送退款请求并取得退货结果
        tRequest.postJSONRequest();

        //3、判断退款结果状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        string ReturnCode = JSON.GetKeyValue("ReturnCode");
        string ErrorMessage = JSON.GetKeyValue("ErrorMessage");
        if (ReturnCode.Equals("0000"))
        {
            //4、退款成功
            strMessage.Append("ReturnCode   = [" + ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + ErrorMessage + "]<br/>");
            strMessage.Append("OrderNo   = [" + JSON.GetKeyValue("OrderNo") + "]<br/>");
            strMessage.Append("NewOrderNo   = [" + JSON.GetKeyValue("NewOrderNo") + "]<br/>");
            strMessage.Append("TrxAmount = [" + JSON.GetKeyValue("TrxAmount") + "]<br/>");
            strMessage.Append("BatchNo   = [" + JSON.GetKeyValue("BatchNo") + "]<br/>");
            strMessage.Append("VoucherNo = [" + JSON.GetKeyValue("VoucherNo") + "]<br/>");
            strMessage.Append("HostDate  = [" + JSON.GetKeyValue("HostDate") + "]<br/>");
            strMessage.Append("HostTime  = [" + JSON.GetKeyValue("HostTime") + "]<br/>");
            strMessage.Append("iRspRef  = [" + JSON.GetKeyValue("iRspRef") + "]<br/>");
        }
        else
        {
            //5、退款失败
            strMessage.Append("ReturnCode   = [" + ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-单笔退款</title>
</head>
<body style="font-size: 14px;">
    <center>
        单笔退款</center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td>订单日期
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderDate' Text='2004/12/23' />（YYYY/MM/DD）*必输</td>
            </tr>
            <tr>
                <td>订单时间
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderTime' Text='11:55:30' />（HH:MM:SS）*必输</td>
            </tr>
            <tr>
                <td>商户退款账号
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtMerRefundAccountNo' Text='' />选输</td>
            </tr>
            <tr>
                <td>商户退款名
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtMerRefundAccountName' Text='' />选输</td>
            </tr>
            <tr>
                <td>原交易编号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderNo' Text='ON200412230001' />*必输</td>
            </tr>
            <tr>
                <td>交易编号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtNewOrderNo' Text='ON200412230001_new' />*必输</td>
            </tr>
            <tr>
                <td>交易币种
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtCurrencyCode' Text='156' />156:人民币,*必输</td>
            </tr>
            <tr>
                <td>TrxAmount
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtTrxAmount' Text='100' />*必输</td>
            </tr>
            <tr>
                <td>附言
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtMerchantRemarks' Text='' />不超过20个字符，选输</td>
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
