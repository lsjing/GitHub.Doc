using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        NetPaySocketUtil payUitl = new NetPaySocketUtil();
        string signRet = payUitl.exeSign("127.0.0.1", 55500, "POSID=100001329&BRANCHID=500000000&ORDERID=GWA10081217305965959&PAYMENT=0.01&CURCODE=01&REMARK1=&REMARK2=&SUCCESS=Y&TYPE=1&REFERER=http://114.255.7.208/page/bankpay.do&CLIENTIP=114.255.7.194&SIGN=9a7efc7f15f4b0e7f8fba52649d6b97ae33fad44598a7ca1c26196e8ddba00ecf91a596346e4bfd3cc6d2bdba6c085a3cdb0f231d865d7856e37de89846a371c8bc09f8f2643284260499e1d3f464d9ca9d379fe8af3202a09fc83d39f5c68501a4627d62a3ae891d4b0ff6aa21d61f6ba0e9c8bc5840b292af853d2736ce04a");
        txtSignRet.Text = signRet;
    }
}
