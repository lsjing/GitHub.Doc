using System;
using System.Xml.Serialization;
using System.Collections.Generic;
using Aop.Api.Domain;

namespace Aop.Api.Response
{
    /// <summary>
    /// AlipayGotoneTodoSearchResponse.
    /// </summary>
    public class AlipayGotoneTodoSearchResponse : AopResponse
    {
        /// <summary>
        /// 返回查询到的待办事项
        /// </summary>
        [XmlArray("reminds")]
        [XmlArrayItem("todo_remind")]
        public List<TodoRemind> Reminds { get; set; }

        /// <summary>
        /// 查询到的todo消息数量
        /// </summary>
        [XmlElement("total_count")]
        public string TotalCount { get; set; }
    }
}
