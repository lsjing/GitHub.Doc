using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayEbppSubscribeCheckcodeImportResponse.
    /// </summary>
    public class AlipayEbppSubscribeCheckcodeImportResponse : AopResponse
    {
        /// <summary>
        /// 返回结果
        /// </summary>
        [XmlElement("success")]
        public bool Success { get; set; }
    }
}
