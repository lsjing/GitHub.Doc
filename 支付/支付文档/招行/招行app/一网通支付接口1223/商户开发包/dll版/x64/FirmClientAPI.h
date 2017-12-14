////////////////////////////////////////////////////////////////////////////////////
//FirmClientAPI.h
//This is head file of FirmClientAPI.lib and FirmClient.dll
//Copyright (C) 1997-2000 China Menchants Bank
//All right reserved
//Oct.13,1998   by Bill Sharely
////////////////////////////////////////////////////////////////////////////////////
/*
Usage:
  A.Use as Dll:
	If you want to use the FirmClient module as Dll,you should complete
	the following steps:
		1. Copy the file named FirmClient.dll to your system directory.
			On Windows 95/98/NT/2000/XP,the system directory is <WinRoot>\system32.
		2. If your program language is C or C++,please
			. Declear a HMODULE variable;
			. Invoke system function ::LoadLibrary to load this Dll;
			. Declear function points which point the functions you need;
			. Invoke system functin ::GetProcAddress to get the address of function points;
			. Use the function points to call corresponding functions;
			. After completing your task,Invoke system function ::FreeLibrary to release FirmClient.dll.
		3. If your program language is NOT C or C++,such as VB,Java,etc,please
			see the specific language's document on how to use Dll.
  B.Use as Lib
	If you want to use the FirmClient module as Lib,your program language must be C or C++
	and complet the following steps:
		1. Copy the file named FirmClient.dll to your system directory.
			On Windows 95/98/NT,the system directory is <WinRoot>\system32.
		2. Include the head file FirmClientAPI.h in your .c or .cpp file;
		3. Tell your C or C++ linker where to find FirmClient.lib;
		4. Call functions listed in FirmClientAPI.h to complet your task.
*/
////////////////////////////////////////////////////////////////////////////////////
/*
Samples:
  A.Use as DLL(For C or C++)
	void SampleFun()
	{
		HMODULE hDllModule;
		int (*pLoginC)(char*,char*,char*);
		int (*pSetOptions)(char*,char*,char*);
		int (*pLogout)();
		int (*pSettlePartOrder)(char*,char*,char*,char*);
		int (*pSettleOrder)(char*,char*,char*);
		int (*pQuerySettledOrder)(char*,char*,char**);
		int (*pQueryUnsettledOrder)(char**);
		int (*pFreeBuffer)(char*);
		char* (*pGetLastErr)(int);

		hDllModule=::LoadLibrary("FirmClient.dll");
		if(hDllModule == NULL)
		{
			return;
		}

		char* pErr;
		pSetOptions=(int (*)(char*,char*,char*))::GetProcAddress(hDllModule,"SetOptions");
		pLoginC=(int (*)(char*,char*,char*))::GetProcAddress(hDllModule,"LoginC");
		pLogout=(int (*)())::GetProcAddress(hDllModule,"Logout");
		pSettleOrder=(int (*)(char*,char*,char*))::GetProcAddress(hDllModule,"SettleOrder");
		pSettlePartOrder=(int (*)(char*,char*,char*,char*))::GetProcAddress(hDllModule,"SettlePartOrder");
		pQuerySettledOrder=(int (*)(char*,char*,char**))::GetProcAddress(hDllModule,"QuerySettledOrder");
		pQueryUnsettledOrder=(int (*)(char**))::GetProcAddress(hDllModule,"QueryUnsettledOrder");
		pFreeBuffer=(int (*)(char*))::GetProcAddress(hDllModule,"FreeBuffer");
		pGetLastErr=(char* (*)(int))::GetProcAddress(hDllModule,"GetLastErr");

		if(pSetOptions == NULL)
		{
			::FreeLibrary(hDllModule);
			return;
		}

		int nRet=(*pSetOptions)("www.cmbchina.com",NULL,NULL);
		pErr = pGetLastErr(nRet);

		if(pLoginC == NULL)
		{
			::FreeLibrary(hDllModule);
			return;
		}

		nRet=(*pLoginC)("0755","000107","888888");
		if(nRet != 0)
		{
			pErr = pGetLastErr(nRet);
			AfxMessageBox(pErr);
			::FreeLibrary(hDllModule);
			return;
		}

		if(pQuerySettledOrder != NULL)
		{
			int nRet;
			char* pBuf;
			nRet=(*pQuerySettledOrder)("20010801","20010831",&pBuf);

			if(nRet != 0)
			{
				pErr = pGetLastErr(nRet);
			}
			else
			{
				//Any code to operate settled order information by pBuf
				pFreeBuffer(pBuf);
			}
		}

		if(pQueryUnsettledOrder != NULL)
		{
			int nRet;
			char* pBuf;
			nRet=(*pQueryUnsettledOrder)(&pBuf);

			if(nRet != 0)
			{
				pErr = pGetLastErr(nRet);
			}
			else
			{
				//Any code to operate unsettled order information by pBuf,such as settle order,cancel order,part settle order
				pFreeBuffer(pBuf);
			}
		}

		if(pLogout != NULL)
		{
			int nRet=(*pLogout)();
			pErr = pGetLastErr(nRet);
		}

		::FreeLibrary(hDllModule);
}

  B.Use as Lib(For C or C++ only)
	#include "FirmClientAPI.h"
	  
	void SampleFunc()
	{
		INET_STATUS isRet;
		char* pErr;
	
		isRet = SetOptions("www.cmbchina.com",NULL,NULL);
		if(isRet != INET_SUCCESS)
		{
			pErr = GetLastErr(isRet);
			return;
		}

		isRet = LoginC("0755","000107","017675");
		if(isRet != INET_SUCCESS)
		{
			pErr = GetLastErr(isRet);
			return;
		}

		char* pBuf;
		isRet=QuerySettledOrder("20010801","20010831",&pBuf);

		if(isRet != 0)
		{
			pErr = GetLastErr(isRet);
		}
		else
		{
			//Any code to operate settled order information by pBuf
			FreeBuffer(pBuf);
		}

		isRet=QueryUnsettledOrder(&pBuf);
		if(isRet != 0)
		{
			pErr = GetLastErr(isRet);
		}
		else
		{
			//Any code to operate unsettled order information by pBuf,such as settle order,cancel order,part settle order
			FreeBuffer(pBuf);
		}
		
		isRet = Logout();
		if(isRet != INET_SUCCESS)
		{
			pErr = GetLastErr(isRet);
			return;
		}
	}
*/
////////////////////////////////////////////////////////////////////////////////////

#if !defined(FIRMCLIENT_H)
#define FIRMCLIENT_H

enum INET_STATUS
{
	INET_SUCCESS,
	INET_COMMUNICATION_FAILURE,
	INET_ALREADY_LOGIN,
	INET_NOT_LOGIN,
	INET_LOGIN_FAILURE,
	INET_LOGOUT_FAILURE,
	INET_INPUTPARA_ERROR,
	INET_CANNOT_QUERYONEORDER,
	INET_CANNOT_QUERYSETTLEDORDER,
	INET_CANNOT_QUERYSINGLEORDER,
	INET_CANNOT_QUERYCOUNT,
	INET_CANNOT_QUERYUNSETTLEDORDER,
	INET_CANNOT_SETTLEORDER,
	INET_CANNOT_FIND_PUBLICKEYFILE,
	INET_MESSAGE_UNTRUTHFUL,
	INET_CANNOT_QUERYREFUND,
	INET_CANNOT_REFUND,
	INET_UNKOWN_FAILURE
};

//This function must be invoked first to set Web server and proxy properties.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS SetOptions(
		char* pszHttpServer,				//Input.Web server name.For example,"www.cmbchina.com"
		char* pszPort = NULL,				//Input.Web server port.The default HTTP port is 80.
		char* pszProxyIP = NULL);			//Input.Proxy server IP address if you connect to Internet through proxy,otherwise NULL or ""
														   
//This function should be invoked to login.Only you have loged in successfully,direct connecting functions below may be called.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
//Note:If the bank you opened an account in has no individual web server,you must call this function.In this case,you can NOT call Login().
//If you don't know whether your bank has individual web server,please ask administrator of bank.
//Recommended.
extern "C" __declspec(dllexport) INET_STATUS LoginC(
		char* pszBranchID,					//Input.ID of bank.Please get it from administrator of bank
		char* pszCoNo,						//Input.Firm ID,6 characters
		char* pszPwd);						//Input.Password

//When you complete task,this function should be invoked.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS Logout();

//Get settled order information.The span of date can not beyond ONE month.
//Note:The information saved in pszBuf is made up of continuous order records.After calling this function,
//you must call FreeBuffer() to free the memory allocated by this function.
//	Every order record has following parts:
//		Transaction date-----------"yyyymmdd"
//		Processed date-------------"yyyymmdd"
//		Amount---------------------"*****.**"
//		Bill No.-------------------6 characters
//		Bill status----------------1 characters
//	Every part is separated by '\n'.The bill status="0" means settled,"1" means canceled,"2" means part settled.
//	For example,returned information may be "19980820\n19980920\n1200.00\n100201\n1\n19980830\n19980830\n200.00\n100201\n2\n".
//	This information includes two order information records.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS QuerySettledOrder(
		char*  pszBeginDate,				//Input.Date of beginning
		char*  pszEndDate,					//Input.Date of end
		char** ppszBuf);					//Output.To save settled orders' information
extern "C" __declspec(dllexport) INET_STATUS QuerySettledOrderSQ(
		char*  pszBeginDate,				//Input.Date of beginning
		char*  pszEndDate,					//Input.Date of end
		char** ppszBuf);					//Output.To save settled orders' information


//Get single order information.
//Note:The information saved in pszBuf is made up of continuous order records.After calling this function,
//you must call FreeBuffer() to free the memory allocated by this function.
//	Every order record has following parts:
//		Transaction date-----------"yyyymmdd"
//		Processed date-------------"yyyymmdd"
//		Bill status----------------1 characters  0－已结帐，1－已撤销，2－部分结帐，3－退款，4－未结帐，5-无效状态，6－未知状态
//		Amount---------------------"*****.**"
//		Precedded Amount---------------------"*****.**"  (only valid for  part check-out, when bill status is 2)

//	Every part is separated by '\n'.The bill status="0" means settled,"1" means canceled,"2" means part settled.
//	For example,returned information may be "19980820\n19980920\n1200.00\n100201\n1\n19980830\n19980830\n200.00\n100201\n2\n".
//	This information includes two order information records.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS QuerySingleOrder(
		char*  pszDate,				//Input.Date of the bill
		char*  pszBillNo,					//Input.billno to query
		char** ppszBuf);					//Output.To save single orders' information

extern "C" __declspec(dllexport) INET_STATUS QuerySingleOrderSpecial(
		char*  pszDate,				//Input.Date of the bill
		char*  pszBillNo,					//Input.billno to query
		char** ppszBuf);					//Output.To save single orders' information
//Get unsettled order information.
//Note:The information saved in pszBuf is made up of continuous order records.After calling this function,
//you must call FreeBuffer() to free the memory allocated by this function.
//	Every order record has following parts:
//		Transaction date-----------"yyyymmdd"
//		Amount---------------------"*****.**"
//		Bill No.-------------------6 characters
//		Reference No.--------------20 characters
//	Every part is separated by '\n'.
//	For example,returned information may be "19980820\n1200.00\n100201\n98082000010700030001\n19980830\n200.00\n100201\n98083000010700030009\n".
//	This information includes two order information records.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS QueryUnsettledOrder(
		char** ppszBuf);						//Output.To save unsettled orders' information

//Settle one order.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS SettleOrder(
		char* pszCoNo,						//Input.Firm ID
		char* pszBillNo,					//Input.Order bill No.
		char* pszRefNo);					//Input.Reference No.This item can be gotten by calling QueryUnsettledOrder

//Settle part of order.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS SettlePartOrder(
		char* pszCoNo,						//Input.Firm ID
		char* pszBillNo,					//Input.Order bill No.
		char* pszRefNo,						//Input.Reference No.This item can be gotten by calling QueryUnsettledOrder
		char* pszPartAmount);				//Input.Part amount of this order.The part amount can NOT be larger than the original value.

//Cancel one order.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS CancelOrder(
		char* pszCoNo,						//Input.Firm ID
		char* pszBillNo,					//Input.Order bill No.
		char* pszRefNo);					//Input.Reference No.This item can be gotten by calling QueryUnsettledOrder

//Check whether the notice message from bank is trusted or not.
//This function may be evoked alone.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS CheckInfoFromBank(
		char* pszPublickeyFilePath,			//Input.Pathname of Publickey file like "C:\\PubKey\\CMBPK.key"
		char* pszMsg);						//Input.Message sent from bank like "Succeed=..&BillNo=..&Amount=..&Date=..&Msg=..&signature=.."

//Check whether the signature message from bank is trusted or not.
//This function may be evoked alone.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS CheckSignatureFromBank(
		char* pszPublickeyFilePath,			//Input.Pathname of Publickey file like "C:\\PubKey\\CMBPK.key"
		char* pszData,         //Data needed to check signature 
		char* pszSignature);   //Signature of Data
		
//Free the memory which is allocated by QuerySettledOrder or QueryUnsettledOrder
//Note:After you invoked QuerySettledOrder or QueryUnsettledOrder,you MUST call this function to
//free the memory.Or your system will produce Memory leak.
//Retuen:INET_STATUS,indicates whether the calling is success or failed.
extern "C" __declspec(dllexport) INET_STATUS FreeBuffer(
		LPCSTR pBuffer);						//Input.Memory allocated by QuerySettledOrder or QueryUnsettledOrder

//Get last error message.
//This function should be invoked after every unsuccessfully calling to get error message.
//Return:A point to a char string describes error message.
extern "C" __declspec(dllexport) char* GetLastErr(
		INET_STATUS isNo);				//Input.The returned INET_STATUS variable of last calling

extern "C" __declspec(dllexport) INET_STATUS QueryUnsettledOrderByPage(int count,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS QuerySettledOrderByPage(LPCSTR pstrBeginDate,LPCSTR pstrEndDate,int count,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS QuerySettledOrderByPageSQ(LPCSTR pstrBeginDate,LPCSTR pstrEndDate,int count,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS QueryTransactByPage(LPCSTR pstrDate,int count,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS QueryTransactByPageSQ(LPCSTR pstrDate,int count,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS QuerySettledOrderBySettleDateByPage(LPCSTR pstrBeginDate,LPCSTR pstrEndDate,int count,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS QuerySettledOrderBySettleDateByPageSQ(LPCSTR pstrBeginDate,LPCSTR pstrEndDate,int count,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS QuerySettledOrderBySettleDate(LPCSTR pstrBeginDate,LPCSTR pstrEndDate,char** ppszBuf);
extern "C" __declspec(dllexport) INET_STATUS QuerySettledOrderBySettleDateSQ(LPCSTR pstrBeginDate,LPCSTR pstrEndDate,char** ppszBuf);
extern "C" __declspec(dllexport) int HasNextPage();
extern "C" __declspec(dllexport) void PageReset();
extern "C" __declspec(dllexport) INET_STATUS QueryTransact(char* pszDate,char** ppszBuf);
extern "C" __declspec(dllexport) INET_STATUS QueryTransactSQ(char* pszDate,char** ppszBuf);
extern "C" __declspec(dllexport) LPSTR GenMerchantCode(const char* pszKey,
			const char* pszDate,const char* pszBranchID,
			const char* pszCono,const char* pszBillNo,const char* pszAmount,
			const char* pszMerchantPara,const char* pszMerchantUrl,
			const char* pszPayerID, const char* pszPayeeID,
			const char* pszIP, const char* pszGoodType, const char* pszReserved,
			char *buf);
extern "C" __declspec(dllexport) INET_STATUS QueryRefundByPage(LPCSTR pstrBeginDate,LPCSTR pstrEndDate,int count,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS QueryRefund(LPCSTR pstrBeginDate,LPCSTR pstrEndDate,char** ppbuf);
extern "C" __declspec(dllexport) INET_STATUS RefundOrder(LPCSTR pszDate,LPCSTR pszBillNo, LPCSTR pszAmount,
			LPCSTR pszDesc, LPCSTR pszKey);
#endif // !defined(FIRMCLIENT_H)