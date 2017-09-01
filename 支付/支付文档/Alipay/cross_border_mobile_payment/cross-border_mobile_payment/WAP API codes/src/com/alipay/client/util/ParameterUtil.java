/**
 * Alipay.com Inc.
 * Copyright (c) 2005-2006 All Rights Reserved.
 */
package com.alipay.client.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * �������칤����
 * 
 * @author jun.huyj
 * @version $Id: ParameterUtil.java, v 0.1 Nov 10, 2008 8:49:33 PM jun.huyj Exp $
 */
public class ParameterUtil {

    @SuppressWarnings("unchecked")
    public static Map<String, String> convertParaMap(Map requestParams) {

        Map<String, String> params = new HashMap<String, String>();

        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i]
                                                                             + ",";
            }
            //����������δ����ڳ�������ʱʹ�á����mysign��sign�����Ҳ����ʹ����δ���ת��
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
            params.put(name, valueStr);
        }
        return params;
    }

    /** 
     * ��ȥ�����еĿ�ֵ��ǩ������
     * @param sArray ǩ��������
     * @return ȥ����ֵ��ǩ�����������ǩ��������
     */
    public static Map<String, String> paraFilter(Map<String, String> sArray) {

        Map<String, String> result = new HashMap<String, String>();

        if (sArray == null || sArray.size() <= 0) {
            return result;
        }

        for (String key : sArray.keySet()) {
            String value = sArray.get(key);
            if (value == null || value.equals("") || key.equalsIgnoreCase("sign")
                || key.equalsIgnoreCase("sign_type")) {
                continue;
            }
            result.put(key, value);
        }

        return result;
    }

    /** 
     * ����������Ԫ�����򣬲����ա�����=����ֵ����ģʽ�á�&���ַ�ƴ�ӳ��ַ���
     * @param params ��Ҫ���򲢲����ַ�ƴ�ӵĲ�����
     * @return ƴ�Ӻ��ַ���
     */
    public static String createLinkString(Map<String, String> params) {

        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);

        String prestr = "";

        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);

            if (i == keys.size() - 1) {//ƴ��ʱ�����������һ��&�ַ�
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }

        return prestr;
    }

    /**
     * ��Map��װ�ɴ�ǩ�����ݡ�
     * ��ǩ�������ݱ��밴��һ����˳������ �����֧�����ṩ�ķ���Ĺ淶���������֧�����ķ����ͨ����ǩ����֤
     * @param params
     * @return
     */
    public static String getSignData(Map<String, String> params) {
        StringBuffer content = new StringBuffer();

        // ����key������
        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);

        for (int i = 0, j = keys.size(); i < j; i++) {
            String key = (String) keys.get(i);

            if ("sign".equals(key) || "sign_type".equals(key)) {
                continue;
            }
            String value = (String) params.get(key);
            if (value != null && !"".equals(value)) {
                content.append((i == 0 ? "" : "&") + key + "=" + value);
            } else {
                //content.append((i == 0 ? "" : "&") + key + "=");
            }

        }

        return content.toString();
    }

    /**
     * ��Map�е�������װ��url
     * @param params
     * @return
     * @throws UnsupportedEncodingException 
     */
    public static String mapToUrl(Map<String, String> params) throws UnsupportedEncodingException {
        StringBuilder sb = new StringBuilder();
        boolean isFirst = true;
        for (String key : params.keySet()) {
            String value = params.get(key);
            //System.out.println(key+":"+value);
            if (value != null && !"".equals(value)) {
                if (isFirst) {
                    sb.append(key + "=" + URLEncoder.encode(value, "utf-8"));
                    isFirst = false;
                } else {
                    sb.append("&" + key + "=" + URLEncoder.encode(value, "utf-8"));
                }
            }
        }
        return sb.toString();
    }

    /**
     * ȡ��URL�еĲ���ֵ��
     * <p>�粻���ڣ����ؿ�ֵ��</p>
     * 
     * @param url
     * @param name
     * @return
     */
    public static String getParameter(String url, String name) {
        if (name == null || name.equals("")) {
            return null;
        }
        name = name + "=";
        int start = url.indexOf(name);
        if (start < 0) {
            return null;
        }
        start += name.length();
        int end = url.indexOf("&", start);
        if (end == -1) {
            end = url.length();
        }
        return url.substring(start, end);
    }
}
