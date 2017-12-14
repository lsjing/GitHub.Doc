using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.trust.gsdata.get
    /// </summary>
    public class AlipayTrustGsdataGetRequest : IAopRequest<AlipayTrustGsdataGetResponse>
    {
        /// <summary>
        /// 企业名称全称
        /// </summary>
        public string EntName { get; set; }

        /// <summary>
        /// 自然人证件号码
        /// </summary>
        public string IdCard { get; set; }

        /// <summary>
        /// 是否强制先从本地查询
        /// </summary>
        public Nullable<bool> Local { get; set; }

        /// <summary>
        /// 本地缓存数据有效时间。当所查询的数据在本地数据库中命中时，如果在有效期之内，则不再做远程查询。
        /// </summary>
        public Nullable<DateTime> QualifiedTime { get; set; }

        /// <summary>
        /// 企业执照号码
        /// </summary>
        public string RegNo { get; set; }

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
            return "alipay.trust.gsdata.get";
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
            parameters.Add("ent_name", this.EntName);
            parameters.Add("id_card", this.IdCard);
            parameters.Add("local", this.Local);
            parameters.Add("qualified_time", this.QualifiedTime);
            parameters.Add("reg_no", this.RegNo);
            return parameters;
        }

        #endregion
    }
}
