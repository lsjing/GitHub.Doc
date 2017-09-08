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
        DCOM_CMBLib.FirmClientClass fm = new DCOM_CMBLib.FirmClientClass();
        fm.exSetOptions("payment.ebank.cmbchina.com","");
        short r = fm.exLoginC("0755", "000001", "aaaaaa");
        Label1.Text = fm.exGetLastErr(r);
    }
}
