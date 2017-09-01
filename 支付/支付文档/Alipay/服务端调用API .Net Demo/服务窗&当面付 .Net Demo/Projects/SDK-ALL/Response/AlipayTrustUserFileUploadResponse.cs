using System;
using System.Xml.Serialization;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayTrustUserFileUploadResponse.
    /// </summary>
    public class AlipayTrustUserFileUploadResponse : AopResponse
    {
        /// <summary>
        /// 文件在服务器端的唯一标识
        /// </summary>
        [XmlElement("file_identity")]
        public string FileIdentity { get; set; }
    }
}
