<html>
  <head>
    <title>��ֹ���ÿ�֧��������</title>
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
fld("���кţ�","branchid",$br);
fld("�̻��ţ�","cono",$co);
fld("���ڣ�","date",$d);
fld("�����ţ�","billno",$bill);
fld("��","amount",$amount);
fld("�̻��Զ��������","MerchantPara",$para);
fld("����URL��������ͨ�������ܹ����ʣ����ܴ��ж˿ں�<br>","MerchantURL",$mchurl);
$MerchantCode=java('cmb.MerchantCode');
$cd = $MerchantCode->genMerchantCode("AaBbCc1234567890",$d,$br,$co,$bill,$amount,$para,$mchurl,"User1","User2","202.97.113.23","54010306","");
fld("���ɵ�У���룺","MerchantCode",java_values($cd));
?>

      <input type="submit" value="֧��"><br>
    </form>
  </body>
</html>