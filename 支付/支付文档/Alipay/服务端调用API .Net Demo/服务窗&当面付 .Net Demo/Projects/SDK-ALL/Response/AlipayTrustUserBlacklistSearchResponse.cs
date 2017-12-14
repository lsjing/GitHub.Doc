using System;
using System.Xml.Serialization;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustUserBlacklistSearchResponse.
    /// </summary>
    public class AlipayTrustUserBlacklistSearchResponse : AopResponse
    {
        /// <summary>
        /// 黑名单查询结果
        /// </summary>
        [XmlElement("ali_trust")]
        public AliTrust AliTrust { get; set; }
    }
}
