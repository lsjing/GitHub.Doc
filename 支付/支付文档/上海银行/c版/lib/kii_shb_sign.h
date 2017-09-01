/**
* kii_shb_sign 上海银行银企直联客户端签名验证接口
* Copyright (C) 2009  Koalii, Beijing China  All rights reserved.
* 
* @filename    kii_shb_sign.h
*
* @description 包括普通签名、验证普通签名等接口
*
* @author    刘辙   liuz@bjkoal.com
* @date      创建   2009.06.13 
* @modify    修改   用cryptapi实现改由openssl实现
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
*	kii_Init  初始化openssl算法
*/

KII_SHB_SIGN_API void kii_Init();

/*
*	kii_Sign  功能：对原文数据进行普通签名
*
*	参数说明：
*
*	strPfxFile：  用户pfx格式签名证书的完整路径和文件名。
*	strPfxPwd：   用户pfx格式证书的保护口令（不能为空）。
*	pOriginData:  原文数据。
*	nOriginData:  原文数据的长度。
*	pb64RetData:  base64编码后的签名数据，如果为NULL，则函数返回签名数据的长度。
*	nMaxRetSize:  签名数据的最大长度。
*
*	返回值：       > 0	成功返回签名数据的长度；< 0 失败，返回错误码。
*
*	错误码：      -1	输入参数错误（某个参数为空）
				  -1000 文件打不开
				  -1001 文件长度为0
*                 -1002	生成pkcs12结果失败，
*				  -1003	解析pfx失败，请核对文件密码
*				  -1004 签名失败
*				  -1005 载入证书错误，请检查证书数据，要求base64格式证书串，长度正确
*				  -1006 从证书中取公钥错误
*				  -1007 从证书中取主题名结果错误 
*				  -1008 证书主题名不包括指定的oid项 
*				  -1009 未定义的oid项
*				  -1010 主题名为空
*				  -1011 取oid实体错误
*				  -2000	内存错误，malloc失败
*				  -2001 base64解码错误
*				  -1006	证书不在有效期内（未生效或已过期）
*				  -1013	没有找到证书对应的私钥
*                 -1007 pkcs7签名失败
*                 -4001、-4002、-4004从pkcs7包中取签名结果失败
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
*	kii_SignFile  功能：对文件数据进行普通签名
*
*	参数说明：
*
*	strPfxFile：  用户pfx格式签名证书的完整路径和文件名。
*	strPfxPwd：   用户pfx格式证书的保护口令（不能为空）。
*	strFile:      要签名的文件完整路径及文件名。
*	pb64RetData:  base64编码后的签名数据，如果为NULL，则函数返回签名数据的长度。
*	nMaxRetSize:  签名数据的最大长度。
*
*	返回值：       > 0	成功返回签名数据的长度；< 0 失败，返回错误码。
*
*	错误码：      -1	输入参数错误（某个参数为空、文件打不开）
*                 -2	内存空间错误，malloc失败
*				  -3	将 pfx文件导入证书存储失败
*				  -4	枚举证书失败
*				  -1006	证书不在有效期内（未生效或已过期）
*				  -1013	没有找到证书对应的私钥
*                 -1007 pkcs7签名失败
*                 -4001、-4002、-4004从pkcs7包中取签名结果失败
*                               
*/

KII_SHB_SIGN_API int  kii_SignFile(
						const char  *strPfxFile, 
						const char  *strPfxPwd,	
						const char  *strFile,  
						char 	   * pb64RetData,
						int			 nMaxRetSize);


/*
*	kii_VerifySign  功能：实现对数据普通签名进行验证。
*
*	参数说明：
*
*	pOriginData:  原文数据。
*	nOriginData:  原文数据长度。
*   pCert:        base64格式签名证书。
*	nCert:		  base64格式签名证书的长度。
*	pb64SignData:  base64编码的签名数据。
*	nb64SignData:  base64编码的签名数据的长度。
*
*	返回值：       > 0	验证成功；=0 验证失败，< 0 返回错误码。
*
*	错误码：       -1	输入参数错误（某个参数为空、文件打不开）  
*				   -2   base64解码错误或取csp指针错误
*                  -3   解码后创建证书上下文失败或创建hash失败
*                  -4   导入公钥信息失败                
*                  -2001 内存错误，malloc失败
*/
KII_SHB_SIGN_API int  kii_VerifySign (
						const char *pOriginData,
						int 		nOriginData,
						const char  *pCert,
						int			nCert,
						const char 	*pb64SignData,	
						int			 nb64SignData);


/*
*	kii_VerifySignFile  功能：实现对文件普通签名进行验证。
*
*	参数说明：
*
*	strFile:	  签名的文件完整路径及文件名。
*   pCert:        base64格式签名证书。
*	nCert:		  base64格式签名证书的长度。
*	pb64SignData:  base64编码的签名数据。
*	nb64SignData:  base64编码的签名数据的长度。
*
*	返回值：       > 0	验证成功；=0 验证失败，< 0 返回错误码。
*
*	错误码：       -1	输入参数错误（某个参数为空、文件打不开）  
*				   -2   base64解码错误或取csp指针错误
*                  -3   解码后创建证书上下文失败或创建hash失败
*                  -4   导入公钥信息失败                
*                  -2001 内存错误，malloc失败
*/
KII_SHB_SIGN_API int  kii_VerifySignFile(
						const char 	*strFile,
						const char  *pCert,
						int			nCert,
						const char 	*pb64SignData,	
						int			 nb64SignData);	

/*
*	kii_GetCert 功能：从内存中提取签名证书
*
*	参数说明：
*
*	pb64RetData:	 base64编码的签名证书,如果为空,则返回证书长度
*	nMaxRetSize:     证书最大长度
*
*	返回值：         > 0	成功，返回证书的长度；< 0 失败，返回错误码。
*
*	错误码：       -1	    目前没有签名，无法取得签名证书。
*/

KII_SHB_SIGN_API int  kii_GetCert(
						char 	   * pb64RetData,
						int			nMaxRetSize);


/*
*	kii_cert_getDn 功能：取证书主题
*
*	参数说明：
*
*	pCert：			 证书，支持der/base64格式。
*	nCert：          证书长度。
*	strRetUTF8Dn:	 返回的证书DN，如果为NULL，则函数返回DN的长度。
*	nMaxRet:		 返回的证书DN的最大长度。
*
*	返回值：         > 0	成功，返回证书DN的长度；< 0 失败，返回错误码。
*
*	错误码：      -1	输入参数错误（某个参数为空、文件打不开）
*                 -2	内存空间错误，malloc失败
*				  -3	base64解码失败
*				  -4	解码后创建证书上下文失败
*/
KII_SHB_SIGN_API int  kii_GetCertDn(
						const char *pCert, 
						int			nCert, 
						char		*strRetUTF8Dn, 
						int			nMaxRet);


/*
*	kii_cert_getSubjectInfo  功能：取证书指定主题内容
*
*	参数说明：
*
*	pCert：			 证书，支持der/base64格式。
*	nCert：          证书长度。
*	oidname：		 指定主题的oid名称,目前只支持CN,O,OU,大小写均可.
*	strRetUTF8Dn:	 返回的指定证书主题内容。
*	nMaxRet:		 返回的指定证书主题内容的最大长度。
*
*	返回值：     > 0	成功，返回指定证书主题内容；< 0  失败，返回错误码。
*
*	错误码：      -1	输入参数错误（某个参数为空、文件打不开）
*                 -2    生成证书上下文失败
*                 -3   oid不支持（目前只支持CN,O,OU）
*                 -4   strRetUTF8Dn为空。
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
