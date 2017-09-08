<?php
/**
 * Created by PhpStorm.
 * User: chuanchuan
 * Date: 2015/3/23
 * Time: 17:19
 */
//联合登陆http请求
function http_send($url,$post=''){

    //$post=trim($post);
    $curl = curl_init();
    curl_setopt($curl,CURLOPT_URL,$url);
    curl_setopt($curl, CURLOPT_PORT, 443);
    curl_setopt($curl, CURLOPT_SSLVERSION, 3);

    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); //信任任何证书
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0); // 检查证书中是否设置域名,0不验证
    curl_setopt($curl, CURLOPT_VERBOSE, 1); //debug模式
    curl_setopt($curl, CURLOPT_SSLCERT,'sandoauth.crt'); //client.crt文件路径
    curl_setopt($curl, CURLOPT_SSLCERTPASSWD, "sand123"); //client证书密码
    curl_setopt($curl, CURLOPT_SSLKEY, 'sandoauth.key'); //key文件路径
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_POST, 1);
    if(!empty($post)){
        curl_setopt($curl, CURLOPT_POSTFIELDS, $post);
    }
    $ret = curl_exec($curl);
    var_dump($ret);
    print_r(curl_error($curl)); die; //查看报错信息
    curl_close($curl);

    //$ss=file_get_contents($ret);
    $res=json_decode($ret);
    //$res=objtoarr($res);

    return $res;
}

$post_str = 'grant_type=authorization_code&code=b0e359e6e2cc85d204c7df6d327e1e&client_id=666002133331004&client_secret=c8efbb1dd690062ee6e6e527be5bf107&redirect_uri=http%3A%2F%2Fchihuotest.chihuoyizu.cn';
//$post_data1 = explode('&',$post_str);
//$post_data = array();
//foreach($post_data1 as $data){
//    $item = explode('=',$data);
//    $key = $item[0];
//    $value = $item[1];
//    $post_data[$key] = $value;
//}

//echo '<pre>';
//var_dump($post_data);exit;

http_send('https://sandlife.pay.com.cn/Oauth/token',$post_str);