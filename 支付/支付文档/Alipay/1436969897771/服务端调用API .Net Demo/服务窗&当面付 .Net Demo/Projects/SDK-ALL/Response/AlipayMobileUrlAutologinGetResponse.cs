using System;
using System.Xml.Serialization;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayMobileUrlAutologinGetResponse.
    /// </summary>
    public class AlipayMobileUrlAutologinGetResponse : AopResponse
    {
        /// <summary>
        /// 淘宝免登url返回
        /// </summary>
        [XmlElement("response")]
        public TaobaoAutoLoginUrl Response { get; set; }

        /// <summary>
        /// 获取免登url 是否成功
        /// </summary>
        [XmlElement("success")]
        public bool Success { get; set; }
    }
}
