<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paytest1.aspx.cs" Inherits="paytest1" %>
 <%
    
     string datetimeStri = DateTime.Now.ToString("yyyyMMddHHmmss");
     string webPgURL = "http://211.155.122.70:443/payPgnotify.aspx";
     string webBgURL = "http://211.155.122.70:443/payBgnotify.aspx";
    string path = Request.Path;
      %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link href="css/s_css.css" rel="stylesheet" type="text/css">
 <title>新奥科技---支付请求</title>
		<div id="sending"
			style="position:absolute; top:300; left:120; z-index:10; visibility:hidden">
			<table width="100%" Border="0" CELLSPACING="0" CELLPADDING="0">
				<TR>
					<td width=30%></td>
					<TD bgcolor=#ff9900>
						<TABLE WIDTH=100% height=70 BORDER=0 CELLSPACING=2 CELLPADDING=0>
							<TR>
								<td bgcolor=#eeeeee align=center>
									新奥科技---支付正在进行, 请稍候...
								</td>
							</tr>
						</table>
					</td>
					<td width=30%></td>
				</tr>
			</table>
		</div>
	
        <script type="text/javascript" src="Scripts/jquery-1.4.1.js" charset="utf-8" ></script>
		<script>

		    function dokeydown() {
		        if (event.keyCode == 13) {
		            doSubmit();
		        }
		    }

		    $(document).keydown(function (event) {
		        var curKey = event.which;
		        if (curKey == 13) {
		            doSubmit();
		        }
		    });

		    function doSubmit() {
		        sending.style.visibility = "visible";
		        cardform.action = "paytest2.aspx";
		        cardform.submit();
		        cardform.paymentSumbit.disabled = true;
		    }


</script>
		
	</head>

	<body style="BACKGROUND-COLOR: transparent" onload="doLoad()">

		<form name="cardform" method="post">


			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="4%">
										&nbsp;
								</td>
								<td width="96%" class="title">
									新奥科技支付请求--订单信息
								</td>
							</tr>
							<tr>
								<td colspan="2" height="1" background="/pic/s_line.gif"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" style="padding-top:10px ">
						<table width="95%" border="1" align="center" cellpadding="0"
							cellspacing="0" style="border-collapse:collapse"
							bordercolor="#E7E7E7">
							<tr>
								<td align="right">
									商户号<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="MERCHANTID" value='1310000002' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>

							<tr>
								<td align="right">
									商户子商户号：
								</td>
								<td>
									<input name="SUBMERCHANTID" value='1310000002' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单号<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ORDERSEQ" value='<%=datetimeStri %>' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单请求交易流水号<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ORDERREQTRANSEQ" value='<%=datetimeStri %>000001' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单日期<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ORDERDATE" value='<%=datetimeStri %>' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单总金额(分)<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ORDERAMOUNT" value='1' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									产品金额(分)<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="PRODUCTAMOUNT" value='1' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									附加金额(分)<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ATTACHAMOUNT" value='0' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									币种<span style="color:Red;">*</span>：
								</td>
								<td>
								<select name="CURTYPE" class="normal_input" tabindex="1">
									<option value="RMB" selected>RMB</option>
									<option value="USA" >USA</option>
								</select>
								</td>
							</tr>
							<tr>
								<td align="right">
									加密方式<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ENCODETYPE" value='1' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									交易返回的url地址<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="MERCHANTURL"
										value='<%=webPgURL%>'
										type="text" class="normal_input" size="60" maxlength="60"
										tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									交易后台返回的url地址<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="BACKMERCHANTURL"
										value='<%=webBgURL%>'
										type="text" class="normal_input" size="60" maxlength="60"
										tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									商家附加信息：
								</td>
								<td>
									<input name="ATTACH" value='' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									业务类型<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="BUSICODE" value='0001' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									产品标识<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="PRODUCTID" value='02' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									终端号码：
								</td>
								<td>
									<input name="TMNUM" value='' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									客户标识：
								</td>
								<td>
									<input name="CUSTOMERID" value='' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									产品描述：
								</td>
								<td>
									<input name="PRODUCTDESC" value='' type="text"
										class="normal_input" size="60"  tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									分账明细：
								</td>
								<td>
									<input name="DIVDETAILS" value='' type="text"
										class="normal_input"  style="width: 500px;" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									分期数：
								</td>
								<td>
									<input name="PEDCNT" value='1' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单关闭时间：
								</td>
								<td>
									<input name="GMTOVERTIME" value='' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>

							<tr>
								<td align="right">
									CLIENTIP<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="CLIENTIP" value='127.0.0.1' type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>



                            <tr>
                                <td align="right">
                                    商品付费类型：
                                </td>
                                <td>
                                    <input name="GOODPAYTYPE" value='0' type="text"
                                           class="normal_input" size="60" maxlength="60" tabIndex='1'>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    商品编码：
                                </td>
                                <td>
                                    <input name="GOODSCODE" value='' type="text"
                                           class="normal_input" size="60" maxlength="60" tabIndex='1'>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    商品名称：
                                </td>
                                <td>
                                    <input name="GOODSNAME"  value='' type="text"
                                           class="normal_input" size="60" maxlength="60" tabIndex='1'>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    商品数量：
                                </td>
                                <td>
                                    <input name="GOODSNUM"  type="text"
                                           class="normal_input" size="60" maxlength="60" tabIndex='1'>
                                </td>
                            </tr>
					<tr>
								<td colspan="2" align="center" height="30">
									<input name='paymentSumbit' type="button"
										onClick="return doSubmit()" value=" 提交 " class="normal_input"
										tabIndex='4'>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value=" 重置 " class="normal_input"
										tabIndex='5'>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
