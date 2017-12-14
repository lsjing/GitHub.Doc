package com.sandlife.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class URLInvoker {


	public static String readDataFromHttpGet(String url,String charset) {
		HttpURLConnection connection = null;
		BufferedReader reader  = null;
	    StringBuffer sb = new StringBuffer();
		try {
			URL getUrl = new URL(url);
			connection = (HttpURLConnection) getUrl.openConnection();
			connection.connect();
		    reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),charset));
			String line = "";
			while ((line = reader.readLine()) != null) {
				  sb.append(line);
			}
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		} finally{
			 try {
					if(reader != null) reader.close();
					if(connection != null) connection.disconnect();
				} catch (IOException e) {
				}
		}
		return sb.toString();
	}
	
	public static String readDataFromHttpPost(String url,String content,String charset){
		 HttpURLConnection connection = null;
		 DataOutputStream out = null;
		 BufferedReader reader = null;
		 StringBuffer sb = new StringBuffer();
		try {
	        URL postUrl = new URL(url);
	        connection = (HttpURLConnection) postUrl.openConnection();
	        //�������ӳ�ʱʱ��20��
	        connection.setConnectTimeout(20000);
	        //���ö�ȡ���ݳ�ʱ20��
	        connection.setReadTimeout(20000);
	        // �����Ƿ���connection���
	        connection.setDoOutput(true);
	        // �����Ƿ���connection����
	        connection.setDoInput(true);
	        // Default is GET
	        connection.setRequestMethod("POST");
	        // Post������ʹ�û���
	        connection.setUseCaches(false);
	        
	        //connection.setFollowRedirects(true);
	        
	        connection.setInstanceFollowRedirects(true);
	        
	        // ����application/x-www-form-urlencoded
	        connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
	        connection.setRequestProperty("Content-Length", String.valueOf(content.getBytes().length));   
	        // ���ñ���Ҫ��connect֮ǰ���
	        connection.connect();
	        out = new DataOutputStream(connection.getOutputStream());
	        //out.writeBytes(content); 
	        out.write(content.getBytes(charset));
	        out.flush();
	       
	        reader = new BufferedReader(new InputStreamReader( connection.getInputStream(),charset));
	        String line;
	        while ((line = reader.readLine()) != null) {
	            sb.append(line);
	        }
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		} finally{
			 try {
				    if(out != null) out.close();
					if(reader != null) reader.close();
					if(connection != null) connection.disconnect();
				} catch (IOException e) {
				}
		}
		
		return sb.toString();
	}
	
	public static String readDataFromHttpPost(String url,String content,String charset, String contentType){
		 HttpURLConnection connection = null;
		 DataOutputStream out = null;
		 BufferedReader reader = null;
		 StringBuffer sb = new StringBuffer();
		try {
	        URL postUrl = new URL(url);
	        connection = (HttpURLConnection) postUrl.openConnection();
	        // �����Ƿ���connection���
	        connection.setDoOutput(true);
	        // �����Ƿ���connection����
	        connection.setDoInput(true);
	        // Default is GET
	        connection.setRequestMethod("POST");
	        // Post������ʹ�û���
	        connection.setUseCaches(false);
	        
	        //connection.setFollowRedirects(true);
	        
	        connection.setInstanceFollowRedirects(true);
	        
	        // ����application/x-www-form-urlencoded
	        connection.setRequestProperty("Content-Type", contentType);
	        connection.setRequestProperty("Content-Length", String.valueOf(content.getBytes().length));   
	        // ���ñ���Ҫ��connect֮ǰ���
	        connection.connect();
	        out = new DataOutputStream(connection.getOutputStream());
	        //out.writeBytes(content); 
	        out.write(content.getBytes(charset));
	        out.flush();
	       
	        reader = new BufferedReader(new InputStreamReader( connection.getInputStream(),charset));
	        String line;
	        while ((line = reader.readLine()) != null) {
	            sb.append(line);
	        }
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		} finally{
			 try {
				    if(out != null) out.close();
					if(reader != null) reader.close();
					if(connection != null) connection.disconnect();
				} catch (IOException e) {
				}
		}
		
		return sb.toString();
	}

}
