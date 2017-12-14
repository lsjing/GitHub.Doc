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
 *    abchina       2010/04/26  V2.0.2 Release
 *
 */
-->

<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnButton_Click(object sender, EventArgs e)
    {
        StringBuilder strMessage = new StringBuilder("");
        
        //1、取得网上付款所需要的信息
        string tSerialNumber = Request["SerialNumber"];
        string tTotalCount = Request["TotalCount"];
        string tTotalAmount = Request["TotalAmount"];
        string tCheckType = Request["CheckType"];
        string tRemark = Request["Remark"];

        //2、取得列表项
        string[] NO_arr = null;
        string[] CardNo_arr = null;
        string[] CardName_arr = null;
        string[] RemitAmount_arr = null;
        string[] Purpose_arr = null;
        int iTotalCount = 0;
        double iTotalAmount = 0D;
        
        try
        {
            iTotalCount = int.Parse(tTotalCount);
        }
        catch
        {
            strMessage.Append("ReturnCode   = [1101]<br/>");
            strMessage.Append("ErrorMessage = [付款总笔数不合法：" + tTotalCount + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = strMessage.ToString();
            return;
        }

       
        try
        {
            iTotalAmount = double.Parse(tTotalAmount);
        }
        catch
        {
            strMessage.Append("ReturnCode   = [1101]<br/>");
            strMessage.Append("ErrorMessage = [付款总金额不合法" + tTotalAmount + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = strMessage.ToString();
            return;
        }
        
        if (iTotalCount == 1)
        {
            string NO = Request["NO"];
            string CardNo = Request["CardNo"];
            string CardName = Request["CardName"];
            string RemitAmount = Request["RemitAmount"];
            string Purpose = Request["Purpose"];

            NO_arr = new string[] { NO };
            CardNo_arr = new string[] { CardNo };
            CardName_arr = new string[] { CardName };
            RemitAmount_arr = new string[] { RemitAmount };
            Purpose_arr = new string[] { Purpose };
        }
        else
        {
            NO_arr = Request["NO"].Split(',');
            CardNo_arr = Request["CardNo"].Split(',');
            CardName_arr = Request["CardName"].Split(',');
            RemitAmount_arr = Request["RemitAmount"].Split(',');
            Purpose_arr = Request["Purpose"].Split(',');
        }
        ArrayList tRemitList = new ArrayList();
        for (int i = 0; i < CardNo_arr.Length; i++)
        {
            string[] tremit = new String[5];
            tremit[0] = NO_arr[i];
            tremit[1] = CardNo_arr[i];
            tremit[2] = CardName_arr[i];
            tremit[3] = RemitAmount_arr[i];
            tremit[4] = Purpose_arr[i];
            tRemitList.Add(tremit);

        }
        //2、生成网上付款请求对象
        com.hitrust.trustpay.client.b2c.OnlineRemitRequest tOnlineRemitRequest = new com.hitrust.trustpay.client.b2c.OnlineRemitRequest();
        tOnlineRemitRequest.TotalCount = iTotalCount;  //总笔数  （必要信息）
        tOnlineRemitRequest.TotalAmount = iTotalAmount;  //总金额 （必要信息）
        tOnlineRemitRequest.SerialNumber = tSerialNumber;
        //tOnlineRemitRequest.CheckType = tCheckType;
        tOnlineRemitRequest.Remark = tRemark;//备注
        tOnlineRemitRequest.RemitDetail = tRemitList;

        //3、传送网上付款请求并取得结果
        com.hitrust.trustpay.client.TrxResponse tResponse = tOnlineRemitRequest.postRequest();

        //4、判断网上付款结果状态，进行后续操作
        if (tResponse.isSuccess())
        {
            //5、网上付款发送成功
            strMessage.Append("TrxType   = [" + tResponse.getValue("TrxType") + "]<br/>");
            strMessage.Append("TotalCount  = [" + tResponse.getValue("TotalCount") + "]<br/>");
            strMessage.Append("TotalAmount = [" + tResponse.getValue("TotalAmount") + "]<br/>");
            strMessage.Append("SerialNumber  = [" + tResponse.getValue("SerialNumber") + "]<br/>");
            strMessage.Append("ResultMessage   = [" + tResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Black;
        }
        else
        {
            //6、网上付款发送失败
            strMessage.Append("ReturnCode   = [" + tResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        
        lblMessage.Text = strMessage.ToString();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口示例-网上付款信息发送</title>
</head>

<script language="javascript">
	var stroldcount = 0;
	var ioldcount = 0;
	function formatIndex(index) {
		if(index < 10)
			return "00" + index ;
		else if(index >= 10 && index < 100)
			return "0" + index ;
		else
			return index ;
	}
	function addLine() {
		var count = form1.TotalCount.value ;
		if(isNaN(count)) {
			alert("批次总笔数请输入数字！") ;
			return false ;
		}
		ioldcount =  parseInt(stroldcount);
		count = parseInt(count) ;
		var currCount = bach.rows.length;
		for(var j = currCount ; j > 0; j--) {
		    try{
		        bach.deleteRow(j);
		    }
		    catch(e){}
		}
		
		for(var i = 1 ; i <= count - ioldcount; i++) {
			var index = formatIndex(i) ;
			var row = bach.insertRow() ;
			for(var j = 0 ; j < 5  ; j++) {
				var col = row.insertCell() ;
				switch(j) {
				case 0 :
					col.align = "left" ;
					col.height = "30" ;
					//col.innerHTML = index ;
					col.innerHTML = "<input type=\"text\" name=\"NO\" style=\"width:95%\" value= \""+index+"\" >" ;
					break ;
				case 1 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"CardNo\" style=\"width:95%\" value=\"6228430010000088888\">" ;
					break ;
				case 2 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"CardName\" style=\"width:95%\" value=\"张三\">" ;
					break ;
				case 3 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"RemitAmount\" style=\"width:95%\" value=\"1.00\">" ;
					break ;
				case 4 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"Purpose\" style=\"width:95%\" value=\"张三货款\">" ;
					break ;
				}
			}			
		}
		ioldcount = count;
		form1.btnButton.disabled = "" ;
	}
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
        网上付款信息发送
    </center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <table>
            <tr width="">
                <td>
                    付款批次流水号</td>
                <td>
                    <input name='SerialNumber' value='RMT2010073100001'>
                    *必须</td>
            </tr>
            <tr width="">
                <td>
                    批次总笔数</td>
                <td>
                    <input name='TotalCount' value='10'>
                    *必须</td>
            </tr>
            <tr>
                <td>
                    批次总金额</td>
                <td>
                    <input name='TotalAmount' value='10.00'>
                    *必须</td>
                
               
            </tr>
             <%--<tr width="">
                <td>
                    网上付款确认方式</td>
                <td>
                    <input name='CheckType' value='1'>
                   *必须（0：无需操作员确认直接付款；1：需要操作员在商户服务系统确认后付款） 
                   </td>
             
            </tr>--%>
           
            <tr>
                <td>
                    备注</td>
                <td>
                    <input name='Remark' value='网上付款测试'>
                </td>
                
            </tr>
            <tr>
            <td><input type='button' value=' 添加 ' name="AddOrder" onclick="addLine()"></td>
             </tr>
            <tr>
                <td colspan="2">
                    <table border="1" style="font-size: 12px;" width="100%" id="bach">
                        <tr>
                            <td width="15%" align="center">
                                序号</td>
                            <td width="15%" align="center">
                                收款方账号</td>
                            <td width="15%" align="center">
                                收款方户名</td>
                            <td width="15%" align="center">
                                付款金额</td>
                            <td width="15%" align="center">
                                用途</td>
                            <tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnButton" runat="server" Text="提交页面内容" OnClick="btnButton_Click" disabled="disabled" />
                    <a href='Merchant.html'>回商户首页</a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
