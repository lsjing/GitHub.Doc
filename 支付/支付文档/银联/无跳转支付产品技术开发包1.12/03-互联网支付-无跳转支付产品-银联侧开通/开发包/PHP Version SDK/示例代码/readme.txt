
※注意※
1.  php代码版本5.3 Apache服务（推荐使用wampserver/phpStudy）

2.  SDKConfig.php类中的前后台通知类地址在测试类response.php

3.  openssl证书放在Apache的bin目录中. 其中的php_openssl.dll,ssleay32.dll,libeay32.dll,3个文件拷到windows/system32/文件夹下，在重启Apache服务

4.  商户号填写：请使用自己在银联开通的账号 
    订单号：代码里面默认为当前日期时分秒
    前后台地址：http://127.1:88/upacp_sdk_php/demo/response.php 本机端口

5.  配置地址 证书请根据配置文件里的地址和证书复制上去
常见错误如下：
1.接收结果请使用post接收(response.php)

2. const无法使用 请使用difine

3. 请求无效-400：查看参数 或者请求地址

4.方法没有实现-501：不要使用360浏览器和safari(包括域名解析错误/网站无法访问)

5.部署时候出现内部错误：请查看证书

6.Fatal error: Call to undefined function openssl_pkcs12_read() 问题请查看php.ini， ;extension=php_openssl.dll，将前面的“;”去掉 查看apache服务是否加载了openssl证书

7.应用程序中的服务器错误：未将对象引用到实例  请查看获取到的地址证书是否正确

8.签名无效：请查看送的参数值是否一致

9.验签失败：请查看证书 参数值 如果正确 可以问一下测试环境是否稳定

10.商户非法：请查看商户号是否已经开通

11.提供了无效的程序类型：请查看证书是否与开发包一致

12. respMsg=[9100004] Signature verification failed, 请详细查看送的参数值是否一致

13. respMsg=[6100030] 报文格式错误, 请把注释后面M的参数都送上去


