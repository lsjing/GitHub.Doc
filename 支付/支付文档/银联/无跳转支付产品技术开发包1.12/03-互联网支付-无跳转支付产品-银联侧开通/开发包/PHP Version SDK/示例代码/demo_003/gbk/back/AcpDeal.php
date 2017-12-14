<?php 
header ( 'Content-type:text/html;charset=GBK' );
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/common.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/SDKConfig.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/secureUtil.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/encryptParams.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/httpClient.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/log.class.php';

/**
 * 银联全渠道开通交易
 */

$params = array(
	'变量名'=> '变量名',//域名--出现要求
	//固定填写
	'version'=> '5.0.0',//版本号--M
	//默认取值：UTF-8
	'encoding'=> 'GBK',//编码方式--M
	//通过MPI插件获取
	'certId'=> getSignCertId (),//证书ID--M
	//01RSA02 MD5 (暂不支持)
	'signMethod'=> '01',//签名方法--M
	//取值:79
	'txnType'=> 'txnType',//交易类型--M
	//00——默认开通01——评级开通(后台)02——验密开通（前台跳转）
	'txnSubType'=> '00',//交易子类--M
	'bizType'=> '000000',//产品类型--M
	//0：普通商户直连接入1：收单机构接入2：平台类商户接入
	'accessType'=> '0',//接入类型--M
	'channelType'=> '07',//渠道类型--M
	//后台返回商户结果时使用，如上送，则发送商户后台交易结果通知
	'backUrl'=> SDK_BACK_TRANS_URL,//后台通知地址--O
	//接入类型为收单机构接入时需上送
	//'acqInsCode'=> 'acqInsCode',//收单机构代码--C
	//接入类型为商户接入时需上送
	'merId'=> '898340183980105',//商户代码--C
	//接入类型为收单机构接入时需上送
	//'merCatCode'=> 'merCatCode',//商户类别--C
	//接入类型为收单机构接入时需上送
	//'merName'=> 'merName',//商户名称--C
	//接入类型为收单机构接入时需上送
	//'merAbbr'=> 'merAbbr',//商户简称--C
	//商户端生成
	'orderId'=> date('YmdHis'),//商户订单号--M
	//商户发送交易时间
	'txnTime'=> date('YmdHis'),//订单发送时间--M
	//　
	//'accType'=> 'accType',//帐号类型--O
	//　后台交易时必送，前台交易时选送
	//'accNo'=> '',//帐号--C
	//商户自定义保留域，交易应答时会原样返回
	//'reqReserved'=> '',//请求方保留域--O
	//格式如下：{子域名1=值&子域名2=值&子域名3=值} 移动支付参考消费
	//'reserved'=> '',//保留域--O
	//请求时：如果是后台开通，借记卡手机号必填，证件类型，证件号码及姓名选填；贷记卡需上送：手机号，有效期，CVN2必填，证件类型，证件号，姓名选填；后台开通时需填写用户的短信验证码至该域；应答时：根据商户配置可返回：手机号、贷记卡有效期
	'customerInfo'=>customerInfo() ,
	//当使用银联公钥加密密码等信息时，需上送加密证书的CertID
	//'encryptCertId'=> 'encryptCertId',//加密证书ID--C
	//渠道类型为语音支付时使用用法见VPC交易信息组合域子域用法
	//'vpcTransData'=> '',//VPC交易信息域--C
	);

	// 检查字段是否需要加密
	encrypt_params ( $params );
	
	// 签名
	sign ( $params );
		
	$log->LogInfo ( "后台请求地址为>" . SDK_BACK_TRANS_URL );
	// 发送信息到后台
	$result = sendHttpRequest ( $params, SDK_BACK_TRANS_URL );
	$log->LogInfo ( "后台返回结果为>" . $result );
	
	//返回结果展示
	$result_arr = coverStringToArray ( $result );
	$html = create_html ( $result_arr, SDK_BACK_NOTIFY_URL );
	echo $html;


?>