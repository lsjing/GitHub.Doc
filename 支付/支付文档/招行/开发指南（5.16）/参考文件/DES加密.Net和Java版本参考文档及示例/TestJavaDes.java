import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.SecretKeyFactory;
import javax.crypto.SecretKey;
import javax.crypto.Cipher;

import sun.misc.BASE64Encoder;

public class TestJavaDes {
	
	public TestJavaDes() {
		
	}
	
	//测试
	public static void main(String args[]) {
		//待加密内容
		String sBodyContent = "REQSERIAL=001&CUSTARGNO=001&MERCHANTNO=N3713585&MOBILE=15068821597";
		//开发秘钥key：cmbsh29i，上生产时约定修改
		String desKey = "cmbsh29i";
	
		try {
			byte[] byteKey = desKey.getBytes("ASCII");
			byte[] byteBodyContent = sBodyContent.getBytes("UTF-8");
			
			byte[] baCiphertext = TestJavaDes.DesEncrypt(byteBodyContent, byteKey);
			
			BASE64Encoder base64Encoder = new BASE64Encoder();
			String sCiphertext = base64Encoder.encode(baCiphertext);
			System.out.println("Des加密后的数据为:" + sCiphertext);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	* 加密
	* @param plain byte[]
	* @param key String
	* @return byte[]
	*/
	public static byte[] DesEncrypt(byte[] plain, byte[] key) {
		try{
			SecureRandom random = new SecureRandom();
			DESKeySpec desKeySpec = new DESKeySpec(key);
			//创建一个密匙工厂，然后用它把DESKeySpec转换成
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey securekey = keyFactory.generateSecret(desKeySpec);
			//Cipher对象实际完成加密操作
			Cipher cipher = Cipher.getInstance("DES");//DES/ECB/PKCS5Padding
			//用密匙初始化Cipher对象
			cipher.init(Cipher.ENCRYPT_MODE, securekey, random);
			//现在，获取数据并加密
			//正式执行加密操作
			return cipher.doFinal(plain);
		} catch(Throwable e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//TODO 解密
	//直接将如上内容
	/**try {
		byte[] decryResult = TestDes.decrypt(result, desKey);
		System.out.println("解密后："+new String(decryResult));
	} catch (Exception e1) {
		e1.printStackTrace();
	}**/
	
	/**
	* 解密
	* @param src byte[]
	* @param password String
	* @return byte[]
	* @throws Exception
	*/
	public static byte[] decrypt(byte[] src, String password) throws Exception {
		// DES算法要求有一个可信任的随机数源
		SecureRandom random = new SecureRandom();
		// 创建一个DESKeySpec对象
		DESKeySpec desKey = new DESKeySpec(password.getBytes());
		// 创建一个密匙工厂
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		// 将DESKeySpec对象转换成SecretKey对象
		SecretKey securekey = keyFactory.generateSecret(desKey);
		// Cipher对象实际完成解密操作
		Cipher cipher = Cipher.getInstance("DES");
		// 用密匙初始化Cipher对象
		cipher.init(Cipher.DECRYPT_MODE, securekey, random);
		// 真正开始解密操作
		return cipher.doFinal(src);
	}
}
