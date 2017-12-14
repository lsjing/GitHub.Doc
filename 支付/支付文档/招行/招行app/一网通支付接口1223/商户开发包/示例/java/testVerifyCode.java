/*********************产生定单的“验证码”，以防止定单被篡改
注意：

1、定单中所有的字段，必须和genMerchantCode的传入参数完全一致。
   如果不一致，会在支付跳转时报错：“定单内容被篡改”
2、商户秘钥，是商户自己设置的。
   具体的设置步骤，请参考文档《设置商户密钥方法.doc》
*/
class testVerifyCode
{
    public static void main(String args[])
    {
        cmb.MerchantCode mc = new cmb.MerchantCode();
        String strVerifyCode = mc.genMerchantCode("KeyString","20081129","0755","000354","0011223344","12.43","商户参数","http://www.abc.com/bankReciev","User1","User2","202.97.113.23","00000000","");
        System.out.println("产生的校验码为：" + strVerifyCode);
    }
};
