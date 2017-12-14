using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.gotone.ackcode.send
    /// </summary>
    public class AlipayGotoneAckcodeSendRequest : IAopRequest<AlipayGotoneAckcodeSendResponse>
    {
        /// <summary>
        /// 格式：key=value 多个以&rdquo;|&rdquo;分割
        /// </summary>
        public string Arguments { get; set; }

        /// <summary>
        /// 区分相同的手机号、业务类型，但不同业务场景的手机校验码等情况校验。比如使用order_no
        /// </summary>
        public string BizNo { get; set; }

        /// <summary>
        /// 发送手机校验码业务类型，为空默认DEFAULT_TYPE
        /// </summary>
        public string BizType { get; set; }

        /// <summary>
        /// 接收校验码短信手机号
        /// </summary>
        public string Mobile { get; set; }

        /// <summary>
        /// 短信模板对应的serviceCode
        /// </summary>
        public string ServiceCode { get; set; }

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
            return "alipay.gotone.ackcode.send";
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
            parameters.Add("arguments", this.Arguments);
            parameters.Add("biz_no", this.BizNo);
            parameters.Add("biz_type", this.BizType);
            parameters.Add("mobile", this.Mobile);
            parameters.Add("service_code", this.ServiceCode);
            return parameters;
        }

        #endregion
    }
}
