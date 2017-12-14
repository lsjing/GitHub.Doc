using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Aop.Api;
using Aop.Api.Request;
using Aop.Api.Response;
using System.Collections;
using Aop.Api.Util;

namespace Alipay.Demo
{
    public partial class ShortLink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string biz_content = Request.Form.Get("biz_content");
            string response = ShortLinkBiz.process(biz_content);

            IDictionary response_dict = AopUtils.ParseJson(response);

            //输出返回的json
            Response.Output.WriteLine(response);
            Response.End();
        }

    }
}