<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payPgnotify.aspx.cs" Inherits="payPgnotify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
    string UPTRANSEQ = Request.Params["UPTRANSEQ"];
    string TRANDATE = Request.Params["TRANDATE"];
    string RETNCODE = Request.Params["RETNCODE"];
    string RETNINFO = Request.Params["RETNINFO"];
    if (RETNCODE != null && "0000".Equals(RETNCODE))
    {
        RETNINFO = "支付成功";
    }
  
    string ORDERREQTRANSEQ = Request.Params["ORDERREQTRANSEQ"];
    string ORDERSEQ = Request.Params["ORDERSEQ"];
    string ORDERAMOUNT = Request.Params["ORDERAMOUNT"];
    string PRODUCTAMOUNT = Request.Params["PRODUCTAMOUNT"];
    string ATTACHAMOUNT = Request.Params["ATTACHAMOUNT"];
    string CURTYPE = Request.Params["CURTYPE"];
    string ENCODETYPE = Request.Params["ENCODETYPE"];
    string BANKID = Request.Params["BANKID"];
    string ATTACH = Request.Params["ATTACH"];
    string UPREQTRANSEQ = Request.Params["UPREQTRANSEQ"];
    string UPBANKTRANSEQ = Request.Params["UPBANKTRANSEQ"];
    string PRODUCTNO = Request.Params["PRODUCTNO"];
    string SIGN = Request.Params["SIGN"];

     %>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <title>新奥科技---商户接收 结果通知</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
  </head>
  <body>
    <div id="HEADA"> </div>
    <div id="MAINA">
      <div class="mindexa">
        
        <div class="mright">
          <h3>新奥科技---商户结果通知(平台请求商户数据)<span>(带<span style="color:Red;">*</span>项为必填)</span></h3>
          <div class="mrmain">
		  
             <table style="border:3px solid #9ED5FF; border-spacing:0px;" colspan="0" rowspan="0"   >
            
                <tr>
                  <th nowrap="nowrap" style="width:250px;text-align:right;border:1px solid #9ED5FF; line-height:28px;" >翼支付网关平台交易流水号【UPTRANSEQ】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="width:250px;text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=UPTRANSEQ%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;" >翼支付网关平台交易日期【TRANDATE】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=TRANDATE%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">处理结果码【RETNCODE】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=RETNCODE%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap"  style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">处理结果解释码【RETNINFO】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=RETNINFO%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">订单请求交易流水号【ORDERREQTRANSEQ】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=ORDERREQTRANSEQ%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">订单号【ORDERSEQ】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=ORDERSEQ%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">订单总金额【ORDERAMOUNT】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=ORDERAMOUNT%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap"  style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">产品金额【PRODUCTAMOUNT】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=PRODUCTAMOUNT%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">附加金额【ATTACHAMOUNT】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=ATTACHAMOUNT%></td>
                </tr>
				<tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">币种【CURTYPE】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=CURTYPE%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">加密方式【ENCODETYPE】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=ENCODETYPE%></td>
                </tr>
				<tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">银行编码【BANKID】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=BANKID%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">商户附加信息【ATTACH】：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=ATTACH%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">网关平台请求银行流水号【UPREQTRANSEQ】：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=UPREQTRANSEQ%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">银行流水号【UPBANKTRANSEQ】：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=UPBANKTRANSEQ%></td>
                </tr>
                 <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;">产品号码【PRODUCTNO】：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=PRODUCTNO%></td>
                </tr>
                <tr>
                  <th nowrap="nowrap" style="text-align:right;border:1px solid #9ED5FF; line-height:28px;" >签名密文【SIGN】<span style="color:Red;">*</span>：</th>
                  <td nowrap="nowrap" style="text-align:left;border:1px solid #9ED5FF; line-height:28px;"><%=SIGN%></td>
                </tr>
                
            </table>

          </div>
        </div>
      </div>
    </div>
    <div id="FOOTA">  </div>
  </body>
</html>
<script type="text/javascript">
    document.getElementById("paymentnotify").className = "msel";
</script>
