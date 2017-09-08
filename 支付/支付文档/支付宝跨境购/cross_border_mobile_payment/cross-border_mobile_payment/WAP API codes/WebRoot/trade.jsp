<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String path = request.getContextPath();
   String basePath = request.getScheme() + "://" + request.getLocalAddr() + ":"
                              + request.getServerPort() + path + "/";
   String number= System.currentTimeMillis() + "";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
</head>
<body>


<form name="adminFrom" action="servlet/Md5Trade" method="Post">
<table width="760" style="margin: 10px auto; padding: 0px;" border="0"
	cellpadding="5" cellspacing="0">
	<tr height="30">
		<td colspan="2" align="center"><font size="12">支付请求</font></td>
	</tr>
	<tr height="20">
		<td></td>
		<td></td>
	</tr>

	<tr><td colspan="2"><b>常规参数</b><font color="red">（红色参数请根据情况自行填写）</font></td></tr>
	<tr>
		<td colspan="2">
		<hr />
		</td>
	</tr>
	<tr>
		<td width="200"><span>服务</span>
		<td><input name="service" type="text" value="create_forex_trade_wap" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span><font color="red">合作伙伴</font></span>
		<td><input name="partner" type="text" value="2088101003102763" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>参数编码字符集</span>
		<td><input name="_input_charset" type="text" value="utf-8" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>签名方式</span>
		<td><input name="sign_type" type="text" value="MD5" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span><font color="red">通知URL(公网IP才能接收通知）</font></span>
		<td><input name="notify_url" type="text" value="<%=basePath%>servlet/Md5NotifyReceiver" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span><font color="red">回调URL</font></span>
		<td><input name="return_url" type="text" value="<%=basePath%>servlet/Md5CallBack" size="50" /></td>
	</tr>
	<tr>
		<td colspan="2">
		<hr />
		</td>
	</tr>
	
	<tr><td colspan="2"><b>业务参数</b></td></tr>
	<tr>
		<td colspan="2">
		<hr />
		</td>
	</tr>

	<tr>
		<td width="200"><span>外部交易号</span>
		<td><input name="out_trade_no" type="text" value="<%=number%>" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>商品名称</span>
		<td><input name="subject" type="text" value="名称" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>商品描述</span>
		<td><input name="body" type="text" value="商品描述" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>商品外币总价</span>
		<td><input name="total_fee" type="text" value="1" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>商品人民币总价</span>
		<td><input name="rmb_fee" type="text" value="" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>外币币种</span>
		<td><input name="currency" type="text" value="USD" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>供货方</span>	 
		<td><input name="supplier" type="text" value="test" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>交易超时规则</span>	 
		<td><input name="timeout_rule" type="text" value="12h" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>外部用户ID(信任登录用)</span>
		<td><input name="out_user" type="text" value="alipay-123456" size="50" /></td>
	</tr>
	<tr>
		<td width="200"><span>未交易返回商户的地址</span>
		<td><input name="merchant_url" type="text" size="50" value="http://www.alipay.com"/></td>
	</tr>
	<tr>
		<td colspan="2">
		<hr />
		</td>
	</tr>
	<tr>
		<td></td>
		<td><input name="submit" type="submit" value="提    交 " /></td>
	</tr>
</table>
</form>
</body>
</html>