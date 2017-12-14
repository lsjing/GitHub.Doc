using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayMerchantTicketApplyResponse.
    /// </summary>
    public class AlipayMerchantTicketApplyResponse : AopResponse
    {
        /// <summary>
        /// 券Id
        /// </summary>
        [XmlElement("ticket_id")]
        public string TicketId { get; set; }

        /// <summary>
        /// 券编号
        /// </summary>
        [XmlElement("ticket_no")]
        public string TicketNo { get; set; }
    }
}
