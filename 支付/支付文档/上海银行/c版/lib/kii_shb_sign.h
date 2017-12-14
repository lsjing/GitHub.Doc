/**
* kii_shb_sign �Ϻ���������ֱ���ͻ���ǩ����֤�ӿ�
* Copyright (C) 2009  Koalii, Beijing China  All rights reserved.
* 
* @filename    kii_shb_sign.h
*
* @description ������ͨǩ������֤��ͨǩ���Ƚӿ�
*
* @author    ����   liuz@bjkoal.com
* @date      ����   2009.06.13 
* @modify    �޸�   ��cryptapiʵ�ָ���opensslʵ��
* 
*/

#ifndef  _KII_SHB_SIGN_H_2009061316170000
#define  _KII_SHB_SIGN_H_2009061316170000

#ifdef WIN32
#if defined KII_SHB_SIGN_EXPORTS
#define KII_SHB_SIGN_API __declspec(dllexport)
#else
#define KII_SHB_SIGN_API __declspec(dllimport)
#endif
#else
#define KII_SHB_SIGN_API
#endif


#ifdef __cplusplus
extern "C"
{
#endif

/*
*	kii_Init  ��ʼ��openssl�㷨
*/

KII_SHB_SIGN_API void kii_Init();

/*
*	kii_Sign  ���ܣ���ԭ�����ݽ�����ͨǩ��
*
*	����˵����
*
*	strPfxFile��  �û�pfx��ʽǩ��֤�������·�����ļ�����
*	strPfxPwd��   �û�pfx��ʽ֤��ı����������Ϊ�գ���
*	pOriginData:  ԭ�����ݡ�
*	nOriginData:  ԭ�����ݵĳ��ȡ�
*	pb64RetData:  base64������ǩ�����ݣ����ΪNULL����������ǩ�����ݵĳ��ȡ�
*	nMaxRetSize:  ǩ�����ݵ���󳤶ȡ�
*
*	����ֵ��       > 0	�ɹ�����ǩ�����ݵĳ��ȣ�< 0 ʧ�ܣ����ش����롣
*
*	�����룺      -1	�����������ĳ������Ϊ�գ�
				  -1000 �ļ��򲻿�
				  -1001 �ļ�����Ϊ0
*                 -1002	����pkcs12���ʧ�ܣ�
*				  -1003	����pfxʧ�ܣ���˶��ļ�����
*				  -1004 ǩ��ʧ��
*				  -1005 ����֤���������֤�����ݣ�Ҫ��base64��ʽ֤�鴮��������ȷ
*				  -1006 ��֤����ȡ��Կ����
*				  -1007 ��֤����ȡ������������� 
*				  -1008 ֤��������������ָ����oid�� 
*				  -1009 δ�����oid��
*				  -1010 ������Ϊ��
*				  -1011 ȡoidʵ�����
*				  -2000	�ڴ����mallocʧ��
*				  -2001 base64�������
*				  -1006	֤�鲻����Ч���ڣ�δ��Ч���ѹ��ڣ�
*				  -1013	û���ҵ�֤���Ӧ��˽Կ
*                 -1007 pkcs7ǩ��ʧ��
*                 -4001��-4002��-4004��pkcs7����ȡǩ�����ʧ��
*                               
*/
KII_SHB_SIGN_API int  kii_Sign(
						const char  *strPfxFile, 
						const char  *strPfxPwd,	
						const char  *pOriginData,  
						int			  nOriginData,
						char 	   *pb64RetData,
						int			 nMaxRetSize);	


/*
*	kii_SignFile  ���ܣ����ļ����ݽ�����ͨǩ��
*
*	����˵����
*
*	strPfxFile��  �û�pfx��ʽǩ��֤�������·�����ļ�����
*	strPfxPwd��   �û�pfx��ʽ֤��ı����������Ϊ�գ���
*	strFile:      Ҫǩ�����ļ�����·�����ļ�����
*	pb64RetData:  base64������ǩ�����ݣ����ΪNULL����������ǩ�����ݵĳ��ȡ�
*	nMaxRetSize:  ǩ�����ݵ���󳤶ȡ�
*
*	����ֵ��       > 0	�ɹ�����ǩ�����ݵĳ��ȣ�< 0 ʧ�ܣ����ش����롣
*
*	�����룺      -1	�����������ĳ������Ϊ�ա��ļ��򲻿���
*                 -2	�ڴ�ռ����mallocʧ��
*				  -3	�� pfx�ļ�����֤��洢ʧ��
*				  -4	ö��֤��ʧ��
*				  -1006	֤�鲻����Ч���ڣ�δ��Ч���ѹ��ڣ�
*				  -1013	û���ҵ�֤���Ӧ��˽Կ
*                 -1007 pkcs7ǩ��ʧ��
*                 -4001��-4002��-4004��pkcs7����ȡǩ�����ʧ��
*                               
*/

KII_SHB_SIGN_API int  kii_SignFile(
						const char  *strPfxFile, 
						const char  *strPfxPwd,	
						const char  *strFile,  
						char 	   * pb64RetData,
						int			 nMaxRetSize);


/*
*	kii_VerifySign  ���ܣ�ʵ�ֶ�������ͨǩ��������֤��
*
*	����˵����
*
*	pOriginData:  ԭ�����ݡ�
*	nOriginData:  ԭ�����ݳ��ȡ�
*   pCert:        base64��ʽǩ��֤�顣
*	nCert:		  base64��ʽǩ��֤��ĳ��ȡ�
*	pb64SignData:  base64�����ǩ�����ݡ�
*	nb64SignData:  base64�����ǩ�����ݵĳ��ȡ�
*
*	����ֵ��       > 0	��֤�ɹ���=0 ��֤ʧ�ܣ�< 0 ���ش����롣
*
*	�����룺       -1	�����������ĳ������Ϊ�ա��ļ��򲻿���  
*				   -2   base64��������ȡcspָ�����
*                  -3   ����󴴽�֤��������ʧ�ܻ򴴽�hashʧ��
*                  -4   ���빫Կ��Ϣʧ��                
*                  -2001 �ڴ����mallocʧ��
*/
KII_SHB_SIGN_API int  kii_VerifySign (
						const char *pOriginData,
						int 		nOriginData,
						const char  *pCert,
						int			nCert,
						const char 	*pb64SignData,	
						int			 nb64SignData);


/*
*	kii_VerifySignFile  ���ܣ�ʵ�ֶ��ļ���ͨǩ��������֤��
*
*	����˵����
*
*	strFile:	  ǩ�����ļ�����·�����ļ�����
*   pCert:        base64��ʽǩ��֤�顣
*	nCert:		  base64��ʽǩ��֤��ĳ��ȡ�
*	pb64SignData:  base64�����ǩ�����ݡ�
*	nb64SignData:  base64�����ǩ�����ݵĳ��ȡ�
*
*	����ֵ��       > 0	��֤�ɹ���=0 ��֤ʧ�ܣ�< 0 ���ش����롣
*
*	�����룺       -1	�����������ĳ������Ϊ�ա��ļ��򲻿���  
*				   -2   base64��������ȡcspָ�����
*                  -3   ����󴴽�֤��������ʧ�ܻ򴴽�hashʧ��
*                  -4   ���빫Կ��Ϣʧ��                
*                  -2001 �ڴ����mallocʧ��
*/
KII_SHB_SIGN_API int  kii_VerifySignFile(
						const char 	*strFile,
						const char  *pCert,
						int			nCert,
						const char 	*pb64SignData,	
						int			 nb64SignData);	

/*
*	kii_GetCert ���ܣ����ڴ�����ȡǩ��֤��
*
*	����˵����
*
*	pb64RetData:	 base64�����ǩ��֤��,���Ϊ��,�򷵻�֤�鳤��
*	nMaxRetSize:     ֤����󳤶�
*
*	����ֵ��         > 0	�ɹ�������֤��ĳ��ȣ�< 0 ʧ�ܣ����ش����롣
*
*	�����룺       -1	    Ŀǰû��ǩ�����޷�ȡ��ǩ��֤�顣
*/

KII_SHB_SIGN_API int  kii_GetCert(
						char 	   * pb64RetData,
						int			nMaxRetSize);


/*
*	kii_cert_getDn ���ܣ�ȡ֤������
*
*	����˵����
*
*	pCert��			 ֤�飬֧��der/base64��ʽ��
*	nCert��          ֤�鳤�ȡ�
*	strRetUTF8Dn:	 ���ص�֤��DN�����ΪNULL����������DN�ĳ��ȡ�
*	nMaxRet:		 ���ص�֤��DN����󳤶ȡ�
*
*	����ֵ��         > 0	�ɹ�������֤��DN�ĳ��ȣ�< 0 ʧ�ܣ����ش����롣
*
*	�����룺      -1	�����������ĳ������Ϊ�ա��ļ��򲻿���
*                 -2	�ڴ�ռ����mallocʧ��
*				  -3	base64����ʧ��
*				  -4	����󴴽�֤��������ʧ��
*/
KII_SHB_SIGN_API int  kii_GetCertDn(
						const char *pCert, 
						int			nCert, 
						char		*strRetUTF8Dn, 
						int			nMaxRet);


/*
*	kii_cert_getSubjectInfo  ���ܣ�ȡ֤��ָ����������
*
*	����˵����
*
*	pCert��			 ֤�飬֧��der/base64��ʽ��
*	nCert��          ֤�鳤�ȡ�
*	oidname��		 ָ�������oid����,Ŀǰֻ֧��CN,O,OU,��Сд����.
*	strRetUTF8Dn:	 ���ص�ָ��֤���������ݡ�
*	nMaxRet:		 ���ص�ָ��֤���������ݵ���󳤶ȡ�
*
*	����ֵ��     > 0	�ɹ�������ָ��֤���������ݣ�< 0  ʧ�ܣ����ش����롣
*
*	�����룺      -1	�����������ĳ������Ϊ�ա��ļ��򲻿���
*                 -2    ����֤��������ʧ��
*                 -3   oid��֧�֣�Ŀǰֻ֧��CN,O,OU��
*                 -4   strRetUTF8DnΪ�ա�
*
*/

KII_SHB_SIGN_API int  kii_GetCertSubjectInfo(
						const char *pCert, 
						int			nCert, 
						char		*oidname,
						char		*strRetUTF8Dn, 
						int			nMaxRet);

	
#ifdef __cplusplus
}
#endif

#endif /*  _KII_SHB_SIGN_H_2009061316170000 */
