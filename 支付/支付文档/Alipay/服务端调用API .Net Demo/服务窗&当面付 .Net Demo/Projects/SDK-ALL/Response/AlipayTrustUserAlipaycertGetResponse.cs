using System;
using System.Xml.Serialization;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustUserAlipaycertGetResponse.
    /// </summary>
    public class AlipayTrustUserAlipaycertGetResponse : AopResponse
    {
        /// <summary>
        /// 支付宝实名认证结果
        /// </summary>
        [XmlElement("ali_trust_alipay_cert")]
        public AliTrustAlipayCert AliTrustAlipayCert { get; set; }
    }
}
