<?php

	$url=$_REQUEST['returnUrl'];
	if($url=='')
	{
		$url='http://www.meiribuy.com';
	}
	$code=$_REQUEST['code'];
	$vendor='SANDLIFE';
	if(substr($url,0,7)!="http://")
	{
		$url="http://".$url;
	}
	$userName='';
	$url1=urlencode($url);
	$url11=$url;
	$authorization_code=$code;
	$a='https://www.sandlife.com.cn/oauth/token?grant_type=authorization_code&code='.$authorization_code.'&client_id=666002159770032&client_secret=8680fb2804fc4d9d9e9a3c49eafe8fcd&redirect_uri='.$url1;
	//$get1= file_get_contents($a);
	//echo $code;
	$url='https://www.sandlife.com.cn/Oauth/token';
	$post='grant_type=authorization_code&code='.$authorization_code.'&client_id=666002159770032&client_secret=8680fb2804fc4d9d9e9a3c49eafe8fcd&redirect_uri='.$url1;
	//echo $post;
	$post=trim($post);
	$curl = curl_init();
	curl_setopt($curl,CURLOPT_URL,$url);
	curl_setopt($curl, CURLOPT_PORT, 443);
	curl_setopt($curl, CURLOPT_SSLVERSION, 3);
	
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); //信任任何证书
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0); // 检查证书中是否设置域名,0不验证
	curl_setopt($curl, CURLOPT_VERBOSE, 1); //debug模式
	curl_setopt($curl, CURLOPT_SSLCERT, "E:\\htdocs\\xxxxxx.crt"); //client.crt文件路径
	curl_setopt($curl, CURLOPT_SSLCERTPASSWD, "sand123"); //client证书密码
	curl_setopt($curl, CURLOPT_SSLKEY, "E:\\htdocs\\xxxxx.key"); //key文件路径
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($curl, CURLOPT_POST, 1);
	curl_setopt($curl, CURLOPT_POSTFIELDS, $post);
			
	$ret = curl_exec($curl);  
  //  var_dump(curl_error($curl));  //查看报错信息  
  
    curl_close($curl);
	//echo '111'.json_decode($ret);
	
	
		//$ss=file_get_contents($ret);
		$res=json_decode($ret);
		$res=objtoarr($res);
		//echo $res['access_token'];
		//parse_str($ret);
		//echo $access_token;
		
	$b='https://www.sandlife.com.cn/Oauth/user';
	
	$post='access_token='.$res['access_token'];
	
	$curl = curl_init();
	curl_setopt($curl,CURLOPT_URL,$b);
	curl_setopt($curl, CURLOPT_PORT, 443);
	curl_setopt($curl, CURLOPT_SSLVERSION, 3);
	
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); //信任任何证书
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0); // 检查证书中是否设置域名,0不验证
	curl_setopt($curl, CURLOPT_VERBOSE, 1); //debug模式
	curl_setopt($curl, CURLOPT_SSLCERT, "E:\\htdocs\\xxxxxx.crt"); //client.crt文件路径
	curl_setopt($curl, CURLOPT_SSLCERTPASSWD, "sand123"); //client证书密码
	curl_setopt($curl, CURLOPT_SSLKEY, "E:\\htdocs\\xxxxx.key"); //key文件路径
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($curl, CURLOPT_POST, 1);
	curl_setopt($curl, CURLOPT_POSTFIELDS, $post);
	$ret = curl_exec($curl); 
	curl_close($curl);
	// var_dump(json_decode($ret));
	 
	 
	$res1=json_decode($ret);
	$res1=objtoarr($res1);
	 //echo $res1['userName'];
	 
	// respResult
	//$get2= file_get_contents($b);
	//parse_str($get2);
	
	if($res1['respResult']=='查询用户详细信息成功'){
		$url=$url11;
		$userName=$res1['userName'];	
		$userID=$res1['userID'];
		$vendor=$res1['vendor'];
		$_SESSION['sdToken'] = $userID; 
		$email = $res1['eMail'];
		$mail = $res1['eMail'];
		$real_name = '';
		$user_grade = '';
		$user_grade_type = '';
		$username = '杉德('.$userID.')';
		//$_SESSION["qq_nick"]  = $nickname;
		$password = md5 ( $username );

		if (check_user ( $username ) !== false) {
			//更新登录态
			echo "<script>location.href='$url'</script>"; //跳转
			exit ();
		} else {
			//注册新用户并更新登录态
			echo "<script>location.href='$url'</script>"; //跳转
			exit ();
		}
	}	
	else
	{
		echo 'error';
	}
		
		
		
		
		

/*
function vpost($url,$data){ // 模拟提交数据函数
    $curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);   // 只信任CA颁布的证书  
	curl_setopt($ch, CURLOPT_CAINFO, 'E:\htdocs\www.meiribuy.com\server.cer'); // CA根证书（用来验证的网站证书是否是CA颁布）  
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2); // 检查证书中是否设置域名，并且是否与提供的主机名匹配 
    curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
    curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
    curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data); // Post提交的数据包
    curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
    curl_setopt($curl, CURLOPT_HEADER, 0); // 显示返回的Header区域内容
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
    $tmpInfo = curl_exec($curl); // 执行操作
    if (curl_errno($curl)) {
       echo 'Errno'.curl_error($curl);//捕抓异常
    }
    curl_close($curl); // 关闭CURL会话
    return $tmpInfo; // 返回数据
}
*/

function curlPost($url, $data = array(), $timeout = 30, $CA = true){    
  
    $cacert = 'E:\htdocs\www.meiribuy.com\Server.pem'; //CA根证书  
    $SSL = substr($url, 0, 8) == "https://" ? true : false;  
      
    $ch = curl_init();  
    curl_setopt($ch, CURLOPT_URL, $url);  
    curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);  
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout-2);  
    if ($SSL && $CA) {  
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);   // 只信任CA颁布的证书  
        curl_setopt($ch, CURLOPT_CAINFO, $cacert); // CA根证书（用来验证的网站证书是否是CA颁布）  
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2); // 检查证书中是否设置域名，并且是否与提供的主机名匹配  
    } else if ($SSL && !$CA) {  
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 信任任何证书  
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 1); // 检查证书中是否设置域名  
    }  
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Expect:')); //避免data数据过长问题  
    curl_setopt($ch, CURLOPT_POST, true);  
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);  
    //curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data)); //data with URLEncode  
  
    $ret = curl_exec($ch);  
    var_dump(curl_error($ch));  //查看报错信息  
  
    curl_close($ch);  
    return $ret;    
}  

function objtoarr($obj){
	$ret = array();
	foreach($obj as $key =>$value){
		if(gettype($value) == 'array' || gettype($value) == 'object'){
			$ret[$key] = objtoarr($value);
		}
		else{
			$ret[$key] = $value;
		}
	}
	return $ret;
}  
?>