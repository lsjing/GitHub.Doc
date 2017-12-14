package com.sandlife.demo;

import com.sandlife.signature.service.JZSignature;


public class Test {
    public static void main(String[] args) {
		JZSignature jz = new JZSignature();
		
		String content = "version=01&merId=888002166660015&userName=&orderId=20140225021620&payType=01" +
				"&payResult=0000&backOrderId=20140225130369&backOrderTime=20140225133857&" +
				"remark=&payed=000000000100&backUp=&f70559dfb78fd3c3";
		String sign = "Fceu+T7qFWULGL5Y8YqYo3ZGCkC6+qzj66edW4LV/46aSsDLoMAXpzD0U4Wg9rn8lzqLP24VExsygaS1PuSjmT7VKyYd/jJuCxkCgRKgY+Pb0kNtvylWgPHL15SopE4BCYM/T0QZf+lhqgecW6tLEtgGG6xTOz0q7DZp52z1Br0=";
		System.out.println("参与签名的内容：" + content);
		System.out.println("参与签名：" + sign);
		boolean i = jz.checkSign(content, sign, "C:\\Users\\Leonard\\Desktop\\ca_cps_public.cer");
		System.out.println("验签结果："+i);
	}
}
