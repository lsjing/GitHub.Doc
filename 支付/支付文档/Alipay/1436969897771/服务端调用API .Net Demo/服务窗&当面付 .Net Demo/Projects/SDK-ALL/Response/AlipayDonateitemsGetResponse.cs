using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayDonateitemsGetResponse.
    /// </summary>
    public class AlipayDonateitemsGetResponse : AopResponse
    {
        /// <summary>
        /// 捐款金额
        /// </summary>
        [XmlElement("amount")]
        public string Amount { get; set; }

        /// <summary>
        /// 捐款笔数
        /// </summary>
        [XmlElement("count")]
        public string Count { get; set; }
    }
}
