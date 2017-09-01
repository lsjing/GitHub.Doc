using System;
using System.Xml.Serialization;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustUserNontokenRiskidentifyGetResponse.
    /// </summary>
    public class AlipayTrustUserNontokenRiskidentifyGetResponse : AopResponse
    {
        /// <summary>
        /// 风险识别结果
        /// </summary>
        [XmlElement("ali_trust_risk_identify")]
        public AliTrustRiskIdentify AliTrustRiskIdentify { get; set; }

        /// <summary>
        /// 服务窗返回码
        /// </summary>
        [XmlElement("code")]
        public string Code { get; set; }

        /// <summary>
        /// 服务窗返回码含义
        /// </summary>
        [XmlElement("msg")]
        public string Msg { get; set; }
    }
}
