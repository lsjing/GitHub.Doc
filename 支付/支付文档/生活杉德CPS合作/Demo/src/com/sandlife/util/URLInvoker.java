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
	        //设置连接超时时间20秒
	        connection.setConnectTimeout(20000);
	        //设置读取数据超时20秒
	        connection.setReadTimeout(20000);
	        // 设置是否向connection输出
	        connection.setDoOutput(true);
	        // 设置是否向connection输入
	        connection.setDoInput(true);
	        // Default is GET
	        connection.setRequestMethod("POST");
	        // Post请求不能使用缓存
	        connection.setUseCaches(false);
	        
	        //connection.setFollowRedirects(true);
	        
	        connection.setInstanceFollowRedirects(true);
	        
	        // 配置application/x-www-form-urlencoded
	        connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
	        connection.setRequestProperty("Content-Length", String.valueOf(content.getBytes().length));   
	        // 配置必须要在connect之前完成
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
	        // 设置是否向connection输出
	        connection.setDoOutput(true);
	        // 设置是否向connection输入
	        connection.setDoInput(true);
	        // Default is GET
	        connection.setRequestMethod("POST");
	        // Post请求不能使用缓存
	        connection.setUseCaches(false);
	        
	        //connection.setFollowRedirects(true);
	        
	        connection.setInstanceFollowRedirects(true);
	        
	        // 配置application/x-www-form-urlencoded
	        connection.setRequestProperty("Content-Type", contentType);
	        connection.setRequestProperty("Content-Length", String.valueOf(content.getBytes().length));   
	        // 配置必须要在connect之前完成
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
