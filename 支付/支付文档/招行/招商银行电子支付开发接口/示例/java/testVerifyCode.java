/*********************���������ġ���֤�롱���Է�ֹ�������۸�
 * ����ԭ��
    public static String genMerchantCode(String strKey, String strDate, 
String strBranchID, String strCono,String strBillNo, 
String strAmount,String strMerchantPara, String strMerchantUrl, 
String strPayerID,String strPayeeID, String strClientIP, String strGoodsType, String strReserved)
*/
class testVerifyCode
{
    public static void main(String args[])
    {
        cmb.MerchantCode mc = new cmb.MerchantCode();
        

cmb.MerchantCode mc = new cmb.MerchantCode();
	        String strVerifyCode = cmb.MerchantCode.genMerchantCode("�̻���Կ","20130530","0021","000000","000013","0.01","pam","http://localhost/testPay1/Default.aspx", "", "","","","");
    }
};
