<?php 
header ( 'Content-type:text/html;charset=GBK' );
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/common.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/SDKConfig.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/secureUtil.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/encryptParams.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/httpClient.php';
include_once $_SERVER ['DOCUMENT_ROOT'] . '/upacp_sdk_php/gbk/func/log.class.php';

/**
 * �˻�
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
		//ȡֵ��04
		'txnType'=> 'txnType',//��������--M
		//Ĭ�ϣ�00
		'txnSubType'=> '00',//��������--M
		'bizType'=> '000000',//��Ʒ����--M
		'channelType'=> '07',//��������--M
		//��̨�����̻����ʱʹ�ã������ͣ������̻���̨���׽��֪ͨ
		'backUrl'=> SDK_BACK_TRANS_URL,//��̨֪ͨ��ַ--M
		//0����ͨ�̻�ֱ������1���յ���������2��ƽ̨���̻�����
		'accessType'=> '0',//��������--M
		//��������Ϊ�յ���������ʱ������
		//'acqInsCode'=> 'acqInsCode',//�յ���������--C
		//��������Ϊ�յ���������ʱ������
		//'merCatCode'=> 'merCatCode',//�̻����--C
		//��
		'merId'=> '898340183980105',//�̻�����--M
		//��������Ϊ�յ���������ʱ������
		//'merName'=> 'merName',//�̻�����--C
		//��������Ϊ�յ���������ʱ������
		//'merAbbr'=> 'merAbbr',//�̻����--C
		//�̻�����Ϊƽ̨���̻�����ʱ��������
		//'subMerId'=> '',//�����̻�����--C
		//�̻�����Ϊƽ̨���̻�����ʱ��������
		//'subMerName'=> '',//�����̻�ȫ��--C
		//�̻�����Ϊƽ̨���̻�����ʱ��������
		//'subMerAbbr'=> '',//�����̻����--C
		//Ԥ��Ȩ�����Ķ����ţ����̻�����
		'orderId'=> date('YmdHis'),//�̻�������--M
		//ԭʼԤ��Ȩ���׵�queryId
		'origQryId'=> date('YmdHis'),//ԭʼ������ˮ��--M
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
		//encrypt_params ( $params );
		
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