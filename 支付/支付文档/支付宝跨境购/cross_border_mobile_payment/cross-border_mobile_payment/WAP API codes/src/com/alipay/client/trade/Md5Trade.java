/**
 * Alipay.com Inc.
 * Copyright (c) 2005-2008 All Rights Reserved.
 */
package com.alipay.client.trade;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.client.base.ClientConfig;
import com.alipay.client.security.SecurityManagerImpl;
import com.alipay.client.util.ParameterUtil;

/**
 * 
 * ����֧�����Ŀ���ƽ̨������֧�����ײ���
 * 
 * 1.��ҵ��������ⲿ���׺š���Ʒ���ơ���Ʒ�ܼۡ������ʻ��������ʻ���notify_url��Щ��������xml �ĸ�ʽ����<req_data></req_data>��
 * 2.��ͨ�ò���Ҳ������������� 3.�����ϵĲ�������ǩ����ǩ�����Ҳ�������������
 * 4.����֧��������ƽ̨��alipay.wap.trade.create.direct����
 * 5.�ӿ���ƽ̨���ص�������ȡ��request_token���Է��ص�����Ҫ����˽Կ���ܣ�����֧�����Ĺ�Կ��ǩ����
 * 6.ʹ���õ���request_token��װalipay.wap.auth.authAndExecute�������תurl
 * 7.������װ������url��ת��֧�����Ŀ���ƽ̨ҳ�棬���״�����֧����֧������ҳ�������
 * 
 * 
 * @author feng.chenf
 * @version $Id: Trade.java, v 0.1 2008-11-17 ����09:52:02 feng.chenf Exp $
 */
public class Md5Trade extends HttpServlet {

    private static final long                          serialVersionUID = -3035307235076650766L;

    // �ͻ�������
    private ClientConfig                               clientConfig     = new ClientConfig();

    // ��ȫ������
    private com.alipay.client.security.SecurityManager securityManager  = new SecurityManagerImpl();

    public void doPost(HttpServletRequest request, HttpServletResponse response)
                                                                                throws ServletException,
                                                                                IOException {
        Map<String, String> reqParams = prepareTradeRequestParamsMap(request);

        String sign = sign(reqParams);

        reqParams.put("sign", sign);
        reqParams.put("sign_type", request.getParameter("sign_type"));

        String url = "";
        try {
            url = getRedirectUrl(reqParams);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(url);

    }

    /**
     * ׼��Ҫ���ܵĲ���
     * 
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    private Map<String, String> prepareTradeRequestParamsMap(HttpServletRequest request)
                                                                                        throws UnsupportedEncodingException {
        Map<String, String> requestParams = new HashMap<String, String>();
        request.setCharacterEncoding("utf-8");

        //�����ǻ�������
        //���������ַ���
        String inputCharset = request.getParameter("_input_charset");
        requestParams.put("_input_charset", inputCharset);
        //�ӿ�����
        String service = request.getParameter("service");
        requestParams.put("service", service);
        //�������ID
        String partner = request.getParameter("partner");
        requestParams.put("partner", partner);
        //����URL
        String returnUrl = request.getParameter("return_url");
        requestParams.put("return_url", returnUrl);
        //֪ͨURL
        String notifyUrl = request.getParameter("notify_url");
        requestParams.put("notify_url", notifyUrl);

        //������ҵ�����
        // �ⲿ���׺�
        String outTradeNo = request.getParameter("out_trade_no").trim();
        requestParams.put("out_trade_no", outTradeNo);
        // ��Ʒ����
        String subject = request.getParameter("subject").trim();
        requestParams.put("subject", subject);
        // ��Ʒ����
        String body = request.getParameter("body").trim();
        requestParams.put("body", body);
        // ��Ʒ����ܼ�
        String totalFee = request.getParameter("total_fee").trim();
        requestParams.put("total_fee", totalFee);
        // ��Ʒ������ܼ�
        String rmbFee = request.getParameter("rmb_fee").trim();
        requestParams.put("rmb_fee", rmbFee);
        // ��ұ���
        String currency = request.getParameter("currency").trim();
        requestParams.put("currency", currency);
        // ������
        String supplier = request.getParameter("supplier").trim();
        requestParams.put("supplier", supplier);
        // ���׳�ʱ����
        String timeoutRule = request.getParameter("timeout_rule").trim();
        requestParams.put("timeout_rule", timeoutRule);
        // �ⲿ�û�ID
        String outUser = request.getParameter("out_user").trim();
        requestParams.put("out_user", outUser);
        // δ���֧�����û�������ӷ����̻�
        String merchantUrl = request.getParameter("merchant_url").trim();
        requestParams.put("merchant_url", merchantUrl);

        System.out.println("prepareTradeRequestParamsMap" + requestParams);
        return requestParams;
    }

    /**
     * �Բ�������ǩ��
     * 
     * @param reqParams
     * @return
     */
    private String sign(Map<String, String> reqParams) {

        String signData = ParameterUtil.getSignData(reqParams);
        String sign = "";
        try {
            sign = securityManager.sign(clientConfig.getMd5SignAlgo(), signData, clientConfig
                .getMd5Key());
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        return sign;
    }

    /**
     * ����alipay.wap.auth.authAndExecute�����ʱ����Ҫ��ת��֧������ҳ�棬��װ��תurl
     * 
     * @param reqParams
     * @return
     * @throws Exception
     */
    private String getRedirectUrl(Map<String, String> reqParams) throws Exception {
        String redirectUrl = clientConfig.getServerUrl() + ":" + clientConfig.getServerPort()
                             + "/gateway.do?";
        redirectUrl = redirectUrl + ParameterUtil.mapToUrl(reqParams);
        return redirectUrl;
    }
    
    
}
