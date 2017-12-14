using System;
using System.Xml.Serialization;
using System.Collections.Generic;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustLldataGetResponse.
    /// </summary>
    public class AlipayTrustLldataGetResponse : AopResponse
    {
        /// <summary>
        /// 失信记录详情
        /// </summary>
        [XmlArray("results")]
        [XmlArrayItem("dishonesty_query_result_info")]
        public List<DishonestyQueryResultInfo> Results { get; set; }
    }
}
