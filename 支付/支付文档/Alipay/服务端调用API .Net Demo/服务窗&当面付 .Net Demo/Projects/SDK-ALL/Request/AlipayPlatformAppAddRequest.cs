using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.platform.app.add
    /// </summary>
    public class AlipayPlatformAppAddRequest : IAopRequest<AlipayPlatformAppAddResponse>
    {
        /// <summary>
        /// ISV支付宝ID
        /// </summary>
        public string AlipayUserId { get; set; }

        /// <summary>
        /// 应用接收回调的地址
        /// </summary>
        public string AppCallbackUrl { get; set; }

        /// <summary>
        /// 应用是否hosting
        /// </summary>
        public Nullable<bool> AppIsHosting { get; set; }

        /// <summary>
        /// 应用名称
        /// </summary>
        public string AppName { get; set; }

        /// <summary>
        /// 应用描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// ISV的描述
        /// </summary>
        public string IsvDescription { get; set; }

        /// <summary>
        /// ISV邮箱
        /// </summary>
        public string IsvEmail { get; set; }

        /// <summary>
        /// ISV名称,服务商
        /// </summary>
        public string IsvName { get; set; }

        /// <summary>
        /// ISV所在平台账号
        /// </summary>
        public string IsvNick { get; set; }

        /// <summary>
        /// ISV手机号码
        /// </summary>
        public string IsvPhone { get; set; }

        /// <summary>
        /// 类型：1：个人；2：公司
        /// </summary>
        public Nullable<long> IsvType { get; set; }

        /// <summary>
        /// ISV网站主页
        /// </summary>
        public string IsvWebHost { get; set; }

        /// <summary>
        /// LOGO链接。80*80
        /// </summary>
        public string LogoUrl { get; set; }

        /// <summary>
        /// 应用的客服支持Email
        /// </summary>
        public string SupportEmail { get; set; }

        /// <summary>
        /// 应用的客服电话号码
        /// </summary>
        public string SupportPhoneNo { get; set; }

        /// <summary>
        /// 应用的旺旺客服ID
        /// </summary>
        public string SupportWangwangId { get; set; }

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
            return "alipay.platform.app.add";
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
            parameters.Add("alipay_user_id", this.AlipayUserId);
            parameters.Add("app_callback_url", this.AppCallbackUrl);
            parameters.Add("app_is_hosting", this.AppIsHosting);
            parameters.Add("app_name", this.AppName);
            parameters.Add("description", this.Description);
            parameters.Add("isv_description", this.IsvDescription);
            parameters.Add("isv_email", this.IsvEmail);
            parameters.Add("isv_name", this.IsvName);
            parameters.Add("isv_nick", this.IsvNick);
            parameters.Add("isv_phone", this.IsvPhone);
            parameters.Add("isv_type", this.IsvType);
            parameters.Add("isv_web_host", this.IsvWebHost);
            parameters.Add("logo_url", this.LogoUrl);
            parameters.Add("support_email", this.SupportEmail);
            parameters.Add("support_phone_no", this.SupportPhoneNo);
            parameters.Add("support_wangwang_id", this.SupportWangwangId);
            return parameters;
        }

        #endregion
    }
}
