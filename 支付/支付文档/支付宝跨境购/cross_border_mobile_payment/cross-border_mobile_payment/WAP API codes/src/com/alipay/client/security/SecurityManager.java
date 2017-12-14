/**
 * Alipay.com Inc.
 * Copyright (c) 2005-2006 All Rights Reserved.
 */
package com.alipay.client.security;

/**
 * ��ȫ������
 * 
 * @author jun.huyj
 * @version $Id: SecurityManager.java, v 0.1 Nov 11, 2008 10:01:29 AM jun.huyj Exp $
 */
public interface SecurityManager {

    /**
     * ��ԭʼ���ݽ���ǩ��
     * 
     * @param content ԭʼ����
     * @param algoType �㷨����
     * @param key ˽Կ
     * @return ǩ��
     * @throws Exception
     */
    public String sign(String algoType, String content, String key) throws Exception;

    /**
     * ��֤ǩ��
     * 
     * @param content ԭʼ����
     * @param algoType �㷨����
     * @param sign ǩ��
     * @param key ��Կ
     * @return ǩ����֤ͨ�� False ǩ����֤ʧ��
     * @throws Exception
     */
    public boolean verify(String algoType, String content, String sign, String key)
                                                                                   throws Exception;

}
