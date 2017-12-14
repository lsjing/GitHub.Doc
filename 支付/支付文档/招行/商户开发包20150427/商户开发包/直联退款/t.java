import java.lang.*;
import cmb.netpayment.Settle;
import java.io.*;
class t {
    public static void main(String args[])
    {
        Settle settle;
        settle=new Settle();
    	settle.SetOptions("netpay.cmbchina.com");
    	int iRet = settle.LoginC("0571","001111","111111");
    	if (iRet == 0)
		{
			System.out.println("LoginC ok");
	    }
    	else
		{
			System.out.println(settle.GetLastErr(iRet));
			return;
		}
        iRet = settle.RefundOrder("20050607","004003","0.1","test","1115");
        if (iRet == 0) {
          System.out.println("Refund Order ok");
        }
        else {
          System.out.println(settle.GetLastErr(iRet));
          return;
        }

        settle.Logout();
    }
}
