using System;
using System.Collections.Generic;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    /// <summary>
    /// AOP API: alipay.merchant.ticket.query
    /// </summary>
    public class AlipayMerchantTicketQueryRequest : IAopRequest<AlipayMerchantTicketQueryResponse>
    {
        /// <summary>
        /// 券有效期起始日期 ，yyyy-MM-dd HH:mm:ss格式
        /// </summary>
        public string GmtActive { get; set; }

        /// <summary>
        /// 券有效期截止日期，yyyy-MM-dd HH:mm:ss格式
        /// </summary>
        public string GmtExpired { get; set; }

        /// <summary>
        /// 发券商户partnerId
        /// </summary>
        public string PartnerId { get; set; }

        /// <summary>
        /// 券排序方式，目前支持两种方式 ：按创建日期倒序、按过期时间倒序       * 目前支持的排序方式为：  CREATETIME_DESC_SORT：按创建时间倒序  EXPIREDTIME_DESC_SORT：按失效时间倒序,
        /// </summary>
        public string Sort { get; set; }

        /// <summary>
        /// 券状态列表，支持列表，逗号分割，取值：  VALID:可使用  WRITED_OFF:已核销  EXPIRED:已过期  CLOSED:已关闭  WAIT_APPLY：待领取
        /// </summary>
        public string StatusList { get; set; }

        /// <summary>
        /// 查询优惠劵类型，取值：  0：商户优惠券  1：商户红包  2：商户兑换券
        /// </summary>
        public string TicketBizType { get; set; }

        /// <summary>
        /// 券码列表，可选，支持列表，逗号分割
        /// </summary>
        public string TicketNoList { get; set; }

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
            return "alipay.merchant.ticket.query";
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
            parameters.Add("gmt_active", this.GmtActive);
            parameters.Add("gmt_expired", this.GmtExpired);
            parameters.Add("partner_id", this.PartnerId);
            parameters.Add("sort", this.Sort);
            parameters.Add("status_list", this.StatusList);
            parameters.Add("ticket_biz_type", this.TicketBizType);
            parameters.Add("ticket_no_list", this.TicketNoList);
            parameters.Add("user_id", this.UserId);
            return parameters;
        }

        #endregion
    }
}
