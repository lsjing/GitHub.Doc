
※注意※
1.  使用Visual Studio 2012以上或者别的开发工具建立ASP.Net网站。

2.  基于.net Framework4.5环境以上

3.  相关配置项都在Web.config文件中,请根据实际情况进行修改

4.  ICSharpCode.SharpZipLib.dll ,System.Net.Http.dll ,System.Numerics.dll在项目文件bin目录手动添加引用

5.  示例的前后台通知地址为FrontRcvResponse.aspx页面

常见错误如下：

1. 请求无效-400：查看参数 或者请求地址

2.方法没有实现-501：不要使用360浏览器和safari(包括域名解析错误/网站无法访问)

3.部署时候出现内部错误：请查看证书

4.系统找不到指定文件：请查看下配置路径下的地址,存储在本地的文件请使用/或者\ 例如(Asp.net)d:\  (php)d:/

5.此对象在获取私钥没有权限时使用 X509Certificate2 pc = new X509Certificate2(SDKConfig.SignCertPath, SDKConfig.SignCertPwd, X509KeyStorageFlags.MachineKeySet);(Asp.net的CertUtil.cs中GetSignProviderFromPfx方法)
或者拒绝访问：请查看iis中 加载配置文件是否为true 

6.应用程序中的服务器错误：未将对象引用到实例  请查看获取到的地址证书是否正确

7.签名无效：请查看送的参数值是否一致

8.验签失败：请查看证书 参数值 如果正确 可以问一下测试环境是否稳定

9.商户非法：请查看商户号是否已经开通

10.提供了无效的程序类型：请查看证书是否与开发包一致

11. respMsg=[9100004] Signature verification failed, 请详细查看送的参数值是否一致

12. respMsg=[6100030] 报文格式错误, 请把注释后面M的参数都送上去

13. private static Configuration config = WebConfigurationManager.OpenWebConfiguration("~");请使用虚拟路径

