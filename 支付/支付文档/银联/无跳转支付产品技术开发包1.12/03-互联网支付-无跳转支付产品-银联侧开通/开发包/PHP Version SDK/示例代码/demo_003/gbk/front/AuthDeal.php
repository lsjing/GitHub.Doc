<?php
header ( 'Content-type:text/html;charset=GBK' );
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/common.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/SDKConfig.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/secureUtil.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/encryptParams.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/httpClient.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/log.class.php';

/**
 * Ԥ��Ȩ����
 */

// ��ʼ����־
$log = new PhpLog ( SDK_LOG_FILE_PATH, "PRC", SDK_LOG_LEVEL );
$log->LogInfo ( "===========�����̨����ʼ============" );

$params = array(
		//�̶���д
		'version'=> '5.0.0',//�汾��--M
		//Ĭ��ȡֵ��UTF-8
		'encoding'=> 'GBK',//���뷽ʽ--M
		//ͨ��MPI�����ȡ
		'certId'=> getSignCertId (),//֤��ID--M
		//ȡֵ��01����ʾ����RSA��
		'signMethod'=> '01',//ǩ������--M
		//ȡֵ��02
		'txnType'=> '02',//��������--M
		//01��Ԥ��Ȩ02������Ԥ��Ȩ03����������ͨ����ַ����ǰ̨���̨����
		'txnSubType'=> '00',//��������--M
		'bizType'=> '000801',//��Ʒ����--M
		'channelType'=> '07',//��������--M
		//��̨�����̻����ʱʹ�ã������ͣ������̻���̨���׽��֪ͨ
		'backUrl'=> SDK_BACK_TRANS_URL,//��̨֪ͨ��ַ--M
		//0����ͨ�̻�ֱ������1���յ���������2��ƽ̨���̻�����
		'accessType'=> '1',//��������--M
		//��������Ϊ�յ���������ʱ������
		'acqInsCode'=> '00010000',//�յ���������--C
		//��������Ϊ�յ���������ʱ������
		'merCatCode'=> '7011',//�̻����--C
		//��
		'merId'=> '802290049000180',//�̻�����--M
		//��������Ϊ�յ���������ʱ������
		'merName'=> '�����յ���������̻�',//�̻�����--C
		//��������Ϊ�յ���������ʱ������
		'merAbbr'=> '�����̻�',//�̻����--C
		//�̻�����Ϊƽ̨���̻�����ʱ��������
		//'subMerId'=> '',//�����̻�����--C
		//�̻�����Ϊƽ̨���̻�����ʱ��������
		//'subMerName'=> '',//�����̻�ȫ��--C
		//�̻�����Ϊƽ̨���̻�����ʱ��������
		//'subMerAbbr'=> '',//�����̻����--C
		//Ԥ��Ȩ�����Ķ����ţ����̻�����
		'orderId'=> date('YmdHis'),//�̻�������--M
		//��
		'txnTime'=> date('YmdHis'),//��������ʱ��--M
		//��ԭʼԤ��Ȩ����һ��
		'txnAmt'=> '1',//���׽��--M
		//��
		//'termId'=> '',//�ն˺�--O
		//�̻��Զ��屣���򣬽���Ӧ��ʱ��ԭ������
		//'reqReserved'=> '',//���󷽱�����--O
		//��ʽ���£�{������1=ֵ&������2=ֵ&������3=ֵ} �ƶ�֧���ο�����
		//'reserved'=> '',//������--O
		//��������Ϊ����֧��ʱʹ���÷���VPC������Ϣ����������÷�
		//'vpcTransData'=> '',//VPC������Ϣ��--C
		
	);

// ����ֶ��Ƿ���Ҫ����
encrypt_params ( $params );

// ǩ��
sign ( $params );


// ǰ̨�����ַ
$front_uri = SDK_FRONT_TRANS_URL;
$log->LogInfo ( "ǰ̨�����ַΪ>" . $front_uri );
// ���� �Զ��ύ�ı�
$html_form = create_html ( $params, $front_uri );

$log->LogInfo ( "-------ǰ̨�����Զ��ύ��>--begin----" );
$log->LogInfo ( $html_form );
$log->LogInfo ( "-------ǰ̨�����Զ��ύ��>--end-------" );
$log->LogInfo ( "============����ǰ̨���� ����===========" );
echo $html_form;
?>
