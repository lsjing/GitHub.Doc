
<?php

function get_data_from_server($address, $service_port, $send_data) {
	$socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
	if ($socket < 0) {
		echo "socket创建失败原因: " . socket_strerror($socket) . "\n";
	} else {
		echo "socket_create OK，HE HE.\n";
	}	
	$result = socket_connect($socket, $address, $service_port);
	if ($result < 0) {
		echo "SOCKET连接失败原因: ($result) " . socket_strerror($result) . "\n";
	} else {
		echo "OK.\n";
	}	
	//发送命令
	$in = $send_data;
	$out = '';
	echo "Send ..........";
	socket_write($socket, $in, strlen($in));
	echo "OK.\n";
	echo "Reading Backinformatin:\n\n";
	while ($out = socket_read($socket, 2048)) {
		echo $out;
	}
	echo "Close socket........";
	socket_close($socket);
	echo "OK,He He.\n\n";
	return $out;
}

echo "aaaaaa";

echo get_data_from_server("127.0.0.1",55533,"POSID=100001329&BRANCHID=500000000&ORDERID=GWA10081217305965959&PAYMENT=0.01&CURCODE=01&REMARK1=&REMARK2=&SUCCESS=Y&TYPE=1&REFERER=http://114.255.7.208/page/bankpay.do&CLIENTIP=114.255.7.194&SIGN=9a7efc7f15f4b0e7f8fba52649d6b97ae33fad44598a7ca1c26196e8ddba00ecf91a596346e4bfd3cc6d2bdba6c085a3cdb0f231d865d7856e37de89846a371c8bc09f8f2643284260499e1d3f464d9ca9d379fe8af3202a09fc83d39f5c68501a4627d62a3ae891d4b0ff6aa21d61f6ba0e9c8bc5840b292af853d2736ce04a\n");

?>