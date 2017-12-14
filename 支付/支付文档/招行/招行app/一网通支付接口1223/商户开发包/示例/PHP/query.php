<html>
<head><title>示例：登录，并查询定单</title></head>
<body>
登录结果：
<?php
require_once("Java.inc");
java_set_file_encoding("GB2312");
$o = new java('cmb.netpayment.Settle');
$o->SetOptions("payment.ebank.cmbchina.com");
$r = $o->LoginC("0755","000123","111111");
if ($r == "0") { echo '登录成功'; } else { echo "登录失败"; }
?>
<br>
查询结果：
<?php
$buf = new java('java.lang.StringBuffer');
$r = $o->QuerySettledOrderByPage("20150101","20151010",10,$buf);
if ($r == "0") {
  echo "查询成功, 返回定单数据：<br><pre>$buf</pre>";
} else
{ echo "查询失败"; }
$o->Logout();
?>
</body>
</html>
