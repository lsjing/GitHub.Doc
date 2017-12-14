using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayUserBindingGetResponse.
    /// </summary>
    public class AlipayUserBindingGetResponse : AopResponse
    {
        /// <summary>
        /// 合作伙伴用户id
        /// </summary>
        [XmlElement("partner_user_id")]
        public string PartnerUserId { get; set; }

        /// <summary>
        /// 淘宝用户id
        /// </summary>
        [XmlElement("taobao_id")]
        public string TaobaoId { get; set; }
    }
}
