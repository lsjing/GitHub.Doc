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
    /// 1、新建工程，在工程的引用中，选择“添加引用”，在弹出的对话框中选择“浏览”，
    /// 在本地系统中寻找CMBChina.dll文件，选中并点击确定。
    /// 2、在需要使用CMBChina.dll中的方法的窗体的cs文件最上部，添加“using CMBCHINALib;”语句。
    /// 3、在需要使用CMBChina.dll中的方法的地方定义 CMBCHINALib.FirmClientClass 实体类fc，类名可自定;
    /// 4、所有方法请使用第三步生成的类fc来调用。
    /// </summary>
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            //txths.Text = "99.1.101.64";
            txths.Text="payment.ebank.cmbchina.com";   //支付网关地址参数
            txtbr.Text = "0571";                //商户所在分行号，请替换成您的分行号
            txtco.Text = "000000";              //商户号，请替换成您的商户号
            txtpwd.Text = "000000";             //商户密码，请替换成您的商户密码

        }
        /// <summary>
        /// 实现商户登录功能
        /// 首先需要调用exSetOptions方法，设置支付网关地址
        /// 然后调用exLoginC方法，设置参数登录系统
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button1_Click(object sender, EventArgs e)
        {
            CMBCHINALib.FirmClientClass fc;
            short r;
            Form1 fm;
            fc = new FirmClientClass();
            fc.exSetOptions(this.txths.Text.Trim(), "");//设置系统的支付网关
            r = fc.exLoginC(txtbr.Text, txtco.Text, txtpwd.Text);//登录系统
            if  (r!= 0) {
                MessageBox.Show(fc.exGetLastErr(r));
                return;
            }
            fm = new Form1();
            fm.m_fc = fc;
            fm.m_cono = txtco.Text;
            this.Hide();
            fm.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
