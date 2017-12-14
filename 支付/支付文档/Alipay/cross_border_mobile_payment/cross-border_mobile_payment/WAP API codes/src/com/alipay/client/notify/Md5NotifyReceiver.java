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
 * 接收通知并处理
 * 
 * @author feng.chenf
 * @version $Id: NotifyReceiver.java, v 0.1 2009-2-3 下午03:11:58 feng.chenf Exp $
 */
public class Md5NotifyReceiver extends HttpServlet {

    private ClientConfig                               clientConfig     = new ClientConfig();

    private com.alipay.client.security.SecurityManager securityManager  = new SecurityManagerImpl();

    private static final long                          serialVersionUID = 7216412938937049671L;

    private static final String                        HTTPS_VERIFY_URL = "https://mapi.alipay.com/gateway.do?service=notify_verify&";

    /**
     * 
     * notify 接收到的参数{sign=[Ljava.lang.String;@d3c6a3, trade_no=[Ljava.lang.String
        ;@1961581, notify_time=[Ljava.lang.String;@5ddb6e, total_fee=[Ljava.lang.String;
        @1f1235b, sign_type=[Ljava.lang.String;@4865ce, notify_type=[Ljava.lang.String;@
        113beb5, notify_id=[Ljava.lang.String;@14d7745, out_trade_no=[Ljava.lang.String;
        @d17ec3, trade_status=[Ljava.lang.String;@1d95da8, currency=[Ljava.lang.String;@
        193f6e2}
     * 
     * **/

    @SuppressWarnings("unchecked")
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("notify 接收到通知!");
        //获得通知参数
        Map map = request.getParameterMap();
        System.out.println("notify 接收到的参数" + map);
        //获得通知签名
        String sign = (String) ((Object[]) map.get("sign"))[0];
        //获得待验签名的数据
        String verifyData = getVerifyData(map);
        System.out.println("notify 要验证的数据 " + verifyData);
        boolean verified = false;
        //验证noticeId
        String responseTxt = "true";
        if (request.getParameter("notify_id") != null) {
            String notify_id = request.getParameter("notify_id");
            responseTxt = verifyResponse(notify_id);
            System.out.println("notify noticeId验证结果" + responseTxt);
        }

        //验签名
        try {
            verified = securityManager.verify(clientConfig.getMd5SignAlgo(), verifyData, sign,
                clientConfig.getMd5Key());
        } catch (Exception e) {
            e.printStackTrace();
        }
        PrintWriter out = response.getWriter();
        //验证签名通过
        if (verified && responseTxt.equals("true")) {
        	// out_trade_no= $_POST["out_trade_no"]
        	// status = $_POST["trade_status"] 
        	// put the database string here, to update the database（根据交易状态处理业务逻辑，当交易状态成功，处理业务逻辑成功。回写success），the notify must be done.
        	//notice：if you use two mechanism to update trade_status, you should add a judgment so that a trade is only updated successfully one time.
         
            System.out.println("接收支付宝系统通知验证签名成功！");
            out.print("success");
        } else {
            System.out.println("接收支付宝系统通知验证签名失败，请检查！");
            out.print("fail");
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    /**
     * 获得验签名的数据
     * @param map
     * @return
     */
    private String getVerifyData(Map<String, String[]> map) {
        Map<String, String> pMap = ParameterUtil.convertParaMap(map);
        pMap = ParameterUtil.paraFilter(pMap);
        return ParameterUtil.createLinkString(pMap);
    }

    private String verifyResponse(String notify_id) {
        //获取远程服务器ATN结果，验证是否是支付宝服务器发来的请求

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
