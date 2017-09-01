<!--
/*
 * Project: EC2010
 *
 * Description:
 *    商户接口范例。
 *
 * Modify Information:
 *    Author        Date        Description
 *    ============  ==========  =======================================
 *    abchina       2010/11/02  V1.0.0 Release
 *
 */
-->

<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    string _ResponseString = "";
    protected void btnButton_Click(object sender, EventArgs e)
    {
        //1、生成订单对象
        com.hitrust.trustpay.client.b2c.Order tOrder = new com.hitrust.trustpay.client.b2c.Order();
        tOrder.OrderNo = txtOrderNo.Text;                       //设定订单编号 （必要信息）
        tOrder.ExpiredDate = int.Parse(txtExpiredDate.Text);                       //设定订单有效期 （必要信息）
        //wdy add 20100812 tiedaobu
        tOrder.BuyIP = txtBuyIP.Text;                           //IP
        tOrder.OrderDesc = txtOrderDesc.Text;                   //设定订单说明
        tOrder.OrderDate = txtOrderDate.Text;                   //设定订单日期 （必要信息 - YYYY/MM/DD）
        tOrder.OrderTime = txtOrderTime.Text;                   //设定订单时间 （必要信息 - HH:MM:SS）
        tOrder.OrderAmount = double.Parse(txtOrderAmount.Text); //设定订单金额 （必要信息）
        tOrder.OrderURL = txtOrderURL.Text;                     //设定订单网址

        //2、生成定单订单对象，并将订单明细加入定单中（可选信息）
        com.hitrust.trustpay.client.b2c.OrderItem tOrderItem = new com.hitrust.trustpay.client.b2c.OrderItem();
        tOrderItem.ProductID = txtOrderCode.Text;
        tOrderItem.ProductName = txtOrderName.Text;
        tOrderItem.UnitPrice = double.Parse(txtInsureOrderAmount.Text);
        tOrderItem.Qty = 1;
        tOrder.addOrderItem(tOrderItem);
        tOrderItem = new com.hitrust.trustpay.client.b2c.OrderItem();
        tOrderItem.ProductID = txtOrderCode.Text + "1";
        tOrderItem.ProductName = txtOrderName.Text + "1";
        tOrderItem.UnitPrice = double.Parse(txtInsureOrderAmount.Text);
        tOrderItem.Qty = 2;
        tOrder.addOrderItem(tOrderItem);

        //3、生成支付请求对象
        com.hitrust.trustpay.client.b2c.PaymentRequest tPaymentRequest = new com.hitrust.trustpay.client.b2c.PaymentRequest();
        tPaymentRequest.Order = tOrder;                             //设定支付请求的订单 （必要信息）
        tPaymentRequest.ProductType = txtProductType.Text;          //设定商品种类 （必要信息）
        tPaymentRequest.PaymentType = txtPaymentType.Text;          //设定支付类型
        tPaymentRequest.NotifyType = txtNotifyType.Text;            //设定支付结果通知类型
        tPaymentRequest.ResultNotifyURL = txtResultNotifyURL.Text;  //设定支付结果回传网址 （必要信息）
        tPaymentRequest.MerchantRemarks = txtMerchantRemarks.Text;  //设定商户备注信息
        tPaymentRequest.PayLinkType = txtPaymentLinkType.Text;      //设定支付接入方式
        //PaymentRequest.PAY_LINK_TYPE_NET;1:internet网络接入   
        //PaymentRequest.PAY_LINK_TYPE_TEL;2:手机网络接入
        //PaymentRequest.PAY_LINK_TYPE_TV;3:数字电视网络接入
        //PaymentRequest.PAY_LINK_TYPE_IC;4:智能客户端
        //PaymentRequest.PAY_LINK_TYPE_MOBILE;5:电话网络


        //
        com.hitrust.trustpay.client.b2c.Insure tInsure = new com.hitrust.trustpay.client.b2c.Insure();
        tInsure.Type = int.Parse(ddlInsureType.SelectedValue);
        if (tInsure.Type == com.hitrust.trustpay.client.b2c.Insure.INSURE_TYPE_FINANCING)
            tInsure.Furl = txtFurl.Text;

        com.hitrust.trustpay.client.b2c.InsureOrder tInsureOrder = new com.hitrust.trustpay.client.b2c.InsureOrder();

        com.hitrust.trustpay.client.b2c.InsureOrderItem tInsureOrderItem = new com.hitrust.trustpay.client.b2c.InsureOrderItem();
        tInsureOrderItem.Category = txtOrderCategory.Text;
        tInsureOrderItem.Code = txtOrderCode.Text;
        tInsureOrderItem.Mode = txtOrderMode.Text;
        tInsureOrderItem.Name = txtOrderName.Text;
        tInsureOrderItem.Amount = double.Parse(txtInsureOrderAmount.Text);
        tInsureOrder.addOrderItem(tInsureOrderItem);

        tInsureOrderItem = new com.hitrust.trustpay.client.b2c.InsureOrderItem();
        tInsureOrderItem.Category = txtOrderCategory.Text + "1";
        tInsureOrderItem.Code = txtOrderCode.Text + "1";
        tInsureOrderItem.Mode = txtOrderMode.Text + "1";
        tInsureOrderItem.Name = txtOrderName.Text + "1";
        tInsureOrderItem.Amount = double.Parse("1" + txtInsureOrderAmount.Text);
        tInsureOrder.addOrderItem(tInsureOrderItem);

        tInsure.Order = tInsureOrder;

        if (tInsure.Type == com.hitrust.trustpay.client.b2c.Insure.INSURE_TYPE_FINANCING || tInsure.Type == com.hitrust.trustpay.client.b2c.Insure.INSURE_TYPE_APPOINTED)
        {
            com.hitrust.trustpay.client.b2c.InsureUser tInsureUser = new com.hitrust.trustpay.client.b2c.InsureUser();
            tInsureUser.CardNo = txtUserCardNo.Text;
            tInsureUser.CertificateNo = txtUserCertificateNo.Text;
            tInsureUser.CertificateType = ddlUserCertificateType.SelectedValue;
            tInsureUser.Name = txtUserName.Text;

            tInsure.User = tInsureUser;
        }

        tPaymentRequest.Insure = tInsure;

        _ResponseString = "";
        try
        {
            string tSignature = HttpUtility.HtmlEncode(tPaymentRequest.genSignature(1));
            string sTrustPayIETrxURL = com.hitrust.trustpay.client.MerchantConfig.TrustPayIETrxURL;
            string sErrorUrl = txtFurl.Text;

            form1.Visible = false;
            _ResponseString = "<form name=\"form2\" method=\"post\" action=\"" + sTrustPayIETrxURL + "\"> \r\n" +
                                "<input type=\"hidden\" name=\"Signature\" value=\"" + tSignature + "\"> \r\n" +
                                "<input type=\"hidden\" name=\"errorPage\" value=\"" + sErrorUrl + "\"> \r\n" +
                                "<input type=\"submit\" value=\"提交\"></form><br/> \r\n" +
                                "<a href='MerchantPaymentInsureIE.aspx'>回商户首页</a> \r\n";
        }
        catch (com.hitrust.trustpay.client.TrxException ex)
        {
            form1.Visible = false;
            _ResponseString = "<center><br/> \r\n" +
                    "ReturnCode   = [" + ex.Code + "]<br/> \r\n" +
                    "ErrorMessage = [" + ex.Message + "]<br/><br/> \r\n" +
                    "<a href='MerchantPaymentInsureIE.aspx'>回商户首页</a></center> \r\n";
        }
    }

    protected void ddlInsureType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInsureType.SelectedValue == "1")
        {
            tblFurl.Visible = false;
            tblUser.Visible = false;
            tblCard.Visible = false;
        }
        else if (ddlInsureType.SelectedValue == "2")
        {
            tblFurl.Visible = true;
            tblUser.Visible = true;
            tblCard.Visible = true;
        }
        else if (ddlInsureType.SelectedValue == "3")
        {
            tblFurl.Visible = false;
            tblUser.Visible = false;
            tblCard.Visible = true;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtOrderNo.Text = "WDYEC2010" + DateTime.Now.Ticks.ToString();
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>农行网上支付平台-商户接口范例-支付请求</title>
   <script language="javascript" type="text/javascript">
    function validate()
   {
        var ExpiredDate=document.getElementById('txtExpiredDate').value; 
        if(ExpiredDate=="undefined" || ExpiredDate=="" || ExpiredDate==null)
        {
                  alert("订单有效期不能为空");
                  return false;
        }   
        if((/^[0-9]*[1-9][0-9]*$/).test(ExpiredDate)==false )
        {
                 alert("订单有效期应为正整数");
                 return false;
        }

        var  OrderAmount =document.getElementById('txtOrderAmount').value;  
        if((/^\-?\d+\.?\d*$/).test(OrderAmount) ==false)
        {
              alert("订单金额输入不正确");
              return false;
        }
        
        var InsureOrderAmount =document.getElementById('txtInsureOrderAmount').value;  
        if((/^\-?\d+\.?\d*$/).test(InsureOrderAmount) ==false)
        {
              alert("投保金额输入不正确");
              return false;
        }
   } 
   </script>  
</head>
<body style="font-size: 14px;">
    <center>
        支付请求</center>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="red"></asp:Label>
        <br />
        <table>
            <tr>
                <td width="150px">
                    OrderNo
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderNo' Text='ON200412230001' /></td>
            </tr>
            <tr>
                <td width="150px">
                    ExpiredDate
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtExpiredDate' Text='30' /></td>
            </tr>
            <tr>
                <td>
                    BuyIP
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtBuyIP' Text='' /></td>
            </tr>
            <tr>
                <td>
                    OrderDesc
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderDesc' Text='Game Card Order' /></td>
            </tr>
            <tr>
                <td>
                    OrderDate
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderDate' Text='2004/12/23' />（YYYY/MM/DD）</td>
            </tr>
            <tr>
                <td>
                    OrderTime
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderTime' Text='11:55:30' />（HH:MM:SS）</td>
            </tr>
            <tr>
                <td>
                    OrderAmount
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderAmount' Text='2' /></td>
            </tr>
            <tr>
                <td>
                    OrderURL
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderURL' Text='http://127.0.0.1/Merchant/MerchantQueryOrder.aspx?ON=ON200412230001&DetailQuery=1' /></td>
            </tr>
            <tr>
                <td>
                    ProductType
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtProductType' Text='1' /></td>
            </tr>
            <tr>
                <td>
                    PaymentType
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtPaymentType' Text='1' />1：农行卡支付 2：国际卡支付 3：农行贷记卡支付
                    A：支付方式合并 5：第三方跨行支付</td>
            </tr>
            <tr>
                <td>
                    PaymentLinkType
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtPaymentLinkType' Text='1' />1：internet网络接入 2：手机网络接入
                    3:数字电视网络接入 4:智能客户端 5:电话网络</td>
            </tr>
            <tr>
                <td>
                    NotifyType
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtNotifyType' Text='0' />0：URL页面通知 1：服务器通知</td>
            </tr>
            <tr>
                <td>
                    ResultNotifyURL</td>
                <td>
                    <asp:TextBox runat="server" ID='txtResultNotifyURL' Text='http://127.0.0.1/Merchant/MerchantResult.asp' /></td>
            </tr>
            <tr>
                <td>
                    MerchantRemarks</td>
                <td>
                    <asp:TextBox runat="server" ID='txtMerchantRemarks' Text='Hi!' /></td>
            </tr>
            <tr>
                <td>
                    Type</td>
                <td>
                    <asp:DropDownList ID="ddlInsureType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlInsureType_SelectedIndexChanged">
                        <asp:ListItem Value="1">一般支付</asp:ListItem>
                        <asp:ListItem Value="2">理财支付</asp:ListItem>
                        <asp:ListItem Value="3">指定支付</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    保险名称
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderName' Text="my保险名称" /></td>
            </tr>
            <tr>
                <td>
                    投保金额
                </td>
                <td>
                    <asp:TextBox runat="server" ID='txtInsureOrderAmount' Text='10.02' /></td>
            </tr>
            <tr>
                <td>
                    保险代码</td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderCode' Text='Hj2387' /></td>
            </tr>
            <tr>
                <td>
                    险种信息</td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderCategory' Text='xz' /></td>
            </tr>
            <tr>
                <td>
                    销售方式</td>
                <td>
                    <asp:TextBox runat="server" ID='txtOrderMode' Text='销售方式' /></td>
            </tr>
        </table>
        <table id="tblFurl" runat="server" visible="false">
            <tr>
                <td width="150px">
                    Furl</td>
                <td>
                    <asp:TextBox runat="server" ID='txtFurl' Text='http://10.232.56.106/ecclient/IE/MerchantInsureFailure.aspx' /></td>
            </tr>
        </table>
        <table id="tblUser" runat="server" visible="false">
            <tr>
                <td width="150px">
                    姓名
                </td>
                <td style="width: 158px">
                    <asp:TextBox runat="server" ID='txtUserName' Text='wdy' /></td>
            </tr>
            <tr>
                <td>
                    证件类型</td>
                <td style="width: 158px">
                    <asp:DropDownList ID="ddlUserCertificateType" runat="server">
                        <asp:ListItem Value="I" Selected="True">公民身份证</asp:ListItem>
                        <asp:ListItem Value="P">中国护照</asp:ListItem>
                        <asp:ListItem Value="S">军人身份证</asp:ListItem>
                        <asp:ListItem Value="J">警官证</asp:ListItem>
                        <asp:ListItem Value="K">户口簿</asp:ListItem>
                        <asp:ListItem Value="T">临时身份证</asp:ListItem>
                        <asp:ListItem Value="F">外国护照</asp:ListItem>
                        <asp:ListItem Value="D">港澳通行证</asp:ListItem>
                        <asp:ListItem Value="W">台胞通行证</asp:ListItem>
                        <asp:ListItem Value="R">离休干部荣誉证</asp:ListItem>
                        <asp:ListItem Value="B">军官退休证</asp:ListItem>
                        <asp:ListItem Value="A">文职干部退休证</asp:ListItem>
                        <asp:ListItem Value="C">军事院校学员证</asp:ListItem>
                        <asp:ListItem Value="E">武装警察身份证</asp:ListItem>
                        <asp:ListItem Value="G">军官证</asp:ListItem>
                        <asp:ListItem Value="H">文职干部证</asp:ListItem>
                        <asp:ListItem Value="L">军人士兵证</asp:ListItem>
                        <asp:ListItem Value="M">武警士兵证</asp:ListItem>
                        <asp:ListItem Value="U">其他证件</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                    证件号码</td>
                <td style="width: 158px">
                    <asp:TextBox runat="server" ID='txtUserCertificateNo' Text='350624560911051' /></td>
            </tr>
        </table>
        <table id="tblCard" runat="server" visible="false">
            <tr>
                <td style="width: 150px">
                    银行卡号</td>
                <td>
                    <asp:TextBox runat="server" ID='txtUserCardNo' Text='9559980320011745819' /></td>
            </tr>
        </table>
        <table>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnButton" runat="server" Text="提交页面内容" OnClick="btnButton_Click"  OnClientClick="return validate();"/>
                    <a href='../Merchant.html'>回商户首页</a>
                </td>
            </tr>
        </table>
    </form>
    <%=_ResponseString %>
</body>
</html>
