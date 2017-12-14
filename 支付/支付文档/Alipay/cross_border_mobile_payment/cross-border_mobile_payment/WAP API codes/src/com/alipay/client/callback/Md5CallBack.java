/**
 * Alipay.com Inc.
 * Copyright (c) 2005-2008 All Rights Reserved.
 */
package com.alipay.client.callback;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.client.base.ClientConfig;
import com.alipay.client.security.SecurityManagerImpl;
import com.alipay.client.util.ParameterUtil;

/**
 * 
 * 
 * @author feng.chenf
 * @version $Id: CallBack.java, v 0.1 2009-2-3 ����05:16:26 feng.chenf Exp $
 */
public class Md5CallBack extends HttpServlet {

    private ClientConfig                               clientConfig     = new ClientConfig();

    private com.alipay.client.security.SecurityManager securityManager  = new SecurityManagerImpl();

    private static final long                          serialVersionUID = -2234271646410251381L;

    @SuppressWarnings("unchecked")
    public void doGet(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("callback ���յ�֪ͨ!");
        String sign = request.getParameter("sign");
        Map map = request.getParameterMap();
        System.out.println("callback ���յ��Ĳ���" + map);
        String verifyData = getVerifyData(map);
        System.out.println("callback Ҫ��֤������ " + verifyData);
        boolean verified = false;

        //��ǩ��
        try {
            verified = securityManager.verify(clientConfig.getMd5SignAlgo(), verifyData, sign,
                clientConfig.getMd5Key());

            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            if (!verified) {
                System.out.println("�ص�ʧ�ܣ�");
                out.println("Illegal sign!!");
            } else {
            	
            	//put the database string here, to update the database�����ݽ���״̬����ҵ���߼���������״̬�ɹ�������ҵ���߼��ɹ�����дsuccess��
                //notice��if you use two mechanism to update trade_status, you should add a judgment so that a trade is only updated successfully one time.
                System.out.println("�ص��ɹ���");
                out.println("Md5 signature verification success!!");
                out.println("Do SomeThing!!");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * �����ǩ��������
     * @param map
     * @return
     */
    private String getVerifyData(Map<String, String[]> map) {
        Map<String, String> pMap = ParameterUtil.convertParaMap(map);
        pMap = ParameterUtil.paraFilter(pMap);
        return ParameterUtil.createLinkString(pMap);
    }

}
