package com.bestpay.cashier;

import com.alibaba.fastjson.JSONObject;
import com.bestpay.cashier.manager.constant.SysConstants;
import com.bestpay.cashier.manager.model.RsaKeyBO;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <ul>
 * <li>缴费注释wap版 单元测试</li>
 * <li>作为提供给外部的样例测试类</li>
 * <li>1.测试获取公钥</li>
 * <li>2、下发短信验证码</li>
 * <li>3、短信验证码验证---（获取到 productNo、token、keyIndex 3个token元素）</li>
 * <li>4、拼凑收银台web页面地址，拿到这个url 就可以直接访问 收银台了</li>
 * <li>User:王俊 Date:2015/10/28 Time:15:38</li>
 * </ul>
 */
@Slf4j
public class UnitTest {

    /**
     * 流程测试
     */
    private static final String MER_ID = "043101180050000";

    /**
     * 流程测试商户KEY
     */
    private static final String MER_KEY = "344C4FB521F5A52EA28FB7FC79AEA889478D4343E4548C02";

    /**
     * 环境地址
     */
    private static final String ENV_URL = "http://localhost:8080"; // 本地开发地址
//    private static final String ENV_URL = "http://116.228.151.160:6001/h5-cashier"; // 综测地址
//    private static final String ENV_URL = "http://116.228.151.10:10870"; // 准生产地址
//    private static final String ENV_URL = "https://capi.bestpay.com.cn"; // 生产地址

    /**
     * 请求地址
     */
    private static final String URL = ENV_URL + "/common/interface";

    /**
     * TODO 测试用手机号 自己填写
     */
    private static final String TEST_PHONE_NUM = "";

    /* 以下3个参数 为getPublicKey 方法通过接口返回获得 */
    // RSA公钥
    private String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCKxJGHZEHT8g0PBA9dHev/KD7V89D0BK97OY5veaL1vlFedLZ3l055JC9VfxaEjBktwoA8B+m/3XSwqvZd89jTE5f/xPPdxVrsy12hIf4BhaWEUB9D5HT44du1/+l2UnF+0WRiUhHOqNHhwxnpTCRce7ARqexDWn5fpPHHPAWBZQIDAQAB";
    // RSA公钥index
    private String indexKey = "89";
    // 会话超时控制
    private String sessionId = "65329799754c41c5b6460184ab38e91c";

    /**
     * 1.测试获取公钥
     */
    @Before
    public void testGetPublicKey() throws IOException {
        String str = this.getPublicKey();
        JSONObject objs = JSONObject.parseObject(str);
        JSONObject obj=objs.getJSONObject("result");
        publicKey=obj.getString("pubKey");
        indexKey = obj.getString("keyIndex");
        sessionId = obj.getString("sessionId");
        log.info("publicKey:{},indexKey:{},sessionId:{}",obj.getString("pubKey"),obj.getString("keyIndex"),obj.getString("sessionId"));
    }

    /**
     * 获取公钥
     *
     * @return 公钥json
     * @throws IOException
     */
    private String getPublicKey() throws IOException {
        JSONObject jsonParams = new JSONObject();
        jsonParams.put("keyIndex", "");
        jsonParams.put("encryKey", "");
        jsonParams.put("encryStr", "");
        jsonParams.put("interCode", "INTER.SYSTEM.001");
        String requestBody = jsonParams.toJSONString();
        log.info("加密后整个请求报文数据:{}", requestBody);
        HttpPost httpPost = new HttpPost(URL);
        StringEntity se = new StringEntity(requestBody, SysConstants.SYS_CHARSET);
        httpPost.setEntity(se);
        HttpResponse httpResponse = HttpClients.createDefault().execute(httpPost);
        String responseStr = EntityUtils.toString(httpResponse.getEntity(), SysConstants.SYS_CHARSET);
        log.info("请求后反馈报文:{}", responseStr);
        return responseStr;
    }

    /**
     * 2.登录短信验证码下发接口
     */
    @Test
    public void sendSmsLogin() throws Exception {
        JSONObject jsonParams = new JSONObject();
        jsonParams.put("merId", MER_ID);
        jsonParams.put("orderSeq", "538419");
        jsonParams.put("orderAmt", "1");
        jsonParams.put("accId", "18055177348");
        this.postUtil(URL, jsonParams.toJSONString(), "INTER.ACCOUNT.007");
    }

    /**
     * 3.支付密码校验接口
     */
    @Test
    public void pwdAuth() throws Exception {
        JSONObject jsonParams = new JSONObject();
        jsonParams.put("merId", MER_ID);
        jsonParams.put("accId", "18055177348");
        jsonParams.put("accTxnPwd", "888888");
        jsonParams.put("isOnlyCheckPwd", "0");
        jsonParams.put("isBestPayClient", "0");
        this.postUtil(URL, jsonParams.toJSONString(), "INTER.ACCOUNT.004");
    }

    /**
     * 3.短信验证码验证---（获取到 productNo、token、keyIndex 3个token元素）
     */
    @Test
    public void validSms() throws Exception {
        JSONObject jsonParams = new JSONObject();
        jsonParams.put("merId", MER_ID);
        jsonParams.put("orderSeq", "538419");
        jsonParams.put("orderAmt", "1");
        jsonParams.put("accId", "18055177348");
        jsonParams.put("smsVerifyCode", "556688");
        this.postUtil(URL, jsonParams.toJSONString(), "INTER.ACCOUNT.002");
    }

    /**
     * 公共请求方法 Http post
     *
     * @param url        请求地址
     * @param jsonParams json参数
     * @param interCode  接口编码
     * @throws Exception
     */
    private void postUtil(String url, String jsonParams, String interCode) throws Exception {
        log.info("转码前整个请求数据:{}", jsonParams);
        String key = AES256.getStringRandom(32);
        String sign = AES256.AES_Encode(jsonParams, key);
        key = RSA.encrypt(key, publicKey, SysConstants.SYS_CHARSET);
        JSONObject param = new JSONObject();
        param.put("keyIndex", indexKey);
        param.put("encryStr", sign);
        param.put("encryKey", key);
        param.put("interCode", interCode);
        param.put("sessionId", sessionId);
        String requestBody = param.toJSONString();
        log.info("加密后整个请求报文数据:{}", requestBody);
        HttpPost httpPost = new HttpPost(url);
        StringEntity se = new StringEntity(requestBody, SysConstants.SYS_CHARSET);
        httpPost.setEntity(se);
        HttpResponse httpResponse = HttpClients.createDefault().execute(httpPost);
        String responseStr = EntityUtils.toString(httpResponse.getEntity(), SysConstants.SYS_CHARSET);
        log.info("请求后反馈报文:{}", responseStr);
    }

    /**
     * 4、拼凑收银台web页面地址
     *
     * @throws Exception
     */
    @Test
    public void webUrl() throws Exception {
        // 获取公钥
        String publicKeyJson = this.getPublicKey();
        Object result = JSONObject.parseObject(publicKeyJson, Resp.class).getResult();
        RsaKeyBO rsaKeyBO = JSONObject.parseObject(result.toString(), RsaKeyBO.class);

        // 指定参数
        String merchantId = MER_ID;
        String merKey = MER_KEY;
        String merchantPWD = "534231";
        String orderAMT = "0.01";
        String accountid = TEST_PHONE_NUM;
        String orderseq = String.valueOf(System.currentTimeMillis());
        String orderTranseq = System.currentTimeMillis() + "00001";
        String orderTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String ordervalidityTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String beforeBackUrl = "http://www.baidu.com";//前台回调地址
        String backmerchanturl = "http://127.0.0.1:8040/wapBgNotice.action";//后台回调地址-给网关下单使用
        String subject = "测试商品0000001";  //商品标题-给网关下单使用
        String productdesc = "测试商品描述";  //商品描述-给网关下单使用
        String userip = "192.168.11.130";  //用户ip-给网关下单使用
        String swtichAcc = "false";  //true false 表示 是否可以切换用户支付
        //下面3个参数 是通过 “短信验证码验证”接口---（获取到 productNo、token、keyIndex 3个token元素）
        String productNo = TEST_PHONE_NUM;
        String keyIndex = "35";
        String token = "e1qXi2X2X/A4w7/whudqq6LxrO0g3IO9Zr+z7W1qn6d7nv204oopKtTZAwtsukaLodi1CeoCxtDRNbr+oZZVJ/zvR34x0XBqlXDohH1yCEcYNvwn1w5SgGe/nHW+zKOzcLQBD/MQUtBdYMzc7p8g1N0gXyZhtuRyPVI/TOc3H4s=";

        StringBuilder md5Builder = new StringBuilder();
        md5Builder.append("SERVICE=").append("mobile.securitypay.pay")
                .append("&MERCHANTID=").append(merchantId)
                .append("&MERCHANTPWD=").append(merchantPWD)
                .append("&SUBMERCHANTID=").append("")
                .append("&BACKMERCHANTURL=").append(backmerchanturl)
                .append("&ORDERSEQ=").append(orderseq)
                .append("&ORDERREQTRANSEQ=").append(orderTranseq)
                .append("&ORDERTIME=").append(orderTime)
                .append("&ORDERVALIDITYTIME=").append(ordervalidityTime)
                .append("&CURTYPE=").append("RMB")
                .append("&ORDERAMOUNT=").append(orderAMT)
                .append("&SUBJECT=").append(subject)
                .append("&PRODUCTID=").append("04")
                .append("&PRODUCTDESC=").append(productdesc)
                .append("&CUSTOMERID=").append(accountid)
                .append("&SWTICHACC=").append(swtichAcc)
                .append("&KEY=").append(merKey);

        System.out.println("sign字段Md5加密原串：" + md5Builder.toString());
        String sign = null;
        try {
            sign = CryptTool.md5Digest(md5Builder.toString());
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        System.out.println("加密sign值：" + sign);

        final String paramStr = "MERCHANTID=" + merchantId
                + "&SUBMERCHANTID=" + ""
                + "&MERCHANTPWD=" + merchantPWD
                + "&ORDERSEQ=" + orderseq
                + "&ORDERAMOUNT=" + orderAMT
                + "&ORDERTIME=" + orderTime
                + "&ORDERVALIDITYTIME=" + ordervalidityTime
                + "&PRODUCTDESC=" + productdesc
                + "&CUSTOMERID=" + accountid
                + "&PRODUCTAMOUNT=" + orderAMT
                + "&ATTACHAMOUNT=" + "0"
                + "&CURTYPE=" + "RMB"
                + "&BEFOREMERCHANTURL=" + beforeBackUrl
                + "&BACKMERCHANTURL=" + backmerchanturl
                + "&ATTACH=" + ""
                + "&PRODUCTID=" + "04"
                + "&USERIP=" + userip
                + "&DIVDETAILS=" + ""
                + "&ACCOUNTID=" + accountid
                + "&BUSITYPE=" + "04"
                + "&ORDERREQTRANSEQ=" + orderTranseq
                + "&SERVICE=" + "mobile.securitypay.pay"
                + "&SIGNTYPE=" + "MD5"
                + "&SIGN=" + sign
                + "&SUBJECT=" + subject
                + "&ORDERAMOUNT=" + orderAMT
                + "&SWTICHACC=" + swtichAcc
                + "&KEY=" + merKey;
//                +"&tid="+productNo
//                +"&key_index="+keyIndex
//                +"&key_tid="+token

        System.out.println("数据原串:" + paramStr);

        // 上面得到的 paramStr 是 商户在网关下单的 必须要的参数
        // 下面进行 RSA+AES256加密 获得加密串，拼凑url 跳转到H5收银台
        String key = AES256.getStringRandom(32);
        String encryStr = AES256.AES_Encode(paramStr, key);
        key = RSA.encrypt(key, rsaKeyBO.getPubKey(), SysConstants.SYS_CHARSET);
        String webUrl = ENV_URL + "/gateway.pay" +
                "?platform=wap_3.0" +
                "&encryStr=" + encryStr +
                "&keyIndex=" + rsaKeyBO.getKeyIndex() +
                "&encryKey=" + key;
        System.out.println("免登录收银台webUrl-%2B：" + webUrl.replaceAll("\\+", "%2B"));
    }
}
