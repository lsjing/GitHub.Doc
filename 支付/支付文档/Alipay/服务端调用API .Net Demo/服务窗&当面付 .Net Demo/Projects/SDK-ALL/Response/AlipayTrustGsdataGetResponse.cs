using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustGsdataGetResponse.
    /// </summary>
    public class AlipayTrustGsdataGetResponse : AopResponse
    {
        /// <summary>
        /// 企业工商数据（JSON串，具体格式见线下文档）
        /// </summary>
        [XmlElement("gs_data")]
        public string GsData { get; set; }
    }
}
