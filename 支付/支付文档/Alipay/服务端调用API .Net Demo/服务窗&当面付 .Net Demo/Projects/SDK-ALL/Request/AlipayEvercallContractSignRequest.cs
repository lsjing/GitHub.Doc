using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.evercall.contract.sign
    /// </summary>
    public class AlipayEvercallContractSignRequest : IAopRequest<AlipayEvercallContractSignResponse>
    {
        /// <summary>
        /// 预警阀值，单位是元。小数点保留两位，精确到分
        /// </summary>
        public string AlertBalance { get; set; }

        /// <summary>
        /// 签约手机号
        /// </summary>
        public string MobileNo { get; set; }

        /// <summary>
        /// 充值金额，单位是元。小数点保留两位，精确到分
        /// </summary>
        public string RechargeAmount { get; set; }

        /// <summary>
        /// 手机充值代扣确认
        /// </summary>
        public string RechargeConfirm { get; set; }

        /// <summary>
        /// 签约渠道(SMS：短信方式 CLIENT：客户端 WAP：wap SITE：主站 OPENPLAT:开放平台 OTHER：其他)
        /// </summary>
        public string SignChannel { get; set; }

        /// <summary>
        /// 运营统计：taobao,alipay,telecom
        /// </summary>
        public string SignFrom { get; set; }

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
            return "alipay.evercall.contract.sign";
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
            parameters.Add("alert_balance", this.AlertBalance);
            parameters.Add("mobile_no", this.MobileNo);
            parameters.Add("recharge_amount", this.RechargeAmount);
            parameters.Add("recharge_confirm", this.RechargeConfirm);
            parameters.Add("sign_channel", this.SignChannel);
            parameters.Add("sign_from", this.SignFrom);
            parameters.Add("user_id", this.UserId);
            return parameters;
        }

        #endregion
    }
}
