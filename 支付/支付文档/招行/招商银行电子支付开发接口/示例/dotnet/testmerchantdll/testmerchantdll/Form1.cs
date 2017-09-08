using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using CMBCHINALib;
namespace testmerchantdll
{
    /// <summary>
    /// 
    /// </summary>
    public partial class Form1 : Form
    {
        public CMBCHINALib.FirmClientClass  m_fc;   //商户登录后的实例
        public string m_cono;   //记录下登录的商户号
        private short r;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button13_Click(object sender, EventArgs e)
        {
            m_fc.exLogout ( );
            Application.Exit ( );
            
        }
        /// <summary>
        /// 功能：查询未结账订单
        /// 简介：调用exQueryUnsettledOrder方法得到所有未结账订单，保存在变量objout中，
        /// 运用字符串处理方法可以对数据进行处理。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnqus_Click(object sender, EventArgs e)
        {

            object objout = null;
            
            r = m_fc.exQueryUnsettledOrder(out objout);
            if (r != 0)
            {
                MessageBox.Show(m_fc.exGetLastErr(r));
               // m_fc.exLogout();
                return;

            }
            MessageBox.Show ( "Query OK !" );
            txtcontent.Text = objout.ToString ( ).Replace ( "\n", "\\n" );
            

        }
        /// <summary>
        /// 功能：查询一个时间段内已结账订单
        /// 简介：调用exQuerySettledOrder方法得到一个指定时间段的结账订单，保存在变量objout中，
        /// 运用字符串处理方法可以对数据进行处理。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button2_Click(object sender, EventArgs e)
        {
            object objout = null;
            r = m_fc.exQuerySettledOrder ( dtpst.Text, dtpend.Text, out objout );
            
             if (r != 0) 
             {
                 MessageBox.Show(m_fc.exGetLastErr(r));
                 //m_fc.exLogout();
                 return;
                        
             }
           MessageBox.Show ( "Query OK!" );
           txtcontent.Text = objout.ToString().Replace("\n","\\n");
          

        }
        /// <summary>
        /// 功能：按照结账日查询所有已经结账订单
        /// 简介：调用exQueryTransact方法得到所有结账订单，保存在变量objout中，
        /// 运用字符串处理方法可以对数据进行处理。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button3_Click(object sender, EventArgs e)
        {
            object objout = null;
            r = m_fc.exQueryTransact ( dtpst.Text, out objout );
            if (r != 0)
            {
                MessageBox.Show(m_fc.exGetLastErr(r));
               // m_fc.exLogout();
                return;
            }
            MessageBox.Show ( "Transact OK !" );
            txtcontent.Text = objout.ToString ( ).Replace ( "\n", "\\n" );
            

        }
        /// <summary>
        /// 功能：按照交易日期查询未结账订单
        /// 简介：调用exQueryUnsettledOrderByPage方法，设定本次查询所返回定单数目，查询未结账订单，
        /// 保存在变量objout中，运用字符串处理方法可以对数据进行处理。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button6_Click(object sender, EventArgs e)
        {
            
           // StringBuilder s = new StringBuilder();
            object objout = null;
            r = m_fc.exQueryUnsettledOrderByPage(100, out objout);
            if( r!= 0){
                MessageBox.Show(m_fc.exGetLastErr(r));
                //m_fc.exLogout();
                return;
            }
            txtcontent.Text = objout.ToString ( ).Replace ( "\n", "\\n" );
            MessageBox.Show( "Query OK with nextpage flag=" + m_fc.exHasNextPage().ToString());
          
        }
        /// <summary>
        /// 功能：按照给定的交易日期段查询已经结账订单
        /// 简介：调用exQuerySettledOrderByPage方法，设定本次查询所返回定单数目，查询已经结账订单，
        /// 保存在变量objout中，运用字符串处理方法可以对数据进行处理。        
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button5_Click(object sender, EventArgs e)
        {
            object objout=null;
            r = m_fc.exQuerySettledOrderByPage ( dtpst.Text, dtpend.Text, 100, out objout );
            if( r!= 0)
            {
                MessageBox.Show( m_fc.exGetLastErr(r));
                //m_fc.exLogout();
                return;
            }
            txtcontent.Text = objout.ToString ( ).Replace ( "\n", "\\n" );
            MessageBox.Show("Query OK with nextpage flag=" + m_fc.exHasNextPage().ToString());
        }
        /// <summary>
        /// 功能：按照给定的结账起始日期查询已经结账订单
        /// 简介：调用exQueryTransactByPage方法，设定本次查询所返回定单数目，查询已经结账订单，
        /// 保存在变量objout中，运用字符串处理方法可以对数据进行处理。       
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button4_Click ( object sender, EventArgs e )
        {
            object objout=null;
            r = m_fc.exQueryTransactByPage ( dtpst.Text, 100, out objout );
            if(r!= 0)
            {
                MessageBox.Show(m_fc.exGetLastErr(r));
                //m_fc.exLogout();
                return;
            }
            txtcontent.Text = objout.ToString ( ).Replace ( "\n", "\\n" );
            MessageBox.Show ( "Query OK with nextpage flag=" + m_fc.exHasNextPage ( ) );//exHasNextPage()，判断当前页面是否还有后续页面数据
        }
        /// <summary>
        /// 功能：在进行分页查询之前，必须先调用一次exPageReset(),将查询记录重置为第一页，
        /// 然后可以多次调用分页查询，直到返回全部数据。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button7_Click ( object sender, EventArgs e )
        {
            m_fc.exPageReset ( );
            MessageBox.Show ( "PageReset OK !" );

        }
        /// <summary>
        /// 功能：生成商户验证码
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button8_Click ( object sender, EventArgs e )
        {
            txtcontent.Text = m_fc.exGenMerchantCode("abc", "20031106", "0571", "001139", "000361", "0.01", 
                "md-merchantdata", "http://99.1.101.64/testserver/testserver.dll?MerchantAnswerWithPara","","","","","" ).ToString();

        }
        /// <summary>
        /// 功能：根据商户号、订单号和银行流水号对单一订单进行结账处理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button10_Click ( object sender, EventArgs e )
        {
       string bill = "\0";
            string refno = "\0";

            getBillRef ( ref bill, ref refno );
            r = m_fc.exSettleOrder ( m_cono, bill, refno );//000354为测试商户号，商户在此可以更换为自己的商户号
            if (r != 0)
            {
                MessageBox.Show ( m_fc.exGetLastErr ( r ) );
                return;
            }
            MessageBox.Show ( "Settle OK !" );
        }
        /// <summary>
        /// 功能：根据交易日期和订单号查询单笔订单的处理结果，
        /// 查询结果保存在objout变量中，运用字符串处理方法可以对数据进行处理。  
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button11_Click ( object sender, EventArgs e )
        {
           object objout=null;
           r = m_fc.exQuerySingleOrder ( dtpsingle.Text, singlebill.Text, out objout );
           if(r!=0)
           {
               MessageBox.Show(m_fc.exGetLastErr(r));
              // m_fc.exLogout();
               return;
           
           }
           objout.ToString ( ).Replace ( "\r\n", " " );
           MessageBox.Show ( "Query OK !" );
           txtcontent.Text = objout.ToString ( ).Replace ( "\n", "\\n" );
            

        }

        /// <summary>
        /// 功能：根据商户号、订单号和银行流水号查询单一订单记录，并对订单进行撤销处理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button12_Click ( object sender, EventArgs e )
        {
            string bill = "\0";
            string refno = "\0";
            if (txtcontent.SelectedText == "")
            {
                MessageBox.Show ( "没有选择任何一行数据" );
                return;
            }

            getBillRef ( ref bill, ref refno );
            r = m_fc.exCancelOrder ( m_cono, bill, refno );
            if (r != 0)
            {
                MessageBox.Show ( m_fc.exGetLastErr ( r ) );
                return;
            }

            MessageBox.Show ( "Cancel OK !" );
        }
        /// <summary>
        /// 获取指定记录的订单号和订单流水号
        /// </summary>
        /// <param name="bill"></param>
        /// <param name="refno"></param>
        void getBillRef ( ref String bill, ref String refno )
    {
       
       //     String[,] s = new String[2,];
        char[] c = new char[1];
        c[0] = '|';
            string[] s=new string[2];
            string temp = txtcontent.SelectedText.Replace ("\\n", "|" );
            s = temp.Split ( c, StringSplitOptions.None );
        bill = s[0];
        refno = s[1];        
}
        /// <summary>
        /// 功能：根据商户号、订单号和银行流水号查询单一订单记录，输入本次结账金额，对订单进行部分结账处理。
        /// 本次结账金额不能大于原始定单金额。 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button9_Click ( object sender, EventArgs e )
        {
            string newamount;
            string bill = "\0";
            string refno = "\0";
            newamount = Microsoft.VisualBasic.Interaction.InputBox ( "请输入结帐金额", " ", Convert.ToString ( 0 ), this.Width / 2, this.Height / 2 );
            getBillRef ( ref bill, ref refno );
            r = m_fc.exSettlePartOrder ( m_cono, bill, refno, newamount );
            if (r != 0)
            {
                MessageBox.Show ( m_fc.exGetLastErr ( r ) );
                return;
            }
            MessageBox.Show ( "Partial Settle OK !" );

        }

        private void Form1_FormClosing ( object sender, FormClosingEventArgs e )
        {
           
        }

        private void Form1_FormClosed ( object sender, FormClosedEventArgs e )
        {
            m_fc.exLogout ( );
            Application.Exit ( );

        }

        private void btnRefund_Click(object sender, EventArgs e)
        {
            r = m_fc.exRefundOrder("20140801", "123456", "1.00", "test refund", "AaBbCc123456");
            if (r != 0)
            {
                MessageBox.Show(m_fc.exGetLastErr(r));
                return;
            }
            MessageBox.Show("Refund OK !");
        }
       
    }
}