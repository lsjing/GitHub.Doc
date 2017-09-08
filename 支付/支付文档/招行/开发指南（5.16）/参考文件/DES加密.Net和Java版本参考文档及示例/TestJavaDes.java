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
	
	//����
	public static void main(String args[]) {
		//����������
		String sBodyContent = "REQSERIAL=001&CUSTARGNO=001&MERCHANTNO=N3713585&MOBILE=15068821597";
		//������Կkey��cmbsh29i��������ʱԼ���޸�
		String desKey = "cmbsh29i";
	
		try {
			byte[] byteKey = desKey.getBytes("ASCII");
			byte[] byteBodyContent = sBodyContent.getBytes("UTF-8");
			
			byte[] baCiphertext = TestJavaDes.DesEncrypt(byteBodyContent, byteKey);
			
			BASE64Encoder base64Encoder = new BASE64Encoder();
			String sCiphertext = base64Encoder.encode(baCiphertext);
			System.out.println("Des���ܺ������Ϊ:" + sCiphertext);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	* ����
	* @param plain byte[]
	* @param key String
	* @return byte[]
	*/
	public static byte[] DesEncrypt(byte[] plain, byte[] key) {
		try{
			SecureRandom random = new SecureRandom();
			DESKeySpec desKeySpec = new DESKeySpec(key);
			//����һ���ܳ׹�����Ȼ��������DESKeySpecת����
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey securekey = keyFactory.generateSecret(desKeySpec);
			//Cipher����ʵ����ɼ��ܲ���
			Cipher cipher = Cipher.getInstance("DES");//DES/ECB/PKCS5Padding
			//���ܳ׳�ʼ��Cipher����
			cipher.init(Cipher.ENCRYPT_MODE, securekey, random);
			//���ڣ���ȡ���ݲ�����
			//��ʽִ�м��ܲ���
			return cipher.doFinal(plain);
		} catch(Throwable e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//TODO ����
	//ֱ�ӽ���������
	/**try {
		byte[] decryResult = TestDes.decrypt(result, desKey);
		System.out.println("���ܺ�"+new String(decryResult));
	} catch (Exception e1) {
		e1.printStackTrace();
	}**/
	
	/**
	* ����
	* @param src byte[]
	* @param password String
	* @return byte[]
	* @throws Exception
	*/
	public static byte[] decrypt(byte[] src, String password) throws Exception {
		// DES�㷨Ҫ����һ�������ε������Դ
		SecureRandom random = new SecureRandom();
		// ����һ��DESKeySpec����
		DESKeySpec desKey = new DESKeySpec(password.getBytes());
		// ����һ���ܳ׹���
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		// ��DESKeySpec����ת����SecretKey����
		SecretKey securekey = keyFactory.generateSecret(desKey);
		// Cipher����ʵ����ɽ��ܲ���
		Cipher cipher = Cipher.getInstance("DES");
		// ���ܳ׳�ʼ��Cipher����
		cipher.init(Cipher.DECRYPT_MODE, securekey, random);
		// ������ʼ���ܲ���
		return cipher.doFinal(src);
	}
}
