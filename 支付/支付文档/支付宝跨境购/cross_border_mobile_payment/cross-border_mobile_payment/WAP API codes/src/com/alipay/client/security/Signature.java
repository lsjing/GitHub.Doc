/**
 * Alipay.com Inc.
 * Copyright (c) 2005-2006 All Rights Reserved.
 */
package com.alipay.client.security;


/**
 * ǩ���ӿ� 
 * @author jun.huyj
 * @version $Id: Signature.java, v 0.1 2008-8-21 ����02:55:03 stone.zhangjl Exp $
 */
public interface Signature {

    /**
     * ��ԭʼ���ݽ���ǩ��
     * 
     * @param content ԭʼ����
     * @param key ˽Կ
     * @return ǩ��
     * @throws Exception
     */
    public String sign(String content, String key) throws Exception;

    /**
     * ��֤ǩ��
     * 
     * @param content ԭʼ����
     * @param sign ǩ��
     * @param key ��Կ
     * @return ǩ����֤ͨ�� False ǩ����֤ʧ��
     * @throws Exception
     */
    public boolean verify(String content, String sign, String key) throws Exception;
}
