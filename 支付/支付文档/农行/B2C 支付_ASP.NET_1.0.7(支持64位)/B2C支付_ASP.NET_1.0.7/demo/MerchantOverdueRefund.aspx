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

    private bool ValidateRequestPara(out int iTotalCount, out decimal iTotalAmount, out string[] orderno_arr, out string[] orderamount_arr)
    {
        string tTotalCount = Request["TotalCount"];
        string tTotalAmount = Request["TotalAmount"];

        //取得列表项
        string[] v_orderno_arr = null;
        string[] v_orderamount_arr = null;
        int v_tTotalCount = 0;
        decimal v_tTotalAmount = 0;

        //初始化
        iTotalCount = v_tTotalCount;
        iTotalAmount = v_tTotalAmount;
        orderno_arr = v_orderno_arr;
        orderamount_arr = v_orderamount_arr;

        try
        {
            v_tTotalCount = int.Parse(Request["TotalCount"]);
            v_tTotalAmount = decimal.Parse(Request["TotalAmount"]);
        }
        catch (Exception ex)
        {
            lblMessage.Text = "总金额和总比数必须是数字，请重新输入!";
            return false;
        }

        string orderno = Request["orderno"];
        string orderamount = Request["orderamount"];
        if (orderno.Contains(","))
        {
            v_orderno_arr = orderno.Split(',');
        }
        else
        {
            v_orderno_arr = new string[] { orderno };
        }
        if (orderamount.Contains(","))
        {
            v_orderamount_arr = orderamount.Split(',');
        }
        else
        {
            v_orderamount_arr = new string[] { orderamount };
        }
        int orderno_length = v_orderno_arr.Length;
        int orderamount_length = v_orderamount_arr.Length;
        if (orderno_length != v_tTotalCount || orderamount_length != v_tTotalCount)
        {
            lblMessage.Text = "退款总比数和退款订单总数不一致，正确的退款总比数是：" + orderno_length;
            return false;
        }

        //验证订单非空
        foreach (string v_orderno in v_orderno_arr)
        {
            if (v_orderno == "")
            {
                lblMessage.Text = "退款订单编号不允许为空";
                return false;
            }
        }

        //验证单笔订单退款金额非空并且是数字
        decimal totalAmount = 0.0M;
        foreach (string v_orderamount in v_orderamount_arr)
        {
            if (v_orderamount != "")
            {
                try
                {
                    totalAmount = totalAmount + decimal.Parse(v_orderamount);
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "退款订单金额必须为数字";
                    return false;
                }
            }
            else
            {
                lblMessage.Text = "退款订单金额不允许为空";
                return false;
            }
        }

        //验证订单退款总金额与退款总金是否相等
        if (totalAmount != v_tTotalAmount)
        {
            lblMessage.Text = "退款总金额与退款订单总金额不一致";
            return false;
        }

        iTotalCount = v_tTotalCount;
        iTotalAmount = v_tTotalAmount;
        orderno_arr = v_orderno_arr;
        orderamount_arr = v_orderamount_arr;
        return true;
    }

    protected void btnButton_Click(object sender, EventArgs e)
    {

        string[] orderno_arr = null;
        string[] orderamount_arr = null;
        int iTotalCount = 0;
        decimal iTotalAmount = 0;

        StringBuilder strMessage = new StringBuilder("");
        //验证输入信息并取得退款所需要的信息
        if (!ValidateRequestPara(out iTotalCount, out iTotalAmount, out orderno_arr, out orderamount_arr))
            return;

        string tRemark = Request["Remark"];

        //2、取得列表项 
        ArrayList tOrderList = new ArrayList();
        for (int i = 0; i < orderno_arr.Length; i++)
        {
            string[] torder = new String[2];
            torder[0] = orderno_arr[i];
            torder[1] = orderamount_arr[i];
            tOrderList.Add(torder);

        }
        //2、生成批量退款请求对象
        com.hitrust.trustpay.client.b2c.OverdueRefundRequest tOverdueRequest = new com.hitrust.trustpay.client.b2c.OverdueRefundRequest();
        tOverdueRequest.TotalCount = iTotalCount;  //总笔数  （必要信息）
        tOverdueRequest.TotalAmount = double.Parse(iTotalAmount.ToString());  //总金额 （必要信息）
        tOverdueRequest.Remark = tRemark;//备注
        tOverdueRequest.OrderDital = tOrderList;

        //3、传送批量退款请求并取得结果
        com.hitrust.trustpay.client.TrxResponse tResponse = tOverdueRequest.postRequest();

        //4、判断批量退款结果状态，进行后续操作
        if (tResponse.isSuccess())
        {
            //5、批量退款成功
            strMessage.Append("TrxType   = [" + tResponse.getValue("TrxType") + "]<br/>");
            strMessage.Append("TotalCount  = [" + tResponse.getValue("TotalCount") + "]<br/>");
            strMessage.Append("TotalAmount = [" + tResponse.getValue("TotalAmount") + "]<br/>");
            strMessage.Append("SerialNumber  = [" + tResponse.getValue("SerialNumber") + "]<br/>");
            strMessage.Append("HostDate  = [" + tResponse.getValue("HostDate") + "]<br/>");
            strMessage.Append("HostTime  = [" + tResponse.getValue("HostTime") + "]<br/>");
            strMessage.Append("ResultMessage   = [" + tResponse.ErrorMessage + "]<br/>");
        }
        else
        {
            //6、批量退款失败
            strMessage.Append("ReturnCode   = [" + tResponse.ReturnCode + "]<br/>");
            strMessage.Append("ErrorMessage = [" + tResponse.ErrorMessage + "]<br/>");
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        lblMessage.Text = strMessage.ToString();
    }

    

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口示例-订单批量退款</title>
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
	function ValidateRequestPara(count,amount)
	{
	    //验证总比数和总金额
	    if(count == null || count == "")
		{
		    alert("批次总比数不能为空");
		    return false;
		}
		if(isNaN(count)) {
			alert("批次总笔数请输入数字！") ;
			return false ;
		}
		if(count<1)
		{
		    alert("批次总笔数必须是大于1的数字");
		    return false;
		}
		if(amount == null || amount == "")
		{
		    alert("退款总金额不能为空");
		    return false;
		}
		if(isNaN(amount))
		{
		    alert("退款总金额请输入数字！");
		    return false;
		}
		if(amount<=0)
		{
		    alert("退款总金额不能小于0");
		    return false;
		}
		
		//验证批次详情
		
		return true;
	}
	function addLine() {
		var count = form1.TotalCount.value ;
		var amount = form1.TotalAmount.value;
		if(!ValidateRequestPara(count,amount))
		    return false;
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
			for(var j = 0 ; j < 3  ; j++) {
				var col = row.insertCell() ;
				switch(j) {
				case 0 :
					col.align = "left" ;
					col.height = "30" ;
					col.innerHTML = index ;
					break ;
				case 1 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"orderno\" style=\"width:95%\" value=\"ON200905010001\">" ;
					break ;
				case 2 :
					col.align = "center" ;
					col.innerHTML = "<input type=\"text\" name=\"orderamount\" style=\"width:95%\" value=\"0.01\">" ;
					break ;
				}
			}			
		}
		ioldcount = count;
		form1.btnButton.disabled = "" ;
	}
	function submitFun() {
		var count = form1.TotalCount.value ;
		var amount = form1.TotalAmount.value;
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
        订单批量退款
    </center>
    <form id="form1" runat="server">
        <div style="color: Red; margin-bottom: 5px;">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></div>
        <br />
        <table>
            <tr width="">
                <td>
                    退款总笔数</td>
                <td>
                    <input name='TotalCount' value='10'>
                    *必须</td>
            </tr>
            <tr>
                <td>
                    退款总金额</td>
                <td>
                    <input name='TotalAmount' value='0.10'>
                    *必须</td>
                <td>
                    <input type='button' value=' 添加 ' name="AddOrder" onclick="addLine()"></td>
            </tr>
            <tr>
                <td>
                    备注</td>
                <td>
                    <input name='Remark' value='测试批量退款客户端'>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="1" style="font-size: 12px;" width="100%" id="bach">
                        <tr>
                            <td width="15%" align="center">
                                序号</td>
                            <td width="15%" align="center">
                                订单号</td>
                            <td width="15%" align="center">
                                退款金额</td>
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
