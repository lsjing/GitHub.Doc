<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayWapNoLogin.aspx.cs" Inherits="BFBWeb.PayWapNoLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ٶ�Ǯ��</title>
</head>
<body>
          <form id="form1" runat="server">
    <div> 
��Ʒ����: <input type="text" id="goods_name_f"   value="�ٸ����ٷ�needlogin"  runat="server"/>*����<br/> 
��Ʒ����: <input type="text" id="goods_desc_f" value="�ٶȰٷ��ٷ�����needlogin" runat="server"/><br/>
��Ʒ���̻���վ�ϵ�URL��<input type="text" id="goods_url_f"  value="https://www.baifubao.com/"  runat="server"/><br/>
����: <input type="text" id="unit_amount_f" value="1"  runat="server"/><br/>
����: <input type="text" id="unit_count_f" value="1"  runat="server" /><br/>
�˷�: <input type="text" id="transport_amount_f" value="0" runat="server"/><br/>
�ܽ�<input type="text" id="total_amount_f"  value="1" runat="server" />*��������㣺�ܽ�� = ����*����+�˷�<br/>
������̻���վ���û���: <input type="text" id="buyer_sp_username_f" value="�����ֶ�spusername" runat="server"/><br/>
��̨֪ͨ��ַ(return_url): 
<input type="text" id="return_url_f"  value="http://localhost:52101/NotifyUrl.aspx" runat="server"/>*����<br/>
ǰ̨֪ͨ��ַ(page_url): <input type="text" id="page_url_f" value="http://localhost:52101/PageUrl.aspx" runat="server" /><br/>
֧����ʽ��<select id="pay_type_f"  runat="server">   
			<option value="2">����֧�����ڰٸ���ҳ����ѡ�����У����Բ���¼�ٸ�����</option> 
			<option value="1">���֧���������¼�ٸ�����</option>    
			<option value="3">��������֧����ֱ���������е�֧��ҳ�棬�����¼�ٸ�����</option>
		   </select>*����<br/>
Ĭ�����еı��룺<input type="text" id="bank_no_f" value="201" runat="server"/>���֧����ʽ����������֧�����������ֵ��ȡֵ��Χ�μ�����ָ�ϸ�¼<br/>
�û����̻��˵��û�ID(����Ψһ)��<input type="text" id="sp_uno_f"  value="gameyu"  runat="server"/>�û����̻��˵��û�id�����û���(�������̻���Ψһ�������γɿ��֧����Լ)<br/>
�̻��Զ������ݣ�<input type="text" id="extra_f" value="�û��Զ�������"  runat="server"/><br/>
  <asp:Button ID="btnSubmit" runat="server" Font-Size="Smaller"
                        OnClick="btnSubmit_Click" Text="�ύ" Height="25px" />
    </div>
    
    
    </form>
</body>
</html>
