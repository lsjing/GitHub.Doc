<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>֧����֧���������̻����״����ӿڽӿ�</title>
</head>
<?php
/* *
 * ���ܣ�֧���������̻����״����ӿڽ���ҳ
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

        //Return URL
        $return_url = "http://�̻����ص�ַ/create_forex_trade-PHP-GBK/return_url.php";
        //After the payment transaction is done
        //Notification URL
        $notify_url = "http://�̻����ص�ַ/create_forex_trade-PHP-GBK/notify_url.php";
        //The URL for receiving notifications after the payment process.
        //Goods name
        $subject = $_POST['WIDsubject'];
        //required��The name of the goods.
        //Goods description
        $body = $_POST['WIDbody'];
        //A detailed description of the goods.
        //Outside trade ID
        $out_trade_no = $_POST['WIDout_trade_no'];
        //required��A numbered transaction ID ��Unique inside the partner system��
        //Currency
        $currency = $_POST['WIDcurrency'];
        //required��The settlement currency merchant named in contract.
        //Payment sum
        $total_fee = $_POST['WIDtotal_fee'];
        //required��A floating number ranging 0.01��1000000.00


/************************************************************/

//����Ҫ����Ĳ������飬����Ķ�
$parameter = array(
		"service" => "create_forex_trade",
		"partner" => trim($alipay_config['partner']),
		"return_url"	=> $return_url,
		"notify_url"	=> $notify_url,
		"subject"	=> $subject,
		"body"	=> $body,
		"out_trade_no"	=> $out_trade_no,
		"currency"	=> $currency,
		"total_fee"	=> $total_fee,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);

//��������
$alipaySubmit = new AlipaySubmit($alipay_config);
$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "ȷ��");
echo $html_text;

?>
</body>
</html>