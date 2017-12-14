<?php 
header ( 'Content-type:text/html;charset=GBK' );
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/common.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/SDKConfig.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/secureUtil.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/encryptParams.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/httpClient.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/log.class.php';

/**
 * ����ȫ������ͨ����
 */

$params = array(
	'������'=> '������',//����--����Ҫ��
	//�̶���д
	'version'=> '5.0.0',//�汾��--M
	//Ĭ��ȡֵ��UTF-8
	'encoding'=> 'GBK',//���뷽ʽ--M
	//ͨ��MPI�����ȡ
	'certId'=> getSignCertId (),//֤��ID--M
	//01RSA02 MD5 (�ݲ�֧��)
	'signMethod'=> '01',//ǩ������--M
	//ȡֵ:79
	'txnType'=> 'txnType',//��������--M
	//00����Ĭ�Ͽ�ͨ01����������ͨ(��̨)02�������ܿ�ͨ��ǰ̨��ת��
	'txnSubType'=> '00',//��������--M
	'bizType'=> '000000',//��Ʒ����--M
	//0����ͨ�̻�ֱ������1���յ���������2��ƽ̨���̻�����
	'accessType'=> '0',//��������--M
	'channelType'=> '07',//��������--M
	//��̨�����̻����ʱʹ�ã������ͣ������̻���̨���׽��֪ͨ
	'backUrl'=> SDK_BACK_TRANS_URL,//��̨֪ͨ��ַ--O
	//��������Ϊ�յ���������ʱ������
	//'acqInsCode'=> 'acqInsCode',//�յ���������--C
	//��������Ϊ�̻�����ʱ������
	'merId'=> '898340183980105',//�̻�����--C
	//��������Ϊ�յ���������ʱ������
	//'merCatCode'=> 'merCatCode',//�̻����--C
	//��������Ϊ�յ���������ʱ������
	//'merName'=> 'merName',//�̻�����--C
	//��������Ϊ�յ���������ʱ������
	//'merAbbr'=> 'merAbbr',//�̻����--C
	//�̻�������
	'orderId'=> date('YmdHis'),//�̻�������--M
	//�̻����ͽ���ʱ��
	'txnTime'=> date('YmdHis'),//��������ʱ��--M
	//��
	//'accType'=> 'accType',//�ʺ�����--O
	//����̨����ʱ���ͣ�ǰ̨����ʱѡ��
	//'accNo'=> '',//�ʺ�--C
	//�̻��Զ��屣���򣬽���Ӧ��ʱ��ԭ������
	//'reqReserved'=> '',//���󷽱�����--O
	//��ʽ���£�{������1=ֵ&������2=ֵ&������3=ֵ} �ƶ�֧���ο�����
	//'reserved'=> '',//������--O
	//����ʱ������Ǻ�̨��ͨ����ǿ��ֻ��ű��֤�����ͣ�֤�����뼰����ѡ����ǿ������ͣ��ֻ��ţ���Ч�ڣ�CVN2���֤�����ͣ�֤���ţ�����ѡ���̨��ͨʱ����д�û��Ķ�����֤��������Ӧ��ʱ�������̻����ÿɷ��أ��ֻ��š����ǿ���Ч��
	'customerInfo'=>customerInfo() ,
	//��ʹ��������Կ�����������Ϣʱ�������ͼ���֤���CertID
	//'encryptCertId'=> 'encryptCertId',//����֤��ID--C
	//��������Ϊ����֧��ʱʹ���÷���VPC������Ϣ����������÷�
	//'vpcTransData'=> '',//VPC������Ϣ��--C
	);

	// ����ֶ��Ƿ���Ҫ����
	encrypt_params ( $params );
	
	// ǩ��
	sign ( $params );
		
	$log->LogInfo ( "��̨�����ַΪ>" . SDK_BACK_TRANS_URL );
	// ������Ϣ����̨
	$result = sendHttpRequest ( $params, SDK_BACK_TRANS_URL );
	$log->LogInfo ( "��̨���ؽ��Ϊ>" . $result );
	
	//���ؽ��չʾ
	$result_arr = coverStringToArray ( $result );
	$html = create_html ( $result_arr, SDK_BACK_NOTIFY_URL );
	echo $html;


?>