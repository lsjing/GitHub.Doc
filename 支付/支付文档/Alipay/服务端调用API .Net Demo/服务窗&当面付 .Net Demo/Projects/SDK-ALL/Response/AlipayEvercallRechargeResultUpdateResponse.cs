using System;
using System.Xml.Serialization;
using System.Collections.Generic;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayEvercallRechargeResultUpdateResponse.
    /// </summary>
    public class AlipayEvercallRechargeResultUpdateResponse : AopResponse
    {
        /// <summary>
        /// 充值同步结果
        /// </summary>
        [XmlArray("recharge_results")]
        [XmlArrayItem("evercall_recharge_result")]
        public List<EvercallRechargeResult> RechargeResults { get; set; }
    }
}
