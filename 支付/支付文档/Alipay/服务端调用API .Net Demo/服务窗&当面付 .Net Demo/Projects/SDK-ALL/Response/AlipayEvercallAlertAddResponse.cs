using System;
using System.Xml.Serialization;
using System.Collections.Generic;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayEvercallAlertAddResponse.
    /// </summary>
    public class AlipayEvercallAlertAddResponse : AopResponse
    {
        /// <summary>
        /// 预警处理结果
        /// </summary>
        [XmlArray("alert_results")]
        [XmlArrayItem("evercall_alert_result")]
        public List<EvercallAlertResult> AlertResults { get; set; }
    }
}
