<?php
require_once("Java.inc");
java_set_file_encoding("GB2312");
$Security=new java('cmb.netpayment.Security','F:\phpStudy\public.key');
$res = $Security->checkInfoFromBank("Succeed=Y&BillNo=000000&Amount=12.00&Date=20001221&Msg=���������ѱ����н���.&Signature=9|96|42|124|72|152|158|163|254|181|233|185|138|15|6|89|43|167|41|171|28|218|209|216|211|47|169|5|243|235|2|225|189|233|84|130|206|204|49|236|196|127|109|65|193|110|229|29|107|135|174|44|185|109|250|70|163|225|137|18|84|205|236|82|");//����ǩ��
if (java_values($res)) { echo "ǩ������ȷ��"; } else { echo "ǩ������"; }
?>
