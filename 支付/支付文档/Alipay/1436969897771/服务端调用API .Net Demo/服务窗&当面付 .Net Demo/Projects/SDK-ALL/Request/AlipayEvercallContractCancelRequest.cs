using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.evercall.contract.cancel
    /// </summary>
    public class AlipayEvercallContractCancelRequest : IAopRequest<AlipayEvercallContractCancelResponse>
    {
        /// <summary>
        /// 签约手机号
        /// </summary>
        public string MobileNo { get; set; }

        /// <summary>
        /// 解约渠道(SMS：短信方式 CLIENT：客户端 WAP：wap SITE：主站 OPENPLAT:开放平台 OTHER：其他)
        /// </summary>
        public string UnsignChannel { get; set; }

        /// <summary>
        /// 运营统计：taobao,alipay,telecom
        /// </summary>
        public string UnsignFrom { get; set; }

        /// <summary>
        /// 支付宝账户号
        /// </summary>
        public string UserId { get; set; }

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
            return "alipay.evercall.contract.cancel";
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
            parameters.Add("mobile_no", this.MobileNo);
            parameters.Add("unsign_channel", this.UnsignChannel);
            parameters.Add("unsign_from", this.UnsignFrom);
            parameters.Add("user_id", this.UserId);
            return parameters;
        }

        #endregion
    }
}
