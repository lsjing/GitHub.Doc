using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.trust.lldata.get
    /// </summary>
    public class AlipayTrustLldataGetRequest : IAopRequest<AlipayTrustLldataGetResponse>
    {
        /// <summary>
        /// 是否强制先从本地查询
        /// </summary>
        public Nullable<bool> Local { get; set; }

        /// <summary>
        /// 本地缓存数据有效时间。当所查询的数据在本地数据库中命中时，如果在有效期之内，则不再做远程查询。
        /// </summary>
        public Nullable<DateTime> QualifiedTime { get; set; }

        /// <summary>
        /// 用户列表JSON串，至少1个，最多200个。其中certNo为身份证，name为姓名
        /// </summary>
        public string Users { get; set; }

        #region IAopRequest Members
        private string apiVersion = "1.0";
		private string terminalType;
		private string terminalInfo;
        private string prodCode;
		private string notifyUrl;

		public void SetNotifyUrl(string notifyUrl){
            this.notifyUrl = notifyUrl;
        }

        public string GetNotifyUrl(){
            return this.notifyUrl;
        }

        public void SetTerminalType(String terminalType){
			this.terminalType=terminalType;
		}

    	public string GetTerminalType(){
    		return this.terminalType;
    	}

    	public void SetTerminalInfo(String terminalInfo){
    		this.terminalInfo=terminalInfo;
    	}

    	public string GetTerminalInfo(){
    		return this.terminalInfo;
    	}

        public void SetProdCode(String prodCode){
            this.prodCode=prodCode;
        }

        public string GetProdCode(){
            return this.prodCode;
        }

        public string GetApiName()
        {
            return "alipay.trust.lldata.get";
        }

        public void SetApiVersion(string apiVersion){
            this.apiVersion=apiVersion;
        }

        public string GetApiVersion(){
            return this.apiVersion;
        }

        public IDictionary<string, string> GetParameters()
        {
            AopDictionary parameters = new AopDictionary();
            parameters.Add("local", this.Local);
            parameters.Add("qualified_time", this.QualifiedTime);
            parameters.Add("users", this.Users);
            return parameters;
        }

        #endregion
    }
}
