using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.ebpp.subscribe.checkcode.import
    /// </summary>
    public class AlipayEbppSubscribeCheckcodeImportRequest : IAopRequest<AlipayEbppSubscribeCheckcodeImportResponse>
    {
        /// <summary>
        /// 缴费户号
        /// </summary>
        public string BillKey { get; set; }

        /// <summary>
        /// 业务类型
        /// </summary>
        public string BizType { get; set; }

        /// <summary>
        /// 出账机构短名称
        /// </summary>
        public string ChargeInst { get; set; }

        /// <summary>
        /// 订阅校验码
        /// </summary>
        public string CheckCode { get; set; }

        /// <summary>
        /// 扩展字段内容
        /// </summary>
        public string ExtendField { get; set; }

        /// <summary>
        /// 子业务类型
        /// </summary>
        public string SubBizType { get; set; }

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
            return "alipay.ebpp.subscribe.checkcode.import";
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
            parameters.Add("bill_key", this.BillKey);
            parameters.Add("biz_type", this.BizType);
            parameters.Add("charge_inst", this.ChargeInst);
            parameters.Add("check_code", this.CheckCode);
            parameters.Add("extend_field", this.ExtendField);
            parameters.Add("sub_biz_type", this.SubBizType);
            return parameters;
        }

        #endregion
    }
}
