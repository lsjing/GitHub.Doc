/**
 * Alipay.com Inc.
 * Copyright (c) 2005-2008 All Rights Reserved.
 */
package com.alipay.client.notify;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.client.base.ClientConfig;
import com.alipay.client.security.SecurityManagerImpl;
import com.alipay.client.util.ParameterUtil;

/**
 * ����֪ͨ������
 * 
 * @author feng.chenf
 * @version $Id: NotifyReceiver.java, v 0.1 2009-2-3 ����03:11:58 feng.chenf Exp $
 */
public class Md5NotifyReceiver extends HttpServlet {

    private ClientConfig                               clientConfig     = new ClientConfig();

    private com.alipay.client.security.SecurityManager securityManager  = new SecurityManagerImpl();

    private static final long                          serialVersionUID = 7216412938937049671L;

    private static final String                        HTTPS_VERIFY_URL = "https://mapi.alipay.com/gateway.do?service=notify_verify&";

    /**
     * 
     * notify ���յ��Ĳ���{sign=[Ljava.lang.String;@d3c6a3, trade_no=[Ljava.lang.String
        ;@1961581, notify_time=[Ljava.lang.String;@5ddb6e, total_fee=[Ljava.lang.String;
        @1f1235b, sign_type=[Ljava.lang.String;@4865ce, notify_type=[Ljava.lang.String;@
        113beb5, notify_id=[Ljava.lang.String;@14d7745, out_trade_no=[Ljava.lang.String;
        @d17ec3, trade_status=[Ljava.lang.String;@1d95da8, currency=[Ljava.lang.String;@
        193f6e2}
     * 
     * **/

    @SuppressWarnings("unchecked")
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("notify ���յ�֪ͨ!");
        //���֪ͨ����
        Map map = request.getParameterMap();
        System.out.println("notify ���յ��Ĳ���" + map);
        //���֪ͨǩ��
        String sign = (String) ((Object[]) map.get("sign"))[0];
        //��ô���ǩ��������
        String verifyData = getVerifyData(map);
        System.out.println("notify Ҫ��֤������ " + verifyData);
        boolean verified = false;
        //��֤noticeId
        String responseTxt = "true";
        if (request.getParameter("notify_id") != null) {
            String notify_id = request.getParameter("notify_id");
            responseTxt = verifyResponse(notify_id);
            System.out.println("notify noticeId��֤���" + responseTxt);
        }

        //��ǩ��
        try {
            verified = securityManager.verify(clientConfig.getMd5SignAlgo(), verifyData, sign,
                clientConfig.getMd5Key());
        } catch (Exception e) {
            e.printStackTrace();
        }
        PrintWriter out = response.getWriter();
        //��֤ǩ��ͨ��
        if (verified && responseTxt.equals("true")) {
        	// out_trade_no= $_POST["out_trade_no"]
        	// status = $_POST["trade_status"] 
        	// put the database string here, to update the database�����ݽ���״̬����ҵ���߼���������״̬�ɹ�������ҵ���߼��ɹ�����дsuccess����the notify must be done.
        	//notice��if you use two mechanism to update trade_status, you should add a judgment so that a trade is only updated successfully one time.
         
            System.out.println("����֧����ϵͳ֪ͨ��֤ǩ���ɹ���");
            out.print("success");
        } else {
            System.out.println("����֧����ϵͳ֪ͨ��֤ǩ��ʧ�ܣ����飡");
            out.print("fail");
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
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

    private String verifyResponse(String notify_id) {
        //��ȡԶ�̷�����ATN�������֤�Ƿ���֧��������������������

        String partner = clientConfig.getPartnerId();
        String veryfy_url = HTTPS_VERIFY_URL + "partner=" + partner + "&notify_id=" + notify_id;
        System.out.println("notify verfyUrl  " + veryfy_url);
        return checkUrl(veryfy_url);
    }

    private static String checkUrl(String urlvalue) {
        String inputLine = "";

        try {
            URL url = new URL(urlvalue);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(urlConnection
                .getInputStream()));
            inputLine = in.readLine().toString();
        } catch (Exception e) {
            e.printStackTrace();
            inputLine = "";
        }

        return inputLine;
    }
}
