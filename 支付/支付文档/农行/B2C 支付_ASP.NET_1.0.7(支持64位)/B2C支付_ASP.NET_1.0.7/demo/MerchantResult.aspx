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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RequestMsg();
        }
    }
    private void RequestMsg()
    {
        lblMessage.Text = "";
        lblMessage.ForeColor = System.Drawing.Color.Black;

        //1、取得MSG参数，并利用此参数值生成支付结果对象
        com.hitrust.trustpay.client.b2c.PaymentResult tResult = new com.hitrust.trustpay.client.b2c.PaymentResult();
        tResult.init(Request["MSG"]);

        //2、判断支付结果状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tResult.isSuccess())
        {
            //3、支付成功
            strMessage.Append("TrxType         = [" + tResult.getValue("TrxType") + "]<br/>");
            strMessage.Append("OrderNo         = [" + tResult.getValue("OrderNo") + "]<br/>");
            strMessage.Append("Amount          = [" + tResult.getValue("Amount") + "]<br/>");
            strMessage.Append("BatchNo         = [" + tResult.getValue("BatchNo") + "]<br/>");
            strMessage.Append("VoucherNo       = [" + tResult.getValue("VoucherNo") + "]<br/>");
            strMessage.Append("HostDate        = [" + tResult.getValue("HostDate") + "]<br/>");
            strMessage.Append("HostTime        = [" + tResult.getValue("HostTime") + "]<br/>");
            strMessage.Append("MerchantRemarks = [" + tResult.getValue("MerchantRemarks") + "]<br/>");
            strMessage.Append("PayType         = [" + tResult.getValue("PayType") + "]<br/>");
            strMessage.Append("NotifyType      = [" + tResult.getValue("NotifyType") + "]<br/>");
        }
        else
        {
            //4、支付失败
            strMessage.Append("ReturnCode   = [" + tResult.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tResult.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        
        lblMessage.Text = strMessage.ToString();
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>农行网上支付平台-商户接口范例-接收交易结果</title>
</head>
<body style="font-size: 14px;">
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
    </form>
</body>
</html>
