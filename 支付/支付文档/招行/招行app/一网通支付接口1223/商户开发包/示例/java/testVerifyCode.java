/*********************���������ġ���֤�롱���Է�ֹ�������۸�
ע�⣺

1�����������е��ֶΣ������genMerchantCode�Ĵ��������ȫһ�¡�
   �����һ�£�����֧����תʱ�������������ݱ��۸ġ�
2���̻���Կ�����̻��Լ����õġ�
   ��������ò��裬��ο��ĵ��������̻���Կ����.doc��
*/
class testVerifyCode
{
    public static void main(String args[])
    {
        cmb.MerchantCode mc = new cmb.MerchantCode();
        String strVerifyCode = mc.genMerchantCode("KeyString","20081129","0755","000354","0011223344","12.43","�̻�����","http://www.abc.com/bankReciev","User1","User2","202.97.113.23","00000000","");
        System.out.println("������У����Ϊ��" + strVerifyCode);
    }
};
