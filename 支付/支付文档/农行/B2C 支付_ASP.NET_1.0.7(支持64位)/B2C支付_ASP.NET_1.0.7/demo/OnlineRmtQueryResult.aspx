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
 *    abchina       2009/06/07  V2.0.1 Release
 *
 */
-->

<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnButton_Click(object sender, EventArgs e)
    {
        StringBuilder strMessage = new StringBuilder("");

        string tSerialNumber = SerialNumber.Text;
        string tReceiveAccount = ReceiveAccount.Text;
        
        //1、生成网上付款交易结果查询请求对象
        com.hitrust.trustpay.client.b2c.OnlineRmtQueryResultRequest tRequest = new com.hitrust.trustpay.client.b2c.OnlineRmtQueryResultRequest();
        tRequest.SerialNumber = tSerialNumber;
        //tRequest.PayAccount = PayAccount.Text;
        tRequest.ReceiveAccount = tReceiveAccount;
        tRequest.StartTime = StartTime.Text;
        tRequest.EndTime = EndTime.Text;
        //tRequest.Remark = Remark.Text;
         
        //2、传送网上付款交易结果查询请求并取得结果
        com.hitrust.trustpay.client.TrxResponse tTrxResponse = tRequest.postRequest();
        if (tTrxResponse.isSuccess())
        {
            //生成批量对象
            com.hitrust.trustpay.client.b2c.OnlineRmtBatch tBatch = new com.hitrust.trustpay.client.b2c.OnlineRmtBatch(new com.hitrust.trustpay.client.XMLDocument(tTrxResponse.getValue("ResultSets")));
            //3、输出查询结果
            if (!string.IsNullOrEmpty(tSerialNumber) && string.IsNullOrEmpty(tReceiveAccount))
            {                
                strMessage.Append("SerialNumber   = [" + tTrxResponse.getValue("SerialNumber") + "]<br/>");
                strMessage.Append("TrnxTime        = [" + tTrxResponse.getValue("TrnxTime") + "]<br/>");
                strMessage.Append("TotalCount     = [" + tTrxResponse.getValue("TotalCount") + "]<br/>");
                strMessage.Append("TotalAmount    = [" + tTrxResponse.getValue("TotalAmount") + "]<br/>");
                strMessage.Append("Status         = [" + tTrxResponse.getValue("Status") + "]<br/>");
                strMessage.Append("SuccessAmount  = [" + tTrxResponse.getValue("SuccessAmount") + "]<br/>");
                strMessage.Append("SuccessCount   = [" + tTrxResponse.getValue("SuccessCount") + "]<br/>");
                strMessage.Append("FailAmount     = [" + tTrxResponse.getValue("FailAmount") + "]<br/>");
                strMessage.Append("FailCount      = [" + tTrxResponse.getValue("FailCount") + "]<br/>");

                //4、取得查询结果明细
                ArrayList tQueryResults = tBatch.QueryResults;
                for (int i = 0; i < tQueryResults.Count; i++)
                {
                    com.hitrust.trustpay.client.b2c.QueryResult tQueryResult = (com.hitrust.trustpay.client.b2c.QueryResult)tQueryResults[i];
                    strMessage.Append("No                   = [" + tQueryResult.No + "]<br/>");
                    strMessage.Append("PayAccountNo         = [" + tQueryResult.PayAccountNo + "]<br/>");
                    strMessage.Append("PayAccountName       = [" + tQueryResult.PayAccountName + "]<br/>");
                    strMessage.Append("ReceiveAccountNo     = [" + tQueryResult.ReceiveAccountNo + "]<br/>");
                    strMessage.Append("ReceiveAccountName   = [" + tQueryResult.ReceiveAccountName + "]<br/>");
                    strMessage.Append("Purpose              = [" + tQueryResult.Purpose + "]<br/>");
                    strMessage.Append("PayAmount            = [" + tQueryResult.PayAmount + "]<br/>");
                    strMessage.Append("Status               = [" + tQueryResult.Status + "]<br/>");
                    strMessage.Append("FailReason           = [" + tQueryResult.FailReason + "]<br/>");                    
                }
            }
            else if (string.IsNullOrEmpty(tSerialNumber) && !string.IsNullOrEmpty(tReceiveAccount))
            {
                //5、取得查询结果明细
                ArrayList tQueryResults = tBatch.QueryResults;
                for (int i = 0; i < tQueryResults.Count; i++)
                {
                    com.hitrust.trustpay.client.b2c.QueryResult tQueryResult = (com.hitrust.trustpay.client.b2c.QueryResult)tQueryResults[i];
                    strMessage.Append("No                   = [" + tQueryResult.No + "]<br/>");
                    strMessage.Append("SerialNumber         = [" + tQueryResult.SerialNumber + "]<br/>");
                    strMessage.Append("TrnxTime             = [" + tQueryResult.TrnxTime + "]<br/>");
                    strMessage.Append("PayAccountNo         = [" + tQueryResult.PayAccountNo + "]<br/>");
                    strMessage.Append("PayAccountName       = [" + tQueryResult.PayAccountName + "]<br/>");
                    strMessage.Append("ReceiveAccountNo     = [" + tQueryResult.ReceiveAccountNo + "]<br/>");
                    strMessage.Append("ReceiveAccountName   = [" + tQueryResult.ReceiveAccountName + "]<br/>");
                    strMessage.Append("Purpose              = [" + tQueryResult.Purpose + "]<br/>");
                    strMessage.Append("PayAmount            = [" + tQueryResult.PayAmount.ToString("0.00") + "]<br/>");
                    strMessage.Append("Status               = [" + tQueryResult.Status + "]<br/>");
                    strMessage.Append("FailReason           = [" + tQueryResult.FailReason + "]<br/>");
                }
            }
            else if (!string.IsNullOrEmpty(tSerialNumber) && !string.IsNullOrEmpty(tReceiveAccount))
            {
                //5、取得查询结果明细
                ArrayList tQueryResults = tBatch.QueryResults;
                for (int i = 0; i < tQueryResults.Count; i++)
                {
                    com.hitrust.trustpay.client.b2c.QueryResult tQueryResult = (com.hitrust.trustpay.client.b2c.QueryResult)tQueryResults[i];
                    strMessage.Append("No                   = [" + tQueryResult.No + "]<br/>");
                    strMessage.Append("SerialNumber         = [" + tQueryResult.SerialNumber + "]<br/>");
                    strMessage.Append("TrnxTime             = [" + tQueryResult.TrnxTime + "]<br/>");
                    strMessage.Append("PayAccountNo         = [" + tQueryResult.PayAccountNo + "]<br/>");
                    strMessage.Append("PayAccountName       = [" + tQueryResult.PayAccountName + "]<br/>");
                    strMessage.Append("ReceiveAccountNo     = [" + tQueryResult.ReceiveAccountNo + "]<br/>");
                    strMessage.Append("ReceiveAccountName   = [" + tQueryResult.ReceiveAccountName + "]<br/>");
                    strMessage.Append("Purpose              = [" + tQueryResult.Purpose + "]<br/>");
                    strMessage.Append("PayAmount            = [" + tQueryResult.PayAmount + "]<br/>");
                    strMessage.Append("Status               = [" + tQueryResult.Status + "]<br/>");
                    strMessage.Append("FailReason           = [" + tQueryResult.FailReason + "]<br/>");
                }
            }                 
        }
        else
        {
            
            strMessage.Append("ReturnCode   = [" + tTrxResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tTrxResponse.ErrorMessage + "]<br/>");
        }

        lblMessage.ForeColor = System.Drawing.Color.Red;
        lblMessage.Text = strMessage.ToString();    
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口示例-网上付款交易结果查询</title>
</head>

<script language="javascript">	
	function submitFun() {
		var count = form1.TotalCount.value ;
		if(isNaN(count)) 
			return false ;
		count = parseInt(count) ;
		if(count == 1)
			form1.TotalAmount.value = form1.orderamount.value ;
		else  {
			var c = 0 ;	
			c = parseFloat(c);
			for(var i = 0 ; i < count ; i++) {
				c = c + parseFloat(form1.orderamount[i].value) ;
			}
			form1.TotalAmount.value = c ;
		}
		form1.submit() ;
	}
</script>

<body style="font-size: 14px;">
    <center>
        网上付款交易结果查询
    </center>
   
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    付款流水号</td>
                <td>
                <asp:TextBox runat="server" ID='SerialNumber' Text='' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    收款方账号</td>
                <td>
                    <asp:TextBox runat="server" ID='ReceiveAccount' Text='' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    起始日期</td>
                <td>
                    <asp:TextBox runat="server" ID='StartTime' Text='2010/06/29' />
                    *必须</td>
            </tr>
            <tr>
                <td>
                    截止日期</td>
                <td>
                    <asp:TextBox runat="server" ID='EndTime' Text='2010/06/30' />
                    *必须</td>
            </tr>
            <%--<tr>
                <td>
                    备注</td>
                <td>
                    <asp:TextBox runat="server" ID='Remark' Text='网上付款交易结果查询' />
                </td>
            </tr>     --%>       
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
