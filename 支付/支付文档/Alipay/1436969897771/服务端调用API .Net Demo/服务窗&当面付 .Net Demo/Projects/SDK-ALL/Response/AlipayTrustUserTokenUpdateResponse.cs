using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustUserTokenUpdateResponse.
    /// </summary>
    public class AlipayTrustUserTokenUpdateResponse : AopResponse
    {
        /// <summary>
        /// 新获取的access token
        /// </summary>
        [XmlElement("access_token")]
        public string AccessToken { get; set; }
    }
}
