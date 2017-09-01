using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayEvercallContractSignResponse.
    /// </summary>
    public class AlipayEvercallContractSignResponse : AopResponse
    {
        /// <summary>
        /// 签约手机号
        /// </summary>
        [XmlElement("mobile_no")]
        public string MobileNo { get; set; }

        /// <summary>
        /// 支付宝账户号
        /// </summary>
        [XmlElement("user_id")]
        public string UserId { get; set; }
    }
}
