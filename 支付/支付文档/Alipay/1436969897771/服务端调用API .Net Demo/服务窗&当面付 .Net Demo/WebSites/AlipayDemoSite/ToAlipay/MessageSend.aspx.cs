using Aop.Api;
using Aop.Api.Response;
using Aop.Api.Util;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alipay.Demo
{
    public partial class MessageSend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string biz_content = Request.Form.Get("biz_content");
            string response = null;
            //biz_content的json为示例数据，实际数据需要按照文档组装
            //判断是否有toUserId,如果有，则单发，如果没有，则群发。
            //群发会导致所有人都能收到，一周只能发送一次
            if (biz_content.Contains("\"toUserId\":"))
            {
                response = MessageSendBiz.CustomSend(biz_content);
            }
            else
            {
                response = MessageSendBiz.TotalSend(biz_content);
            }
            IDictionary response_dict=   AopUtils.ParseJson(response);

            //输出返回的json
            Response.Output.WriteLine(response);
            Response.End();
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

    }
}