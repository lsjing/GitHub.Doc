
            �q�����������������������������������������������������������������������������r
    ����������           ��������֧�������˵��                                           ����������
            �t�����������������������������������������������������������������������������s                                                          
��       �ӿ����ƣ���������֧��ͳһ����ӿ�
�� ��    ����汾��1.1
         �������ԣ�ASP.NET(C#)
         ��    Ȩ����������֧��
��       �� �� �ߣ���������֧��
         ��ϵ��ʽ�� 

    ������������������������������������������������������������������

��������������
 �����ļ��ṹ
��������������

SDKUtil_CSHARP
  ��
  ��com.unionpay.sdk���������������������������ļ���
  ��  ��
  ��  ��BigNum.cs���������������������� ������C#ʵ����(Ϊ����.NET4.0���������ṩ)
  ��  ��
  ��  ��CertUtil.cs ��������������������֤�鹤����
  ��  ��
  ��  ��HttpClient.cs ��������������������̨����ͨ�Ŵ�����
  ��  ��
  ��  ��SDKConfig.cs ������������������ ����������
  ��  ��
  ��  ��SDKUtil.cs �������������������� SDK������
  ��  ��
  ��  ��SecurityUtil.cs ����������������ǩ��/��ǩ ����/���ܴ�����
  ��  ��
  ��  ��SecurityUtil.cs �����������������������������
  ��  ��
  ��  ��LogUtil.cs ������������������־��ӡ������
  ��
  ��demo.utf8������������������������������ʾ�����ļ���
  ��  ��
  ��  ��FrontPay.aspx����������������ǰ̨���ѽ���ʾ��
  ��  ��
  ��  ��BackPay.aspx���������������� ��̨���ѽ���ʾ��
  ��  ��
  ��  ��BatTransQuery.aspx������������������ѯʾ��
  ��  ��
  ��  ��FileTransfer.aspx ������������ �ļ������ཻ��ʾ��(������ʽ�����ļ�����)
  ��
  ��  ��AcpDeal.aspx��������������������ȫ����֧����ͨ����ʾ��
  ��  ��
  ��  ��AcpQueryDeal.aspx���������������� ����ȫ������ѯ����ʾ��
  ��  ��
  ��  ��AuthDeal.aspx������������Ԥ��Ȩ��ѯʾ��
  ��  ��
  ��  ��AuthFinish.aspx ������������ Ԥ��Ȩ���ʾ��
  ��
  ��  ��AuthUndo.aspx����������������Ԥ��Ȩ����ʾ��
  ��  ��
  ��  ��AutnFinishUndo.aspx���������������� Ԥ��Ȩ��ɳ���ʾ��
  ��  ��
  ��  ��BatTrans.aspx��������������������ʾ��
  ��  ��
  ��  ��BillPay.aspx ������������ �˵�֧��ʵ��
  ��  ��
  ��  ��BillQuery.aspx.aspx�����������������˵���ѯʾ��
  ��  ��
  ��  ��Collection.aspx���������������� ����ʾ��
  ��  ��
  ��  ��Consume.aspx���������������ѽ���ʾ��
  ��  ��
  ��  ��ConsumeUndo.aspx ������������ ���ѳ���ʾ��
  ��  ��
  ��  ��Purchase.aspx ������������ �˻�ʾ��
  ��  ��
  ��  ��Verify.aspx ������������ ʵ����֤ʾ��
  ��  
  ��  ��E-cash.aspx���������������������ֽ�ָ���˻�Ȧ��ʾ��
  ��  ��
  ��  ��FrontPay.aspx���������������� ǰ̨����ʾ��
  ��  ��
  ��  ��IcOfflineNotice.aspx������������IC���ѻ�����֪ͨʾ��
  ��  ��
  ��  ��Negotiation.aspx ������������ ����ʾ��
  �� 
  ��  ��NonE-cash.aspx���������������� �����ֽ��ָ���˻�Ȧ��ʾ��
  ��  ��
  ��  ��Remaining.aspx����������������ѯʾ��
  ��  ��
  ��  ��RemoveBinding.aspx ������������ ����󶨹�ϵʾ��
  ��  ��
  ��  ��SendSMS.aspx���������������Ͷ�����֤����ʾ��
  ��  ��
  ��  ��Transfer.aspx ������������ ת��ʾ��
  ��
  ��Web.Config �����������������������ļ�������ʱɾ����
  
  

��ע���
1.  ʹ��Visual Studio 2010���ϻ��߱�Ŀ������߽���ASP.Net��վ��

2.  ����.net Framework4.0��������

3.  ����������Web.config�ļ���,�����ʵ����������޸�

4.  ICSharpCode.SharpZipLib�ֶ��������


������������������
��Ҫ���ļ�����˵��
������������������

--------------------------------------------------------------------

CertUtil.cs


public static RSACryptoServiceProvider GetSignProviderFromPfx()
���ܣ���ȡǩ��֤������ṩ��
�����ǩ��֤������ṩ��


public static string GetSignCertId()
���ܣ���ȡǩ��֤���֤�����к�
�����ǩ��֤���֤�����к�


public static RSACryptoServiceProvider GetValidateProviderFromPath(string certId)
���ܣ�ͨ������֤�����кţ���ȡָ������ǩ֤������ṩ��
���룺֤�����к�
�������ǩ֤������ṩ��



��������������������������������������������������������������

HttpClient.cs


public int Send(Dictionary<string, string> sParaTemp, Encoding encoder)
���ܣ�����������ģ��Զ��HTTP��POST����ʽ���첢��ȡ�����Ĵ�����
���룺Dictionary<string, string> sParaTemp �����������
      Encoding encoder �ַ�����
�����int ͨ����Ӧ��


private static string BuildRequestParaToString(Dictionary<string, string> sParaTemp, Encoding code)
���ܣ�����Ҫ����������Ĳ�������
���룺Dictionary<string, string> sParaTemp ����ǰ�Ĳ�������
      Encoding code �ַ�����
�����string Ҫ����Ĳ��������ַ���


public static string CreateLinkStringUrlencode(Dictionary<string, string> dicArray, Encoding code)
���ܣ�����������Ԫ�أ����ա�����=����ֵ����ģʽ�á�&���ַ�ƴ�ӳ��ַ��������Բ���ֵ��urlencode
���룺Dictionary<string, string> dicArray ��Ҫƴ�ӵ�����
      Encoding code �ַ�����
�����string ƴ������Ժ���ַ���

v
��������������������������������������������������������������

SDKUtil.cs

public static bool Sign(Dictionary<string, string> data, Encoding encoder)
���ܣ��������������ǩ��
���룺Dictionary<string, string> data �������
      Encoding encoder �ַ�����
�����bool ǩ�����(�ɹ�/ʧ��)


public static bool Validate(Dictionary<string, string> data, Encoding encoder)
���ܣ���֤��Ϣ�Ƿ������������ĺϷ���Ϣ
���룺Dictionary<string, string> data ֪ͨ���ز�������
      Encoding encoder �ַ�����
�����bool ��ǩ���(�ɹ�/ʧ��)


public static string CoverDictionaryToString(Dictionary<string, string> data)
���ܣ�����������������������Ϊ��ֵ���ַ���
���룺Dictionary<string, string> data ��������
�����string �����Ľ��


public static Dictionary<string, string> CoverStringToDictionary(string data)
���ܣ�����ֵ����ʽ���ַ���ת��Ϊ��������
���룺string data ��ֵ����ʽ���ַ���
�����ת����Ĳ�������


public static Dictionary<string, string> printHexString(byte b)
���ܣ�pinblock 16���Ƽ���


public static Dictionary<string, string> encryptPin(string card, string pwd, string encoding)
���ܣ����뿨��pinblock����



public static string CreateAutoSubmitForm(string url, Dictionary<string, string> data, Encoding encoder)
���ܣ�����һ�����Զ��ύ���ܵ�HTML��
���룺string url �����ַ
      Dictionary<string, string> data �����������
      Encoding encoder �ַ�����
�����string �ַ���HTML�����


public static string GenerateCustomerInfo(Encoding encoder)
���ܣ��������п���֤��Ϣ�������Ϣ��customerInfo
���룺Encoding encoder �ַ�����
�����string �������п���֤��Ϣ�������Ϣ��customerInfo���ֵ


��������������������������������������������������������������

SecurityUtil.cs


public static byte[] Sha1X16(string dataStr, Encoding encoding)
���ܣ�����SHA1�㷨����ժҪ
���룺string dataStr ��������ַ���
      Encoding encoder �ַ�����
�����byte[] ժҪ������


public static byte[] SignBySoft(RSACryptoServiceProvider provider, byte[] data)
���ܣ������ݽ���RSAǩ��
���룺RSACryptoServiceProvider provider RSA�����ṩ��
      byte[] data ��ǩ���ֽ�����
�����byte[] ǩ��������


public static bool ValidateBySoft(RSACryptoServiceProvider provider, byte[] base64DecodingSignStr, byte[] srcByte)
���ܣ������ݽ���RSA��ǩ
���룺RSACryptoServiceProvider provider RSA�����ṩ��
      byte[] base64DecodingSignStr ǩ��������BASE64������ֽ�����
      byte[] srcByte ����ǩ��ԭ���ֽ�����
�����bool ��ǩ���(�ɹ�/ʧ��)

��������������������������������������������������������������

SDKConfig.cs

public static string FrontTransUrl
���ܣ���ȡ�����ļ���ȡǰ̨���׵�ַ
�����string ����ǰ̨���׵�ַ

public static string BackTransUrl
���ܣ���ȡ�����ļ���ȡ��̨���׵�ַ
�����string ���غ�̨���׵�ַ

public static string SingleQueryUrl
���ܣ���ȡ�����ļ���ȡ���ײ�ѯ��ַ
�����string ���ؽ��ײ�ѯ��ַ

public static string FileTransUrl
���ܣ���ȡ�����ļ���ȡ�ļ������ཻ�׵�ַ
�����string �����ļ������ཻ�׵�ַ


public static string cardRequestUrl
���ܣ���ȡ�����ļ���ȡ�п����׵�ַ
�����string �����п����׵�ַ


public static string appRequestUrl
���ܣ���ȡ�����ļ���ȡapp���׵�ַ
�����string ����app���׵�ַ

public static string SignCertPath
���ܣ���ȡ�����ļ���ȡǩ��֤��·��
�����string ����ǩ��֤��·��

public static string SignCertPwd
���ܣ���ȡ�����ļ���ȡǩ��֤������
�����string ����ǩ��֤������

public static string ValidateCertDir
���ܣ���ȡ�����ļ���ȡ��ǩĿ¼	
�����string ������ǩĿ¼

public static string EncryptCert
���ܣ���ȡ�����ļ���ȡ����֤��Ŀ¼	
�����string ���ؼ���֤��Ŀ¼

Web.config���������޸�����������Ϣ��
 
 <appSettings>
  	<!-- ##########################���׷��͵�ַ����#############################-->
    <!--######(��������ΪPM�������������Ի����ã������������ü��ĵ�˵��)#######-->
    <!-- ǩ��֤��·�� PM_700000000000001_acp.pfx-->
    <add key="sdk.signCert.path" value="d:\certs\PM_700000000000001_acp.pfx" />
    <!-- ǩ��֤������ -->
    <add key="sdk.signCert.pwd" value="000000" />
    <!-- ǩ��֤������ -->
    <add key="sdk.signCert.type" value="PKCS12" />
    <!-- ����֤��·�� -->
    <add key="sdk.encryptCert.path" value="d:\certs\encrypt.cer" />
    <!-- ��ǩ֤��Ŀ¼ -->
    <add key="sdk.validateCert.dir" value="d:\certs\" />
    <!-- ǰ̨���׵�ַ -->
    <add key="sdk.frontTransUrl" value="https://101.231.204.80:5000/gateway/api/frontTransReq.do" />
    <!-- ��̨���׵�ַ -->
    <add key="sdk.backTransUrl" value="https://101.231.204.80:5000/gateway/api/backTransReq.do" />
    <!-- ����״̬��ѯ��ַ -->
    <add key="sdk.singleQueryUrl" value="https://101.231.204.80:5000/gateway/api/queryTrans.do" />
    <!-- �ļ������ཻ�׵�ַ -->
    <add key="sdk.fileTransUrl" value="https://101.231.204.80:9080/" />
    <!-- �������׵�ַ -->
    <add key="sdk.batTransUrl" value="https://101.231.204.80:5000/gateway/api/batchTrans.do" />
    <!-- �п����׵�ַ -->
    <add key="sdk.cardRequestUrl" value="https://101.231.204.80:5000/gateway/api/cardTransReq.do" />
    <!-- app���׵�ַ �ֻ��ؼ�֧��ʹ�øõ�ַ-->
    <add key="sdk.appRequestUrl" value="https://101.231.204.80:5000/gateway/api/appTransReq.do" />
</appSettings>