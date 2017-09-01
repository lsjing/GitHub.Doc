using System;
using System.Xml.Serialization;
using System.Collections.Generic;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayMerchantTicketQueryResponse.
    /// </summary>
    public class AlipayMerchantTicketQueryResponse : AopResponse
    {
        /// <summary>
        /// 商户会员券对象列表
        /// </summary>
        [XmlArray("merchant_ticket_models")]
        [XmlArrayItem("merchant_ticket_model")]
        public List<MerchantTicketModel> MerchantTicketModels { get; set; }
    }
}
