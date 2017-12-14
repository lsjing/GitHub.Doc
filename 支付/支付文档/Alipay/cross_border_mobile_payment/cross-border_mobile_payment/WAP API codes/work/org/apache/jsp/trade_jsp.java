package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class trade_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");

   String path = request.getContextPath();
   String basePath = request.getScheme() + "://" + request.getLocalAddr() + ":"
                              + request.getServerPort() + path + "/";
   String number= System.currentTimeMillis() + "";

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<form name=\"adminFrom\" action=\"servlet/Md5Trade\" method=\"Post\">\r\n");
      out.write("<table width=\"760\" style=\"margin: 10px auto; padding: 0px;\" border=\"0\"\r\n");
      out.write("\tcellpadding=\"5\" cellspacing=\"0\">\r\n");
      out.write("\t<tr height=\"30\">\r\n");
      out.write("\t\t<td colspan=\"2\" align=\"center\"><font size=\"12\">支付请求</font></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr height=\"20\">\r\n");
      out.write("\t\t<td></td>\r\n");
      out.write("\t\t<td></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr><td colspan=\"2\"><b>常规参数</b><font color=\"red\">（红色参数请根据情况自行填写）</font></td></tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t<hr />\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>服务</span>\r\n");
      out.write("\t\t<td><input name=\"service\" type=\"text\" value=\"create_forex_trade_wap\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span><font color=\"red\">合作伙伴</font></span>\r\n");
      out.write("\t\t<td><input name=\"partner\" type=\"text\" value=\"2088101003102763\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>参数编码字符集</span>\r\n");
      out.write("\t\t<td><input name=\"_input_charset\" type=\"text\" value=\"utf-8\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>签名方式</span>\r\n");
      out.write("\t\t<td><input name=\"sign_type\" type=\"text\" value=\"MD5\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span><font color=\"red\">通知URL(公网IP才能接收通知）</font></span>\r\n");
      out.write("\t\t<td><input name=\"notify_url\" type=\"text\" value=\"");
      out.print(basePath);
      out.write("servlet/Md5NotifyReceiver\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span><font color=\"red\">回调URL</font></span>\r\n");
      out.write("\t\t<td><input name=\"return_url\" type=\"text\" value=\"");
      out.print(basePath);
      out.write("servlet/Md5CallBack\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t<hr />\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t<tr><td colspan=\"2\"><b>业务参数</b></td></tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t<hr />\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>外部交易号</span>\r\n");
      out.write("\t\t<td><input name=\"out_trade_no\" type=\"text\" value=\"");
      out.print(number);
      out.write("\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>商品名称</span>\r\n");
      out.write("\t\t<td><input name=\"subject\" type=\"text\" value=\"名称\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>商品描述</span>\r\n");
      out.write("\t\t<td><input name=\"body\" type=\"text\" value=\"商品描述\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>商品外币总价</span>\r\n");
      out.write("\t\t<td><input name=\"total_fee\" type=\"text\" value=\"1\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>商品人民币总价</span>\r\n");
      out.write("\t\t<td><input name=\"rmb_fee\" type=\"text\" value=\"\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>外币币种</span>\r\n");
      out.write("\t\t<td><input name=\"currency\" type=\"text\" value=\"USD\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>供货方</span>\t \r\n");
      out.write("\t\t<td><input name=\"supplier\" type=\"text\" value=\"test\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>交易超时规则</span>\t \r\n");
      out.write("\t\t<td><input name=\"timeout_rule\" type=\"text\" value=\"12h\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>外部用户ID(信任登录用)</span>\r\n");
      out.write("\t\t<td><input name=\"out_user\" type=\"text\" value=\"alipay-123456\" size=\"50\" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"200\"><span>未交易返回商户的地址</span>\r\n");
      out.write("\t\t<td><input name=\"merchant_url\" type=\"text\" size=\"50\" value=\"http://www.alipay.com\"/></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t<hr />\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td></td>\r\n");
      out.write("\t\t<td><input name=\"submit\" type=\"submit\" value=\"提    交 \" /></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
