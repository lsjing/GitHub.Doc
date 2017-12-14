// testmerchant.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "testmerchant.h"
#include "firmclientAPI.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// The one and only application object

CWinApp theApp;

using namespace std;
INET_STATUS test(LPCSTR date1,LPCSTR date2)
{
	PageReset();
	char *pg;
	INET_STATUS r;
	puts("result:");
	do {
		r=QuerySettledOrderByPage(date1,date2,100,&pg);
		if (r!=INET_SUCCESS) return r;
		puts(pg);
		FreeBuffer(pg);
		if (HasNextPage()) {
			char ans[2];
			puts("We have more data. continue?");
			gets(ans);
			if (*ans=='n') break;
		} else break;
	}while (1);
	return r;
}
INET_STATUS test1()
{
	char *pg;
	INET_STATUS r;
	r=QueryUnsettledOrder(&pg);
	if (r!=INET_SUCCESS) return r;
	puts("Result:");
	puts(pg);
	FreeBuffer(pg);
	return r;
}
int _tmain(int argc, TCHAR* argv[], TCHAR* envp[])
{
	int nRetCode = 0;
	
	// initialize MFC and print and error on failure
	if (!AfxWinInit(::GetModuleHandle(NULL), NULL, ::GetCommandLine(), 0))
	{
		// TODO: change error code to suit your needs
		cerr << _T("Fatal Error: MFC initialization failed") << endl;
		return 1;
	}
	if (argc<=4) {
		puts("args: branch cono password date1 date2");
		return 1;
	}
	INET_STATUS r;
	SetOptions(argv[1]);
	if ((r=LoginC(argv[2],argv[3],argv[4]))!=INET_SUCCESS) {
		Logout();
		printf("Login failured! %s\n",GetLastErr(r));
		return 0;
	}
	
	if (argc<7 && (r=test1())!=INET_SUCCESS) printf("download failed with\n%s\n",GetLastErr(r));
	if (argc==7 && (r=test(argv[5],argv[6]))!=INET_SUCCESS) printf("download failed with\n%s\n",GetLastErr(r));
	
	Logout();
	
	return 0;
}


