using System;
using System.Xml.Serialization;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustAruserRiskSearchResponse.
    /// </summary>
    public class AlipayTrustAruserRiskSearchResponse : AopResponse
    {
        /// <summary>
        /// 安融征信风险名单查询结果
        /// </summary>
        [XmlElement("ali_trust_risk_ar_user")]
        public AliTrustRiskARUser AliTrustRiskArUser { get; set; }
    }
}
