using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.trust.user.basicinfo.verify.get
    /// </summary>
    public class AlipayTrustUserBasicinfoVerifyGetRequest : IAopRequest<AlipayTrustUserBasicinfoVerifyGetResponse>
    {
        /// <summary>
        /// 入参json串,  其中*号为encryp_code。  确保每个字段的值的总长度必须与没加密之前的字段长度要一致
        /// </summary>
        public string AliTrustUserInfo { get; set; }

        /// <summary>
        /// 只能为单个字符，不传默认为*
        /// </summary>
        public string EncrypCode { get; set; }

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
            return "alipay.trust.user.basicinfo.verify.get";
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
            parameters.Add("ali_trust_user_info", this.AliTrustUserInfo);
            parameters.Add("encryp_code", this.EncrypCode);
            return parameters;
        }

        #endregion
    }
}
