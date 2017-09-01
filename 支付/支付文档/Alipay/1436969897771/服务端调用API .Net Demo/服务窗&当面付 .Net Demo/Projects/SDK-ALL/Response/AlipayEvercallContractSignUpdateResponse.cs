using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayEvercallContractSignUpdateResponse.
    /// </summary>
    public class AlipayEvercallContractSignUpdateResponse : AopResponse
    {
        /// <summary>
        /// 扩展属性
        /// </summary>
        [XmlElement("extend_field")]
        public string ExtendField { get; set; }

        /// <summary>
        /// 签约手机号
        /// </summary>
        [XmlElement("mobile_no")]
        public string MobileNo { get; set; }

        /// <summary>
        /// 返回结果
        /// </summary>
        [XmlElement("return_code")]
        public string ReturnCode { get; set; }
    }
}
