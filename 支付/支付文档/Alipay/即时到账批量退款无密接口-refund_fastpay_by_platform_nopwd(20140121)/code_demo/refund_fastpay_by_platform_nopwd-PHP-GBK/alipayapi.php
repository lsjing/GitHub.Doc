<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>֧������ʱ���������˿����ܽӿڽӿ�</title>
</head>
<?php
/* *
 * ���ܣ���ʱ���������˿����ܽӿڽ���ҳ
 * �汾��3.3
 * �޸����ڣ�2012-07-23
 * ˵����
 * ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 * �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

 *************************ע��*************************
 * ������ڽӿڼ��ɹ������������⣬���԰��������;�������
 * 1���̻��������ģ�https://b.alipay.com/support/helperApply.htm?action=consultationApply�����ύ���뼯��Э�������ǻ���רҵ�ļ�������ʦ������ϵ��Э�����
 * 2���̻��������ģ�http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9��
 * 3��֧������̳��http://club.alipay.com/read-htm-tid-8681712.html��
 * �������ʹ����չ���������չ���ܲ�������ֵ��
 */

require_once("alipay.config.php");
require_once("lib/alipay_submit.class.php");

/**************************�������**************************/

        //�������첽֪ͨҳ��·��
        $notify_url = "http://www.xxx.com/refund_fastpay_by_platform_nopwd-PHP-GBK/notify_url.php";
        //��http://��ʽ������·�����������?id=123�����Զ������
        //�˿����κ�
        $batch_no = $_POST['WIDbatch_no'];
        //���ÿ����һ�μ�ʱ���������˿����Ҫ�ṩһ�����κţ����뱣֤Ψһ��
        //�˿�����ʱ��
        $refund_date = $_POST['WIDrefund_date'];
        //�����ʽΪ��yyyy-MM-dd hh:mm:ss
        //�˿��ܱ���
        $batch_num = $_POST['WIDbatch_num'];
        //���������detail_data��ֵ�У���#���ַ����ֵ�������1�����֧��1000�ʣ�����#���ַ����ֵ��������999����
        //�������ݼ�
        $detail_data = $_POST['WIDdetail_data'];
        //�����ʽ�����4.3 �������ݼ�����˵����


/************************************************************/

//����Ҫ����Ĳ������飬����Ķ�
$parameter = array(
		"service" => "refund_fastpay_by_platform_nopwd",
		"partner" => trim($alipay_config['partner']),
		"notify_url"	=> $notify_url,
		"batch_no"	=> $batch_no,
		"refund_date"	=> $refund_date,
		"batch_num"	=> $batch_num,
		"detail_data"	=> $detail_data,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);

//��������
$alipaySubmit = new AlipaySubmit($alipay_config);
$html_text = $alipaySubmit->buildRequestHttp($parameter);
//����XML
//ע�⣺�ù���PHP5����������֧�֣��迪ͨcurl��SSL��PHP���û��������鱾�ص���ʱʹ��PHP�������
$doc = new DOMDocument();
$doc->loadXML($html_text);

//������������̻���ҵ���߼��������

//�������������ҵ���߼�����д�������´�������ο�������

//��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�

//����XML
if( ! empty($doc->getElementsByTagName( "alipay" )->item(0)->nodeValue) ) {
	$alipay = $doc->getElementsByTagName( "alipay" )->item(0)->nodeValue;
	echo charsetEncode($alipay,'gbk','utf-8');
}

//�������������ҵ���߼�����д�������ϴ�������ο�������

?>
</body>
</html>