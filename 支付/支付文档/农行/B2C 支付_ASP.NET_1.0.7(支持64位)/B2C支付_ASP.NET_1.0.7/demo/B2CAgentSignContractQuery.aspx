
<!--
/*
 * Project: BJP09001
 *
 * Description:
 *    委托扣款签约查询范例页面。
 *
 * Modify Information:
 *    Author        Date        Description
 *    ============  ==========  =======================================
 *    abchina       2011/10/10  V1.0.0 Release
 *
 */
-->
<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnButton_Click(object sender, EventArgs e)
    {

        //1、取得商户委托扣款签约查询所需要的信息
        String tAgentSignNo = AgentSignNo.Text;

        //2、生成商户委托扣款签约查询请求对象
        com.hitrust.trustpay.client.b2c.QueryAgentSignRequest tRequest = new com.hitrust.trustpay.client.b2c.QueryAgentSignRequest();
        tRequest.AgentSignNo = tAgentSignNo;  //签约号           （必要信息）

        //3、传送商户委托扣款签约查询请求并取得订单查询结果
        com.hitrust.trustpay.client.TrxResponse tResponse = tRequest.postRequest();
        StringBuilder strMessage = new StringBuilder();
        //4、判断商户委托扣款签约查询结果状态，进行后续操作
        if (tResponse.isSuccess())
        {
            //5、生成委托扣款签约对象
            com.hitrust.trustpay.client.b2c.AgentSign tAgentSign = new com.hitrust.trustpay.client.b2c.AgentSign(new com.hitrust.trustpay.client.XMLDocument(tResponse.getValue("TrxResponse")));

            strMessage.Append("AgentSignNo      = [" + tAgentSign.AgentSignNo + "]<br>");
            strMessage.Append("MerchantNo      = [" + tAgentSign.MerchantNo + "]<br>");
            strMessage.Append("CardNo      = [" + tAgentSign.CardNo + "]<br>");
            strMessage.Append("AccountType      = [" + tAgentSign.AccountType + "]<br>");
            strMessage.Append("CertificateNo      = [" + tAgentSign.CertificateNo + "]<br>");
            strMessage.Append("CertificateType      = [" + tAgentSign.CertificateType + "]<br>");
            strMessage.Append("SignStatus= [" + tAgentSign.SignStatus + "]<br>");
            strMessage.Append("SignDate      = [" + tAgentSign.SignDate + "]<br>");
            strMessage.Append("UnSignDate      = [" + tAgentSign.UnSignDate + "]<br>");

        }
        else
        {
            //7、商户委托扣款签约查询失败
            strMessage.Append("ReturnCode   = [" + tResponse.ReturnCode + "]<br>");
            strMessage.Append("ErrorMessage = [" + tResponse.ErrorMessage + "]<br>");
        }
        lblMessage.Text = strMessage.ToString();
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">

<head><title>农行网上支付平台-商户接口范例-委托扣款签约结果查询</title></head>

<body style="font-size: 14px;">
  <center>委托扣款签约结果查询</center>
  <form  name='form1' runat="server" >
  <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <table>
      <TR><TD style="width: 80px">签约协议号</TD>
          <td><asp:TextBox runat="server" ID='AgentSignNo' Text='ON200306300001' /></td>
          </TR>
      <TR>
      <td><asp:Button ID="btnButton" runat="server" Text="提交页面内容" OnClick="btnButton_Click" />
      
      </td>
      </TR>
    </table>
  </form>
  <center><a href='Merchant.html'>回商户首页</a></center>
</body>
</html>