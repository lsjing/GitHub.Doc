<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayUnlogin.aspx.cs" Inherits="BFBWeb.PayUnlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>百度钱包</title>
</head>
<body>
       <form id="form1" runat="server">
    <div>
    商品分类号: <input type="text" id="goods_category_f" value="1" runat="server" />与优惠券相关。
在创建优惠券推广计划的时候，可以指定优惠券使用的商品类型。
若订单的类型与优惠券的类型一致时，就会出相应的优惠券。
没有指定时，出用户可用的全部优惠券。取值由钱包系统分配<br/> 
商品名称: <input type="text" id="goods_name_f"   value="百付宝百发needlogin"  runat="server"/>*必填<br/> 
商品描述: <input type="text" id="goods_desc_f" value="百度百发百发百中needlogin" runat="server"/><br/>
商品在商户网站上的URL：<input type="text" id="goods_url_f"  value="https://www.baifubao.com/"  runat="server"/><br/>
单价: <input type="text" id="unit_amount_f" value="1"  runat="server"/><br/>
数量: <input type="text" id="unit_count_f" value="1"  runat="server" /><br/>
运费: <input type="text" id="transport_amount_f" value="0" runat="server"/><br/>
总金额：<input type="text" id="total_amount_f"  value="1" runat="server" />*必填，需满足：总金额 = 单价*数量+运费<br/>
买家在商户网站的用户名: <input type="text" id="buyer_sp_username_f" value="三国乐斗spusername" runat="server"/><br/>
后台通知地址(return_url): 
<input type="text" id="return_url_f"  value="http://localhost:52101/NotifyUrl.aspx" runat="server"/>*必填<br/>
前台通知地址(page_url): <input type="text" id="page_url_f" value="http://localhost:52101/PageUrl.aspx" runat="server" /><br/>
支付方式：<select id="pay_type_f"  runat="server">   
			<option value="2">网银支付（在百付宝页面上选择银行，可以不登录百付宝）</option> 
			<option value="1">余额支付（必须登录百付宝）</option>    
			<option value="3">银行网关支付（直接跳到银行的支付页面，无需登录百付宝）</option>
		   </select>*必填<br/>
默认银行的编码：<input type="text" id="bank_no_f" value="201" runat="server"/>如果支付方式是银行网关支付，则必须有值。取值范围参见接入指南附录<br/>
用户在商户端的用户ID(必须唯一)：<input type="text" id="sp_uno_f"  value="gameyu"  runat="server"/>用户在商户端的用户id或者用户名(必须在商户端唯一，用来形成快捷支付合约)<br/>
商户自定义数据：<input type="text" id="extra_f" value="用户自定义数据"  runat="server"/><br/>
  <asp:Button ID="btnSubmit" runat="server" Font-Size="Smaller"
                        OnClick="btnSubmit_Click" Text="提交" Height="25px" />
    </div>
    </form>
</body>
</html>
