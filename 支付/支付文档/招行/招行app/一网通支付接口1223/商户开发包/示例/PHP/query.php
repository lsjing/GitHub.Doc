<html>
<head><title>ʾ������¼������ѯ����</title></head>
<body>
��¼�����
<?php
require_once("Java.inc");
java_set_file_encoding("GB2312");
$o = new java('cmb.netpayment.Settle');
$o->SetOptions("payment.ebank.cmbchina.com");
$r = $o->LoginC("0755","000123","111111");
if ($r == "0") { echo '��¼�ɹ�'; } else { echo "��¼ʧ��"; }
?>
<br>
��ѯ�����
<?php
$buf = new java('java.lang.StringBuffer');
$r = $o->QuerySettledOrderByPage("20150101","20151010",10,$buf);
if ($r == "0") {
  echo "��ѯ�ɹ�, ���ض������ݣ�<br><pre>$buf</pre>";
} else
{ echo "��ѯʧ��"; }
$o->Logout();
?>
</body>
</html>
