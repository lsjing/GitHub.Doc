using Aop.Api;
using Aop.Api.Request;
using Aop.Api.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ShortLinkBiz 的摘要说明
/// </summary>

namespace Alipay.Demo
{
    public class ShortLinkBiz
    {
        public ShortLinkBiz()
        {
        }

        //消息异步单发接口
        public static string process(string biz_content)
        {
            AlipayMobilePublicShortlinkCreateRequest request = new AlipayMobilePublicShortlinkCreateRequest();
            request.BizContent = biz_content;

            Dictionary<string, string> paramsDict = (Dictionary<string, string>)request.GetParameters();
            IAopClient client = new DefaultAopClient(Config.serverUrl, Config.appId, Config.merchant_private_key);
            AlipayMobilePublicShortlinkCreateResponse pushResponse = client.Execute(request);
            return pushResponse.Body;
        }

    }
}