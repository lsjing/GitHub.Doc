
            ╭──────────────────────────────────────╮
    ────┤           银联在线支付插件包说明                                           ├────
            ╰──────────────────────────────────────╯                                                          
　       接口名称：银联在线支付统一接入接口
　 　    代码版本：1.1
         开发语言：ASP.NET(C#)
         版    权：银联在线支付
　       制 作 者：银联在线支付
         联系方式： 

    ─────────────────────────────────

───────
 代码文件结构
───────

SDKUtil_CSHARP
  │
  ├com.unionpay.sdk┈┈┈┈┈┈┈┈┈┈工具类文件夹
  │  │
  │  ├BigNum.cs┈┈┈┈┈┈┈┈┈┈┈ 大整数C#实现类(为低于.NET4.0开发环境提供)
  │  │
  │  ├CertUtil.cs ┈┈┈┈┈┈┈┈┈┈证书工具类
  │  │
  │  ├HttpClient.cs ┈┈┈┈┈┈┈┈┈后台交易通信处理类
  │  │
  │  ├SDKConfig.cs ┈┈┈┈┈┈┈┈┈ 基础配置类
  │  │
  │  ├SDKUtil.cs ┈┈┈┈┈┈┈┈┈┈ SDK工具类
  │  │
  │  └SecurityUtil.cs ┈┈┈┈┈┈┈┈签名/验签 加密/解密处理类
  │  │
  │  └SecurityUtil.cs ┈┈┈┈┈┈┈┈插件包常量定义
  │  │
  │  └LogUtil.cs ┈┈┈┈┈┈┈┈日志打印工具类
  │
  ├demo.utf8┈┈┈┈┈┈┈┈┈┈┈┈┈交易示例类文件夹
  │  │
  │  ├FrontPay.aspx┈┈┈┈┈┈┈┈前台消费交易示例
  │  │
  │  ├BackPay.aspx┈┈┈┈┈┈┈┈ 后台消费交易示例
  │  │
  │  ├BatTransQuery.aspx┈┈┈┈┈┈批量查询示例
  │  │
  │  └FileTransfer.aspx ┈┈┈┈┈┈ 文件传输类交易示例(联机方式对账文件下载)
  │
  │  ├AcpDeal.aspx┈┈┈┈┈┈┈┈银联全渠道支付开通交易示例
  │  │
  │  ├AcpQueryDeal.aspx┈┈┈┈┈┈┈┈ 银联全渠道查询交易示例
  │  │
  │  ├AuthDeal.aspx┈┈┈┈┈┈预授权查询示例
  │  │
  │  └AuthFinish.aspx ┈┈┈┈┈┈ 预授权完成示例
  │
  │  ├AuthUndo.aspx┈┈┈┈┈┈┈┈预授权撤销示例
  │  │
  │  ├AutnFinishUndo.aspx┈┈┈┈┈┈┈┈ 预授权完成撤销示例
  │  │
  │  ├BatTrans.aspx┈┈┈┈┈┈批量交易示例
  │  │
  │  └BillPay.aspx ┈┈┈┈┈┈ 账单支付实例
  │  │
  │  ├BillQuery.aspx.aspx┈┈┈┈┈┈┈┈账单查询示例
  │  │
  │  ├Collection.aspx┈┈┈┈┈┈┈┈ 代收示例
  │  │
  │  ├Consume.aspx┈┈┈┈┈┈消费交易示例
  │  │
  │  └ConsumeUndo.aspx ┈┈┈┈┈┈ 消费撤销示例
  │  │
  │  └Purchase.aspx ┈┈┈┈┈┈ 退货示例
  │  │
  │  └Verify.aspx ┈┈┈┈┈┈ 实名验证示例
  │  
  │  ├E-cash.aspx┈┈┈┈┈┈┈┈电子现金指定账户圈存示例
  │  │
  │  ├FrontPay.aspx┈┈┈┈┈┈┈┈ 前台交易示例
  │  │
  │  ├IcOfflineNotice.aspx┈┈┈┈┈┈IC卡脱机消费通知示例
  │  │
  │  └Negotiation.aspx ┈┈┈┈┈┈ 代付示例
  │ 
  │  ├NonE-cash.aspx┈┈┈┈┈┈┈┈ 电子现金非指定账户圈存示例
  │  │
  │  ├Remaining.aspx┈┈┈┈┈┈余额查询示例
  │  │
  │  └RemoveBinding.aspx ┈┈┈┈┈┈ 解除绑定关系示例
  │  │
  │  ├SendSMS.aspx┈┈┈┈┈┈发送短信验证码类示例
  │  │
  │  └Transfer.aspx ┈┈┈┈┈┈ 转账示例
  │
  ├Web.Config ┈┈┈┈┈┈┈┈┈配置文件（集成时删除）
  
  

※注意※
1.  使用Visual Studio 2010以上或者别的开发工具建立ASP.Net网站。

2.  基于.net Framework4.0环境以上

3.  相关配置项都在Web.config文件中,请根据实际情况进行修改

4.  ICSharpCode.SharpZipLib手动添加引用


─────────
主要类文件函数说明
─────────

--------------------------------------------------------------------

CertUtil.cs


public static RSACryptoServiceProvider GetSignProviderFromPfx()
功能：获取签名证书服务提供者
输出：签名证书服务提供者


public static string GetSignCertId()
功能：获取签名证书的证书序列号
输出：签名证书的证书序列号


public static RSACryptoServiceProvider GetValidateProviderFromPath(string certId)
功能：通过传入证书序列号，获取指定的验签证书服务提供者
输入：证书序列号
输出：验签证书服务提供者



┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉

HttpClient.cs


public int Send(Dictionary<string, string> sParaTemp, Encoding encoder)
功能：建立请求，以模拟远程HTTP的POST请求方式构造并获取银联的处理结果
输入：Dictionary<string, string> sParaTemp 请求参数数组
      Encoding encoder 字符编码
输出：int 通信响应码


private static string BuildRequestParaToString(Dictionary<string, string> sParaTemp, Encoding code)
功能：生成要请求给银联的参数数组
输入：Dictionary<string, string> sParaTemp 请求前的参数数组
      Encoding code 字符编码
输出：string 要请求的参数数组字符串


public static string CreateLinkStringUrlencode(Dictionary<string, string> dicArray, Encoding code)
功能：把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串，并对参数值做urlencode
输入：Dictionary<string, string> dicArray 需要拼接的数组
      Encoding code 字符编码
输出：string 拼接完成以后的字符串

v
┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉

SDKUtil.cs

public static bool Sign(Dictionary<string, string> data, Encoding encoder)
功能：对请求参数进行签名
输入：Dictionary<string, string> data 请求参数
      Encoding encoder 字符编码
输出：bool 签名结果(成功/失败)


public static bool Validate(Dictionary<string, string> data, Encoding encoder)
功能：验证消息是否是银联发出的合法消息
输入：Dictionary<string, string> data 通知返回参数数组
      Encoding encoder 字符编码
输出：bool 验签结果(成功/失败)


public static string CoverDictionaryToString(Dictionary<string, string> data)
功能：将参数数组内容排序后输出为键值对字符串
输入：Dictionary<string, string> data 参数数组
输出：string 排序后的结果


public static Dictionary<string, string> CoverStringToDictionary(string data)
功能：将键值对形式的字符串转换为参数数组
输入：string data 键值对形式的字符串
输出：转换后的参数数组


public static Dictionary<string, string> printHexString(byte b)
功能：pinblock 16进制计算


public static Dictionary<string, string> encryptPin(string card, string pwd, string encoding)
功能：密码卡号pinblock加密



public static string CreateAutoSubmitForm(string url, Dictionary<string, string> data, Encoding encoder)
功能：构建一个含自动提交功能的HTML表单
输入：string url 请求地址
      Dictionary<string, string> data 请求参数数组
      Encoding encoder 字符编码
输出：string 字符串HTML表单结果


public static string GenerateCustomerInfo(Encoding encoder)
功能：构造银行卡验证信息及身份信息域customerInfo
输入：Encoding encoder 字符编码
输出：string 返回银行卡验证信息及身份信息域customerInfo域的值


┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉

SecurityUtil.cs


public static byte[] Sha1X16(string dataStr, Encoding encoding)
功能：按照SHA1算法计算摘要
输入：string dataStr 待计算的字符串
      Encoding encoder 字符编码
输出：byte[] 摘要计算结果


public static byte[] SignBySoft(RSACryptoServiceProvider provider, byte[] data)
功能：对数据进行RSA签名
输入：RSACryptoServiceProvider provider RSA服务提供者
      byte[] data 待签名字节数据
输出：byte[] 签名计算结果


public static bool ValidateBySoft(RSACryptoServiceProvider provider, byte[] base64DecodingSignStr, byte[] srcByte)
功能：对数据进行RSA验签
输入：RSACryptoServiceProvider provider RSA服务提供者
      byte[] base64DecodingSignStr 签名串经过BASE64解码的字节数组
      byte[] srcByte 待验签的原文字节数组
输出：bool 验签结果(成功/失败)

┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉

SDKConfig.cs

public static string FrontTransUrl
功能：读取配置文件获取前台交易地址
输出：string 返回前台交易地址

public static string BackTransUrl
功能：读取配置文件获取后台交易地址
输出：string 返回后台交易地址

public static string SingleQueryUrl
功能：读取配置文件获取交易查询地址
输出：string 返回交易查询地址

public static string FileTransUrl
功能：读取配置文件获取文件传输类交易地址
输出：string 返回文件传输类交易地址


public static string cardRequestUrl
功能：读取配置文件获取有卡交易地址
输出：string 返回有卡交易地址


public static string appRequestUrl
功能：读取配置文件获取app交易地址
输出：string 返回app交易地址

public static string SignCertPath
功能：读取配置文件获取签名证书路径
输出：string 返回签名证书路径

public static string SignCertPwd
功能：读取配置文件获取签名证书密码
输出：string 返回签名证书密码

public static string ValidateCertDir
功能：读取配置文件获取验签目录	
输出：string 返回验签目录

public static string EncryptCert
功能：读取配置文件获取加密证书目录	
输出：string 返回加密证书目录

Web.config新增或者修改以下配置信息：
 
 <appSettings>
  	<!-- ##########################交易发送地址配置#############################-->
    <!--######(以下配置为PM环境：入网测试环境用，生产环境配置见文档说明)#######-->
    <!-- 签名证书路径 PM_700000000000001_acp.pfx-->
    <add key="sdk.signCert.path" value="d:\certs\PM_700000000000001_acp.pfx" />
    <!-- 签名证书密码 -->
    <add key="sdk.signCert.pwd" value="000000" />
    <!-- 签名证书类型 -->
    <add key="sdk.signCert.type" value="PKCS12" />
    <!-- 加密证书路径 -->
    <add key="sdk.encryptCert.path" value="d:\certs\encrypt.cer" />
    <!-- 验签证书目录 -->
    <add key="sdk.validateCert.dir" value="d:\certs\" />
    <!-- 前台交易地址 -->
    <add key="sdk.frontTransUrl" value="https://101.231.204.80:5000/gateway/api/frontTransReq.do" />
    <!-- 后台交易地址 -->
    <add key="sdk.backTransUrl" value="https://101.231.204.80:5000/gateway/api/backTransReq.do" />
    <!-- 交易状态查询地址 -->
    <add key="sdk.singleQueryUrl" value="https://101.231.204.80:5000/gateway/api/queryTrans.do" />
    <!-- 文件传输类交易地址 -->
    <add key="sdk.fileTransUrl" value="https://101.231.204.80:9080/" />
    <!-- 批量交易地址 -->
    <add key="sdk.batTransUrl" value="https://101.231.204.80:5000/gateway/api/batchTrans.do" />
    <!-- 有卡交易地址 -->
    <add key="sdk.cardRequestUrl" value="https://101.231.204.80:5000/gateway/api/cardTransReq.do" />
    <!-- app交易地址 手机控件支付使用该地址-->
    <add key="sdk.appRequestUrl" value="https://101.231.204.80:5000/gateway/api/appTransReq.do" />
</appSettings>