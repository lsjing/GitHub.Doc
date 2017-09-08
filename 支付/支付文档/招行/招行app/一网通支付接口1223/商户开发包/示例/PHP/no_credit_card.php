<html>
  <head>
    <title>禁止信用卡支付的例子</title>
  </head>
  <body>
    <form id="fm" action="https://netpay.cmbchina.com/netpayment/basehttp.dll?prepayc2" method="post" target="_blank">

<?php
require_once("Java.inc");

$d = date("Ymd",time());
$br = "0755";
$co = "000354";
$bill = "000001";
$amount="1.00";
$para="abc";
$mchurl="http://www.abc.com/resp.php";

function fld($lb,$nm,$val) {
  echo $lb . "<input type='text' name='" . $nm . "' value='" . $val . "'><br>";
}
fld("分行号：","branchid",$br);
fld("商户号：","cono",$co);
fld("日期：","date",$d);
fld("定单号：","billno",$bill);
fld("金额：","amount",$amount);
fld("商户自定义参数：","MerchantPara",$para);
fld("返回URL，必须能通过公网能够访问，不能带有端口号<br>","MerchantURL",$mchurl);
$MerchantCode=java('cmb.MerchantCode');
$cd = $MerchantCode->genMerchantCode("AaBbCc1234567890",$d,$br,$co,$bill,$amount,$para,$mchurl,"User1","User2","202.97.113.23","54010306","");
fld("生成的校验码：","MerchantCode",java_values($cd));
?>

      <input type="submit" value="支付"><br>
    </form>
  </body>
</html>