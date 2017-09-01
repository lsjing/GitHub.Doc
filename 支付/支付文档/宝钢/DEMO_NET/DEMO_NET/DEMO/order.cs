using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DEMO
{
    public class order
    {
        public order()
        {
        }
        public String code { get; set; }//商品唯一编号
        public String goods { get; set; }//商品名称 
        public int number { get; set; }//商品数量 
        public String price { get; set; }//商品价格（单位 元）
    }
}
