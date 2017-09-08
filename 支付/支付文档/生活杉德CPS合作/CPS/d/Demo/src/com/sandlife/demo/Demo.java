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
    	   
    	   String version = "v1.0.0";                //版本号           详细说明见文档        久彰商户跳转技术方案(V1.0.7版).doc
    	   String fromChannel = "ZHONGLIANG";        //接入渠道
    	   String busType = "00000001";              //业务类型
    	   String merId = "888002166660015";         //商户号
    	   String merName = "test";                  //商户名称
    	   String userId = "123456";                 //会员Id
    	   String orderId = "123456";                //商户订单号
    	   String orderTime = time;                  //订单日期
    	   String commodities = "{}";                //商品信息  JSON格式数据
    	   String dispatchAmt = "000000001000";      //配送费用
    	   String orderAmt = "000000001000";         //订单总额
    	   String notifyUrl = "";                    //回调url地址
    	   String remark = "";                       //备注信息
    	   String backUp = "";                       //商户备用字段
    	   String md5merId = MD5Util.MD5(merId).substring(0,16);   //MD5加密商户号后去前16位
    	   
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
    	     
  		System.out.println("参与签名的参数：" + sbf.toString());
  		
  		JZSignature jz = new JZSignature();
  		
  		//私钥签名
  		String sign = jz.signByPrivateKeyPem(sbf.toString(),"src/com/sandlife/demo/pkcs8_rsa_private_key.pem");
  	
  		sbf.append("&signType=").append("RSA")
  		   .append("&sign=").append(URLEncoder.encode(sign,"UTF-8"));  //签名串URLEncoder下防止 “+”等字符自动转码

  		System.out.println("签名:" + sign);
  		System.out.println("请求参数：" + sbf.toString());
  		String url = "http://sandlife.sandpay.com.cn:8080/index.php/openapi/sandcps_order/create";
  		String result = URLInvoker.readDataFromHttpPost(url, sbf.toString(),"UTF-8");
  		System.out.println("响应数据" + result);
  		
	}
     
     //方法介绍
     public static void Test1() 
     {
    	 JZSignature jz = new JZSignature();
    	 
    	 //签名方法 
    	 jz.sign("content", "私钥.pfx", "pwd");         //私钥 是.pfx
         jz.signByPrivateKey("content", "privateKey"); // content 签名内容   privateKey 私钥字符串
         jz.signByPrivateKeyPem("content", "privateKeyPath.pem");    // content 签名内容   privateKeyPath 私钥路径 （.pem）
         
         //验签方法
         jz.checkSign("content", "sign", "publicKeyPath"); // content 签名内容  publicKeyPath 公钥路径 (.cer证书)
         jz.checkSignByPublicKey("content", "sign", "publicKey"); // content 签名内容  publicKey 公钥字符串
     }
     
     
}
