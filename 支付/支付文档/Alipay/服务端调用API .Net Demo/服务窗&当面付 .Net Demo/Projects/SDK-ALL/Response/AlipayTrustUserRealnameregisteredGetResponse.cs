using System;
using System.Xml.Serialization;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustUserRealnameregisteredGetResponse.
    /// </summary>
    public class AlipayTrustUserRealnameregisteredGetResponse : AopResponse
    {
        /// <summary>
        /// 实名制返回结果
        /// </summary>
        [XmlElement("ali_trust_real_name_registration")]
        public AliTrustRealNameRegistration AliTrustRealNameRegistration { get; set; }
    }
}
