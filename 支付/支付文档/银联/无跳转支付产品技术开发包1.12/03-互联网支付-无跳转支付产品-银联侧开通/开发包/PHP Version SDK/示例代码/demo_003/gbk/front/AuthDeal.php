<?php
header ( 'Content-type:text/html;charset=GBK' );
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/common.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/SDKConfig.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/secureUtil.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/encryptParams.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/httpClient.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/log.class.php';

/**
 * 预授权交易
 */

// 初始化日志
$log = new PhpLog ( SDK_LOG_FILE_PATH, "PRC", SDK_LOG_LEVEL );
$log->LogInfo ( "===========处理后台请求开始============" );

$params = array(
		//固定填写
		'version'=> '5.0.0',//版本号--M
		//默认取值：UTF-8
		'encoding'=> 'GBK',//编码方式--M
		//通过MPI插件获取
		'certId'=> getSignCertId (),//证书ID--M
		//取值：01（表示采用RSA）
		'signMethod'=> '01',//签名方法--M
		//取值：02
		'txnType'=> '02',//交易类型--M
		//01：预授权02：订购预授权03：担保消费通过地址区分前台与后台交易
		'txnSubType'=> '00',//交易子类--M
		'bizType'=> '000801',//产品类型--M
		'channelType'=> '07',//渠道类型--M
		//后台返回商户结果时使用，如上送，则发送商户后台交易结果通知
		'backUrl'=> SDK_BACK_TRANS_URL,//后台通知地址--M
		//0：普通商户直连接入1：收单机构接入2：平台类商户接入
		'accessType'=> '1',//接入类型--M
		//接入类型为收单机构接入时需上送
		'acqInsCode'=> '00010000',//收单机构代码--C
		//接入类型为收单机构接入时需上送
		'merCatCode'=> '7011',//商户类别--C
		//　
		'merId'=> '802290049000180',//商户代码--M
		//接入类型为收单机构接入时需上送
		'merName'=> '银联收单接入测试商户',//商户名称--C
		//接入类型为收单机构接入时需上送
		'merAbbr'=> '测试商户',//商户简称--C
		//商户类型为平台类商户接入时必须上送
		//'subMerId'=> '',//二级商户代码--C
		//商户类型为平台类商户接入时必须上送
		//'subMerName'=> '',//二级商户全称--C
		//商户类型为平台类商户接入时必须上送
		//'subMerAbbr'=> '',//二级商户简称--C
		//预授权撤销的订单号，由商户生成
		'orderId'=> date('YmdHis'),//商户订单号--M
		//　
		'txnTime'=> date('YmdHis'),//订单发送时间--M
		//与原始预授权交易一致
		'txnAmt'=> '1',//交易金额--M
		//　
		//'termId'=> '',//终端号--O
		//商户自定义保留域，交易应答时会原样返回
		//'reqReserved'=> '',//请求方保留域--O
		//格式如下：{子域名1=值&子域名2=值&子域名3=值} 移动支付参考消费
		//'reserved'=> '',//保留域--O
		//渠道类型为语音支付时使用用法见VPC交易信息组合域子域用法
		//'vpcTransData'=> '',//VPC交易信息域--C
		
	);

// 检查字段是否需要加密
encrypt_params ( $params );

// 签名
sign ( $params );


// 前台请求地址
$front_uri = SDK_FRONT_TRANS_URL;
$log->LogInfo ( "前台请求地址为>" . $front_uri );
// 构造 自动提交的表单
$html_form = create_html ( $params, $front_uri );

$log->LogInfo ( "-------前台交易自动提交表单>--begin----" );
$log->LogInfo ( $html_form );
$log->LogInfo ( "-------前台交易自动提交表单>--end-------" );
$log->LogInfo ( "============处理前台请求 结束===========" );
echo $html_form;
?>
