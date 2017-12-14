using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.trust.user.blacklist.search
    /// </summary>
    public class AlipayTrustUserBlacklistSearchRequest : IAopRequest<AlipayTrustUserBlacklistSearchResponse>
    {
        /// <summary>
        /// 是否已经取得了用户的授权许可
        /// </summary>
        public Nullable<bool> Authorized { get; set; }

        /// <summary>
        /// 用户完整身份证号
        /// </summary>
        public string IdCard { get; set; }

        /// <summary>
        /// 根据加*规则生成的加*后身份证号号
        /// </summary>
        public string MaskIdCard { get; set; }

        /// <summary>
        /// 根据加*规则生成的加*姓名
        /// </summary>
        public string MaskName { get; set; }

        /// <summary>
        /// 用户完整姓名
        /// </summary>
        public string Name { get; set; }

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
            return "alipay.trust.user.blacklist.search";
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
            parameters.Add("authorized", this.Authorized);
            parameters.Add("id_card", this.IdCard);
            parameters.Add("mask_id_card", this.MaskIdCard);
            parameters.Add("mask_name", this.MaskName);
            parameters.Add("name", this.Name);
            return parameters;
        }

        #endregion
    }
}
