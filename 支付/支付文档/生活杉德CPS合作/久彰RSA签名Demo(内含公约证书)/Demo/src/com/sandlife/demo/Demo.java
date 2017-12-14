package com.sandlife.demo;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.sandlife.signature.service.JZSignature;
import com.sandlife.util.MD5Util;
import com.sandlife.util.URLInvoker;

public class Demo {
    
     public static void main(String[] args) throws Exception {
    	 
    	 SimpleDateFormat sd = new SimpleDateFormat("yyyymmddhhmmss");
    	   String time = sd.format(new Date());
    	   
    	   String version = "v1.0.0";                //�汾��           ��ϸ˵�����ĵ�        �����̻���ת��������(V1.0.7��).doc
    	   String fromChannel = "ZHONGLIANG";        //��������
    	   String busType = "00000001";              //ҵ������
    	   String merId = "888002166660015";         //�̻���
    	   String merName = "test";                  //�̻�����
    	   String userId = "123456";                 //��ԱId
    	   String orderId = "123456";                //�̻�������
    	   String orderTime = time;                  //��������
    	   String commodities = "{}";                //��Ʒ��Ϣ  JSON��ʽ����
    	   String dispatchAmt = "000000001000";      //���ͷ���
    	   String orderAmt = "000000001000";         //�����ܶ�
    	   String notifyUrl = "";                    //�ص�url��ַ
    	   String remark = "";                       //��ע��Ϣ
    	   String backUp = "";                       //�̻������ֶ�
    	   String md5merId = MD5Util.MD5(merId).substring(0,16);   //MD5�����̻��ź�ȥǰ16λ
    	   
    	StringBuffer sbf = new StringBuffer();
  		sbf.append("version=").append(version)
  		   .append("&fromChannel=").append(fromChannel)
  		   .append("&busType=").append(busType)
  		   .append("&merId=").append(merId)
  		   .append("&merName=").append(merName)
  		   .append("&userId=").append(userId)
  		   .append("&orderId=").append(orderId)
  		   .append("&orderTime=").append(orderTime)
  		   .append("&commodities=").append(commodities)
  		   .append("&dispatchAmt=").append(dispatchAmt)
  		   .append("&orderAmt=").append(orderAmt)
  		   .append("&notifyUrl=").append(notifyUrl)
  		   .append("&remark=").append(remark)
  		   .append("&backUp=").append(backUp)
  		   .append("&").append(md5merId);
    	     
  		System.out.println("����ǩ���Ĳ�����" + sbf.toString());
  		
  		JZSignature jz = new JZSignature();
  		
  		//˽Կǩ��
  		String sign = jz.signByPrivateKeyPem(sbf.toString(),"src/com/sandlife/demo/pkcs8_rsa_private_key.pem");
  	
  		sbf.append("&signType=").append("RSA")
  		   .append("&sign=").append(URLEncoder.encode(sign,"UTF-8"));  //ǩ����URLEncoder�·�ֹ ��+�����ַ��Զ�ת��

  		System.out.println("ǩ��:" + sign);
  		System.out.println("���������" + sbf.toString());
  		String url = "http://sandlife.sandpay.com.cn:8080/index.php/openapi/sandcps_order/create";
  		String result = URLInvoker.readDataFromHttpPost(url, sbf.toString(),"UTF-8");
  		System.out.println("��Ӧ����" + result);
  		
	}
     
     //��������
     public static void Test1() 
     {
    	 JZSignature jz = new JZSignature();
    	 
    	 //ǩ������ 
    	 jz.sign("content", "˽Կ.pfx", "pwd");         //˽Կ ��.pfx
         jz.signByPrivateKey("content", "privateKey"); // content ǩ������   privateKey ˽Կ�ַ���
         jz.signByPrivateKeyPem("content", "privateKeyPath.pem");    // content ǩ������   privateKeyPath ˽Կ·�� ��.pem��
         
         //��ǩ����
         jz.checkSign("content", "sign", "publicKeyPath"); // content ǩ������  publicKeyPath ��Կ·�� (.cer֤��)
         jz.checkSignByPublicKey("content", "sign", "publicKey"); // content ǩ������  publicKey ��Կ�ַ���
     }
     
     
}
