/*********************产生定单的“验证码”，以防止定单被篡改
 * 函数原型
    public String genMerchantCode(String key,String strDate,String strBranchID,
          String strCono,
		  String strBillNo,String strAmount,String strMerchantPara,
		  String strMerchantUrl)
*/
class testVerifyCode
{
    public static void main(String args[])
    {
        cmb.MerchantCode mc = new cmb.MerchantCode();
        String strVerifyCode = mc.genMerchantCode("KeyString","20081129","0571","002696","0011223344","12.43","商户参数","https://www.alipay.com/bankReciev","User1","User2","202.97.113.23","00000000","");
        System.out.println("产生的校验码为：" + strVerifyCode);
    }
};
