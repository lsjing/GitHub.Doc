using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.merchant.ticket.apply
    /// </summary>
    public class AlipayMerchantTicketApplyRequest : IAopRequest<AlipayMerchantTicketApplyResponse>
    {
        /// <summary>
        /// 业务上下文
        /// </summary>
        public string BizContext { get; set; }

        /// <summary>
        /// 业务发生时间，外围传入，可以作为T+1核对，如果不填写，则该时间为业务生成时间
        /// </summary>
        public string BizDate { get; set; }

        /// <summary>
        /// 业务号，用于控制幂等。
        /// </summary>
        public string BizNo { get; set; }

        /// <summary>
        /// 扩展字段，json格式
        /// </summary>
        public string ExtInfo { get; set; }

        /// <summary>
        /// 操作人id
        /// </summary>
        public string OptId { get; set; }

        /// <summary>
        /// 发券商户parnterId
        /// </summary>
        public string PartnerId { get; set; }

        /// <summary>
        /// 券模板编号
        /// </summary>
        public string TemplateNo { get; set; }

        /// <summary>
        /// 个人用户Id
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
            return "alipay.merchant.ticket.apply";
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
            parameters.Add("biz_context", this.BizContext);
            parameters.Add("biz_date", this.BizDate);
            parameters.Add("biz_no", this.BizNo);
            parameters.Add("ext_info", this.ExtInfo);
            parameters.Add("opt_id", this.OptId);
            parameters.Add("partner_id", this.PartnerId);
            parameters.Add("template_no", this.TemplateNo);
            parameters.Add("user_id", this.UserId);
            return parameters;
        }

        #endregion
    }
}
