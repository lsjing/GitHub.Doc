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
        StringBuilder strMessage = new StringBuilder("");
        
        //1、取得委托扣款批量需要的信息
        string batchNo = Request["BatchNo"];
        string batchDate = Request["BatchDate"];
        string agentCount = Request["AgentCount"];
        string agentAmount = Request["AgentAmount"];
        string[] orderno_arr = null;
        string[] orderamount_arr = null;
        string[] expireddate_arr = null;
        string[] certificateno_arr = null;
        string[] contractid_arr = null;
        string[] productid_arr = null;
        string[] productname_arr = null;
        string[] productnum_arr = null;

        int iBatchSize = int.Parse(agentCount);
        if (iBatchSize == 1)
        {
            string orderno = Request["orderno"];
            string orderamount = Request["orderamount"];
            string expireddate = Request["expireddate"];
            string certificateno = Request["certificateno"];
            string contractid = Request["contractid"];
            string productid = Request["productid"];
            string productname = Request["productname"];
            string productnum = Request["productnum"];

            orderno_arr = new string[] { orderno };
            orderamount_arr = new string[] { orderamount };
            expireddate_arr = new string[] { expireddate };
            certificateno_arr = new string[] { certificateno };
            contractid_arr = new string[] { contractid };
            productid_arr = new string[] { productid };
            productname_arr = new string[] { productname };
            productnum_arr = new string[] { productnum };
        }
        else
        {
            orderno_arr = Request["orderno"].Split(',');
            orderamount_arr = Request["orderamount"].Split(',');
            expireddate_arr = Request["expireddate"].Split(',');
            certificateno_arr = Request["certificateno"].Split(',');
            contractid_arr = Request["contractid"].Split(',');
            productid_arr = Request["productid"].Split(',');
            productname_arr = Request["productname"].Split(',');
            productnum_arr = Request["productnum"].Split(',');
        }
        //2、生成委托扣款批量请求对象
        com.hitrust.trustpay.client.b2c.AgentBatch iAgentBatch = new com.hitrust.trustpay.client.b2c.AgentBatch();
        iAgentBatch.BatchNo = batchNo;
        iAgentBatch.BatchDate = batchDate;
        iAgentBatch.AgentAmount = double.Parse(agentAmount);
        iAgentBatch.AgentCount = int.Parse(agentCount);

        com.hitrust.trustpay.client.b2c.B2CAgentBatchRequest aB2CAgentBatchRequest = new com.hitrust.trustpay.client.b2c.B2CAgentBatchRequest();
        aB2CAgentBatchRequest.AgentBatch = iAgentBatch;
        
        //按照顺序号决定每个批次包含多少AgentBatchDetail
        for (int i = 0; i < orderno_arr.Length; i++)
        {

            com.hitrust.trustpay.client.b2c.AgentBatchDetail aAgentBatchDetail = new com.hitrust.trustpay.client.b2c.AgentBatchDetail();
            aAgentBatchDetail.OrderNo = orderno_arr[i];
            aAgentBatchDetail.OrderAmount = double.Parse(orderamount_arr[i]);
            aAgentBatchDetail.ExpiredDate = int.Parse(expireddate_arr[i]);
            aAgentBatchDetail.CertificateNo = certificateno_arr[i];
            aAgentBatchDetail.ContractID = contractid_arr[i];
            aAgentBatchDetail.ProductID = productid_arr[i];
            aAgentBatchDetail.ProductName = productname_arr[i];
            aAgentBatchDetail.ProductNum = int.Parse(productnum_arr[i]);


            aB2CAgentBatchRequest.addAgentBatchDetail(aAgentBatchDetail);
        }
        com.hitrust.trustpay.client.TrxResponse tResponse = aB2CAgentBatchRequest.postRequest();

        if (tResponse.isSuccess())
        {
            strMessage.Append("批量受理成功!");
        }
        else
        {
            strMessage.Append("ReturnCode   = [" + tResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        
        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口示例-委托扣款批量</title>
</head>

<script language="javascript">
	function formatIndex(index) {
		if(index < 10)
			return "00" + index ;
		else if(index >= 10 && index < 100)
			return "0" + index ;
		else
			return index ;
	}
	function addLine() {
		
		var count = form1.AgentCount.value ;
		if(isNaN(count)) {
			alert("批次总笔数请输入数字！") ;
			return false ;
		}
		count = parseInt(count) ;
		
		var currCount = batch.rows.length;
		for(var j = currCount ; j > 0; j--) {
		    try{
		        batch.deleteRow(j);
		    }
		    catch(e){}
		}
		for(var i = 1 ; i <= count ; i++) {
			var index = formatIndex(i) ;
			var row = batch.insertRow() ;
			for(var j = 0 ; j < 8  ; j++) {
				var col = row.insertCell() ;
				switch(j) {
				case 0 :
					col.align = "left" ;
					col.height = "30" ;
					col.innerHTML = "<input type=\"text\" name=\"orderno\" style=\"width:95%\" value=\""+ form1.BatchNo.value + index+ "\">" ;
					break ;
				case 1 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"orderamount\" style=\"width:95%\" value=\"1.00\">" ;
					break ;
				case 2 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"certificateno\" style=\"width:95%\" value=\"510230198307191135\">" ;
					break ;
				case 3 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"contractid\" style=\"width:95%\" value=\"ON2009052500100\">" ;
					break ;
				case 4 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"productid\" style=\"width:95%\" value=\"商品编号\">" ;
					break ;
				case 5 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"productname\" style=\"width:95%\" value=\"商品名称\">" ;
					break ;
				case 6 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"productnum\" style=\"width:95%\" value=\"1\">" ;
					break ;
					case 7 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"expireddate\" style=\"width:95%\" value=\"30\">" ;
					break ;
				}
				
			}			
		}
		form1.btnButton.disabled = "" ;
	}
	function submitFun() {
		var count = form1.AgentCount.value ;
		if(isNaN(count)) 
			return false ;
		count = parseInt(count) ;
		if(count == 1)
			form1.AgentAmount.value = form1.ordermount.value ;
		else  {
			var c = 0 ;		
			for(var i = 0 ; i < count ; i++) {
				c = c + parseFloat(form1.orderamount[i].value) ;
			}
			form1.AgentAmount.value = c ;
		}
		form1.submit() ;
	}
</script>

<body style="font-size: 14px;">
    <center>
        委托扣款批量
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    批次编号</td>
                <td>
                    <input name='BatchNo' value='1'>*必须</td>
            </tr>
            <tr>
                <td>
                    批次日期</td>
                <td>
                    <input name='BatchDate' value='20090527'>
                    *必须，日期格式要求为YYYYMMDD</td>
            </tr>
            <tr>
                <td>
                    批次总笔数</td>
                <td>
                    <input name='AgentCount' value='10'>
                    *必须</td>
            </tr>
            <tr>
                <td>
                    批次总金额</td>
                <td>
                    <input name='AgentAmount' value='10.00'>
                    *必须</td>
                <td>
                    <input type='button' value=' 添加 ' name="AddOrder" onclick="addLine()"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="1" style="font-size: 17px;" width="100%" id="batch">
                        <tr>
                            <td width="15%" align="center">
                                账单编号</td>
                            <td width="15%" align="center">
                                账单金额</td>
                            <td width="15%" align="center">
                                证件号码</td>
                            <td align="center">
                                签约记录</td>
                            <td align="center" width="15%">
                                商品编号</td>
                            <td align="center" width="10%">
                                商品名称</td>
                            <td align="center" width="10%">
                                商品数量</td>
                                 <td align="center" width="16%">
                                订单有效期</td>
                            <tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnButton" runat="server" Text="提交页面内容" OnClick="btnButton_Click"
                        disabled="disabled" />
                    <a href='Merchant.html'>回商户首页</a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
