using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Sandlife;

public partial class SignDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Sandlife.Sandlife sand = new Sandlife.Sandlife();
        /// <summary>
        /// 签名
        /// </summary>
        /// <param name="content">待签名字符串</param>
        /// <param name="bn">商户号</param>
        /// <param name="PfxPath">证书文件全路径名</param>
        /// <param name="PfxPass">证书密码</param>
        /// <param name="input_charset">编码格式</param>
        /// <returns>签名后字符串</returns>
        ///  public string sign(string content,string bn,string PfxPath,string PfxPass,string input_charset)
        //string str = sand.sign("version=版本号&merId=商户号&orderId=订单号&orderTime=订单时间&commodities=商品信息&dispatchAmt=配送费用&orderAmt=订单总额&notifyUrl=回调url地址&remark=备注信息&backUp=预留字段", "666002154990022", "C:\\temp\\S00000000000001.pfx", "123456", "utf-8");
        string str = sand.sign("version=版本号&merId=商户号&orderId=订单号&orderTime=订单时间&commodities=商品信息&dispatchAmt=配送费用&orderAmt=订单总额&notifyUrl=回调url地址&remark=备注信息&backUp=预留字段", "666002154990022", "C:\\temp\\C00000000000001.pfx", "111111", "utf-8");
        Response.Write(str);
    }
}
