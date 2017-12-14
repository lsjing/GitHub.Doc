using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayPlatformDeveloperGetResponse.
    /// </summary>
    public class AlipayPlatformDeveloperGetResponse : AopResponse
    {
        /// <summary>
        /// 支付宝用户id
        /// </summary>
        [XmlElement("alipay_user_id")]
        public string AlipayUserId { get; set; }

        /// <summary>
        /// 开发者姓名
        /// </summary>
        [XmlElement("name")]
        public string Name { get; set; }

        /// <summary>
        /// 开发者状态 INIT:信息录入中,AUDIT:审核中,REJECT:已拒绝,VALID:已生效
        /// </summary>
        [XmlElement("status")]
        public string Status { get; set; }

        /// <summary>
        /// 开发者类型 ENTERPRISE-企业开发者，PERSONAL-个人开发者
        /// </summary>
        [XmlElement("type")]
        public string Type { get; set; }
    }
}
