using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayPlatformAppAddResponse.
    /// </summary>
    public class AlipayPlatformAppAddResponse : AopResponse
    {
        /// <summary>
        /// AOP应用app_id
        /// </summary>
        [XmlElement("aop_app_id")]
        public string AopAppId { get; set; }

        /// <summary>
        /// AOP应用状态
        /// </summary>
        [XmlElement("aop_app_status")]
        public string AopAppStatus { get; set; }

        /// <summary>
        /// AOP应用审核意见
        /// </summary>
        [XmlElement("aop_audit_opinion")]
        public string AopAuditOpinion { get; set; }

        /// <summary>
        /// 外部应用ID
        /// </summary>
        [XmlElement("out_app_id")]
        public string OutAppId { get; set; }
    }
}
