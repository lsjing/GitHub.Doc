<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paytest2.aspx.cs" Inherits="paytest2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
    
  string MERCHANTID = Request.Params["MERCHANTID"];
  string SUBMERCHANTID = Request.Params["SUBMERCHANTID"];
  string ORDERSEQ = Request.Params["ORDERSEQ"];
  string ORDERREQTRANSEQ = Request.Params["ORDERREQTRANSEQ"];
  string ORDERDATE = Request.Params["ORDERDATE"];
  string ORDERAMOUNT = Request.Params["ORDERAMOUNT"];
  string PRODUCTAMOUNT = Request.Params["PRODUCTAMOUNT"];
  string ATTACHAMOUNT = Request.Params["ATTACHAMOUNT"];
  string CURTYPE = Request.Params["CURTYPE"];
  string ENCODETYPE = Request.Params["ENCODETYPE"];
  string MERCHANTURL = Request.Params["MERCHANTURL"];
  string BACKMERCHANTURL = Request.Params["BACKMERCHANTURL"];
  string ATTACH = Request.Params["ATTACH"];
  string BUSICODE = Request.Params["BUSICODE"];
  string PRODUCTID = Request.Params["PRODUCTID"];
  string TMNUM = Request.Params["TMNUM"];
  string CUSTOMERID = Request.Params["CUSTOMERID"];
  string PRODUCTDESC = Request.Params["PRODUCTDESC"];
  string DIVDETAILS = Request.Params["DIVDETAILS"];
  string PEDCNT = Request.Params["PEDCNT"];
  string GMTOVERTIME = Request.Params["GMTOVERTIME"];
  string CLIENTIP = Request.Params["CLIENTIP"];
  string GOODPAYTYPE = Request.Params["GOODPAYTYPE"];	        // 商品付费类型
  string GOODSCODE = Request.Params["GOODSCODE"];	            // 商品编码
  string GOODSNAME = Request.Params["GOODSNAME"];	            // 商品名称
  string GOODSNUM = Request.Params["GOODSNUM"];	                // 商品数量

  //商户key
 string key = "DDE02033450D4888";  
 string sourceStr =
               "MERCHANTID=" + MERCHANTID +
               "&ORDERSEQ=" + ORDERSEQ +
               "&ORDERDATE=" + ORDERDATE +
               "&ORDERAMOUNT=" + ORDERAMOUNT;

 sourceStr += "&CLIENTIP=" + CLIENTIP + "&KEY=" + key;
  string mac = CryptTool.getMd5Hash(sourceStr).ToUpper();
    %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="css/s_css.css" rel="stylesheet" type="text/css">
		<title>新奥科技---支付请求</title>
		<div id="sending"
			style="position:absolute; top:300; left:120; z-index:10; visibility:hidden;">
			<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
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
        <script type="text/javascript">
            function doSubmit() {
                ;
                sending.style.visibility = "visible";
                cardform.action = "https://webpaywg.bestpay.com.cn/payWeb.action";
                cardform.submit();
                cardform.paymentSumbit.disabled = true;
            }
            $(document).keydown(function (event) {
                var curKey = event.which;
                if (curKey == 13) {
                    doSubmit();
                }
            });

    </script>
	</head>

	<body style="BACKGROUND-COLOR: transparent" >

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
								<td colspan="2" height="1" background="../pic/s_line.gif"></td>
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
									<input name="MERCHANTID" type="text" readonly value ="<%=MERCHANTID %>"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									商户子商户号：
								</td>
								<td>
									<input name="SUBMERCHANTID" readonly value ="<%=SUBMERCHANTID %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单号<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ORDERSEQ"  readonly value ="<%=ORDERSEQ %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单请求交易流水号<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ORDERREQTRANSEQ"  readonly value ="<%=ORDERREQTRANSEQ %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单日期<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ORDERDATE"  readonly value ="<%=ORDERDATE %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									订单总金额(分)<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ORDERAMOUNT"  readonly value ="<%=ORDERAMOUNT %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									产品金额(分)<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="PRODUCTAMOUNT"  readonly value ="<%=PRODUCTAMOUNT %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									附加金额(分)<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ATTACHAMOUNT"  readonly value ="<%=ATTACHAMOUNT %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									币种<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="CURTYPE"  readonly value ="<%=CURTYPE %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									加密方式<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="ENCODETYPE"  readonly value ="<%=ENCODETYPE %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									交易返回的url地址<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="MERCHANTURL"
										 readonly value ="<%=MERCHANTURL %>"
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
										 readonly value ="<%=BACKMERCHANTURL %>"
										type="text" class="normal_input" size="60" maxlength="60"
										tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									商家附加信息：
								</td>
								<td>
									<input name="ATTACH"  readonly value ="<%=ATTACH %>" type="text"
									
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									业务类型<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="BUSICODE"  readonly value ="<%=BUSICODE %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									终端号码：
								</td>
								<td>
									<input name="TMNUM"  readonly value ="<%=TMNUM %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									客户标识<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="CUSTOMERID"  readonly value ="<%=CUSTOMERID %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									产品标识：
								</td>
								<td>
									<input name="PRODUCTID"  readonly value ="<%=PRODUCTID %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									产品描述：
								</td>
								<td> 
									<input name="PRODUCTDESC"  readonly value ="<%=PRODUCTDESC %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>

								<tr>
								<td align="right">
									CLIENTIP<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="CLIENTIP"  readonly value ="<%=CLIENTIP %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									分期数：
								</td>
								<td>
									<input name="PEDCNT"  readonly value ="<%=PEDCNT %>" type="text"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									交易关闭时间：
								</td>
								<td>
									<input name="GMTOVERTIME"  readonly value ="<%=GMTOVERTIME %>" type="text"
										class="normal_input" size="60" maxlength="19" tabIndex='1'>
								</td>
							</tr>
							<tr>
								<td align="right">
									MAC<span style="color:Red;">*</span>：
								</td>
								<td>
									<input name="MAC"  readonly type="text" value ="<%=mac %>"
										class="normal_input" size="60" maxlength="60" tabIndex='1'>
								</td>
							</tr>

							<tr>
								<td align="right">
									分账明细：
								</td>
								<td>
									<input name="DIVDETAILS" value='<%=DIVDETAILS %>' type="text"
										class="normal_input" size="60" maxlength="19" tabIndex='1'>
								</td>
							</tr>

                           <tr>
                                <td align="right">
                                    商品付费类型：
                                </td>
                                <td>
                                    <input name="GOODPAYTYPE" value='<%=GOODPAYTYPE %>' type="text"
                                           class="normal_input" size="60" maxlength="60" tabIndex='1'>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    商品编码：
                                </td>
                                <td>
                                    <input name="GOODSCODE" value='<%=GOODSCODE %>' type="text"
                                           class="normal_input" size="60" maxlength="60" tabIndex='1'>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    商品名称：
                                </td>
                                <td>
                                    <input name="GOODSNAME" value='<%=GOODSNAME %>' type="text"
                                           class="normal_input" size="60" maxlength="60" tabIndex='1'>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    商品数量：
                                </td>
                                <td>
                                    <input name="GOODSNUM" value='<%=GOODSNUM %>' type="text"
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
