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

        //1、取得赎回、分红、托收请求信息
        //2、生成请求对象
        com.hitrust.trustpay.client.b2c.B2CAgentBatchQueryRequest tRequest = new com.hitrust.trustpay.client.b2c.B2CAgentBatchQueryRequest();
        tRequest.BatchNo = txtBatchNo.Text; //请求批次号       （必要信息）
        tRequest.BatchDate = txtBatchDate.Text; //请求日期      YYYY/MM/DD

        //3、传送请求并取得结果
        com.hitrust.trustpay.client.TrxResponse tResponse = tRequest.postRequest();

        //4、判断结果状态，进行后续操作
        StringBuilder strMessage = new StringBuilder("");
        if (tResponse.isSuccess())
        {
            //5、请求成功
            //5、商户对账单下载成功，生成对账单对象
            com.hitrust.trustpay.client.b2c.AgentBatch tAgentBatch = new com.hitrust.trustpay.client.b2c.AgentBatch(new com.hitrust.trustpay.client.XMLDocument(tResponse.getValue("AgentBatch")));
            strMessage.Append("BatchNo  = [" + tAgentBatch.BatchNo + "]<br/>");
            strMessage.Append("BatchDate    = [" + tAgentBatch.BatchDate + "]<br/>");
            strMessage.Append("BatchTime    = [" + tAgentBatch.BatchTime + "]<br/>");
            strMessage.Append("AgentAmount  = [" + tAgentBatch.AgentAmount + "]<br/>");
            strMessage.Append("AgentCount    = [" + tAgentBatch.AgentCount + "]<br/>");
            strMessage.Append("BatchStatus    = [" + tAgentBatch.BatchStatus + "]<br/>");
            strMessage.Append("BatchStatusZH    = [" + tAgentBatch.getBatchSatusChinese(tAgentBatch.BatchStatus) + "]<br/>");
            //6、取得对账单明细
            ArrayList tAgentBatchDetails = tAgentBatch.AgentBatchDetail;
            for (int i = 0; i < tAgentBatchDetails.Count; i++)
            {
                com.hitrust.trustpay.client.b2c.AgentBatchDetail tAgentBatchDetail = (com.hitrust.trustpay.client.b2c.AgentBatchDetail)tAgentBatchDetails[i];
                strMessage.Append("SeqNo   = [" + (i + 1) + "],");
                strMessage.Append("OrderNo   = [" + tAgentBatchDetail.OrderNo + "],");
                strMessage.Append("OrderAmount = [" + tAgentBatchDetail.OrderAmount + "],");
                strMessage.Append("CertificateNo  = [" + tAgentBatchDetail.CertificateNo + "],");
                strMessage.Append("ContractID = [" + tAgentBatchDetail.ContractID + "],");
                strMessage.Append("ProductID   = [" + tAgentBatchDetail.ProductID + "],");
                strMessage.Append("ProductName = [" + tAgentBatchDetail.ProductName + "],");
                strMessage.Append("ProductNum  = [" + tAgentBatchDetail.ProductNum + "],");
                strMessage.Append("OrderStatus  = [" + tAgentBatchDetail.OrderStatus + "],");
                strMessage.Append("OrderStatusZH  = [" + tAgentBatchDetail.getStatusChinese(tAgentBatchDetail.OrderStatus) + "]<br/>");
            }
        }
        else
        {
            //6、批量结果查询失败
            strMessage.Append("ReturnCode   = [" + tResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-委托扣款批量处理结果结果查询</title>
</head>
<body style="font-size: 14px;">
    <center>
        委托扣款批量处理结果查询
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    批次编号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtBatchNo' Text='30' /></td>
            </tr>
            <tr>
                <td>
                    批次日期</td>
                <td>
                    <asp:TextBox runat="server" ID='txtBatchDate' Text='20090509' /></td>
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
