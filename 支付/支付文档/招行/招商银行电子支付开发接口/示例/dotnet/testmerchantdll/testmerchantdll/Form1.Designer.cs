namespace testmerchantdll
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.dtpst = new System.Windows.Forms.DateTimePicker();
            this.dtpend = new System.Windows.Forms.DateTimePicker();
            this.txtcontent = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.singlebill = new System.Windows.Forms.TextBox();
            this.button11 = new System.Windows.Forms.Button();
            this.dtpsingle = new System.Windows.Forms.DateTimePicker();
            this.button13 = new System.Windows.Forms.Button();
            this.button12 = new System.Windows.Forms.Button();
            this.button10 = new System.Windows.Forms.Button();
            this.button9 = new System.Windows.Forms.Button();
            this.button8 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.btnqus = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btnRefund = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // dtpst
            // 
            this.dtpst.CustomFormat = "yyyyMMdd";
            this.dtpst.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpst.Location = new System.Drawing.Point(100, 20);
            this.dtpst.Name = "dtpst";
            this.dtpst.Size = new System.Drawing.Size(109, 21);
            this.dtpst.TabIndex = 9;
            // 
            // dtpend
            // 
            this.dtpend.CustomFormat = "yyyyMMdd";
            this.dtpend.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpend.Location = new System.Drawing.Point(314, 20);
            this.dtpend.Name = "dtpend";
            this.dtpend.Size = new System.Drawing.Size(108, 21);
            this.dtpend.TabIndex = 10;
            // 
            // txtcontent
            // 
            this.txtcontent.Location = new System.Drawing.Point(12, 286);
            this.txtcontent.Multiline = true;
            this.txtcontent.Name = "txtcontent";
            this.txtcontent.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtcontent.Size = new System.Drawing.Size(550, 129);
            this.txtcontent.TabIndex = 15;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.singlebill);
            this.groupBox1.Controls.Add(this.button11);
            this.groupBox1.Controls.Add(this.dtpsingle);
            this.groupBox1.Location = new System.Drawing.Point(12, 166);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(550, 65);
            this.groupBox1.TabIndex = 18;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "按订单号查询";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 25);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 12);
            this.label2.TabIndex = 22;
            this.label2.Text = "订单日期：";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(222, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 21;
            this.label1.Text = "订单号：";
            // 
            // singlebill
            // 
            this.singlebill.Location = new System.Drawing.Point(287, 23);
            this.singlebill.Name = "singlebill";
            this.singlebill.Size = new System.Drawing.Size(107, 21);
            this.singlebill.TabIndex = 20;
            // 
            // button11
            // 
            this.button11.Location = new System.Drawing.Point(425, 22);
            this.button11.Name = "button11";
            this.button11.Size = new System.Drawing.Size(108, 23);
            this.button11.TabIndex = 19;
            this.button11.Text = "Query Single";
            this.button11.UseVisualStyleBackColor = true;
            this.button11.Click += new System.EventHandler(this.button11_Click);
            // 
            // dtpsingle
            // 
            this.dtpsingle.CustomFormat = "yyyyMMdd";
            this.dtpsingle.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpsingle.Location = new System.Drawing.Point(84, 22);
            this.dtpsingle.Name = "dtpsingle";
            this.dtpsingle.Size = new System.Drawing.Size(108, 21);
            this.dtpsingle.TabIndex = 18;
            // 
            // button13
            // 
            this.button13.Location = new System.Drawing.Point(436, 248);
            this.button13.Name = "button13";
            this.button13.Size = new System.Drawing.Size(108, 23);
            this.button13.TabIndex = 30;
            this.button13.Text = "Exit";
            this.button13.UseVisualStyleBackColor = true;
            this.button13.Click += new System.EventHandler(this.button13_Click);
            // 
            // button12
            // 
            this.button12.Location = new System.Drawing.Point(299, 248);
            this.button12.Name = "button12";
            this.button12.Size = new System.Drawing.Size(107, 23);
            this.button12.TabIndex = 29;
            this.button12.Text = "Cancel";
            this.button12.UseVisualStyleBackColor = true;
            this.button12.Click += new System.EventHandler(this.button12_Click);
            // 
            // button10
            // 
            this.button10.Location = new System.Drawing.Point(163, 248);
            this.button10.Name = "button10";
            this.button10.Size = new System.Drawing.Size(108, 23);
            this.button10.TabIndex = 28;
            this.button10.Text = "Settle";
            this.button10.UseVisualStyleBackColor = true;
            this.button10.Click += new System.EventHandler(this.button10_Click);
            // 
            // button9
            // 
            this.button9.Location = new System.Drawing.Point(27, 244);
            this.button9.Name = "button9";
            this.button9.Size = new System.Drawing.Size(108, 27);
            this.button9.TabIndex = 27;
            this.button9.Text = "Partial";
            this.button9.UseVisualStyleBackColor = true;
            this.button9.Click += new System.EventHandler(this.button9_Click);
            // 
            // button8
            // 
            this.button8.Location = new System.Drawing.Point(425, 57);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(108, 27);
            this.button8.TabIndex = 26;
            this.button8.Text = "Merchant Code";
            this.button8.UseVisualStyleBackColor = true;
            this.button8.Click += new System.EventHandler(this.button8_Click);
            // 
            // button7
            // 
            this.button7.Location = new System.Drawing.Point(425, 94);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(108, 27);
            this.button7.TabIndex = 25;
            this.button7.Text = "Page Reset";
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.button7_Click);
            // 
            // button4
            // 
            this.button4.Enabled = false;
            this.button4.Location = new System.Drawing.Point(287, 94);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(108, 27);
            this.button4.TabIndex = 24;
            this.button4.Text = "Paged Transact";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(152, 94);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(108, 27);
            this.button5.TabIndex = 23;
            this.button5.Text = "Paged Settled";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(16, 94);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(108, 27);
            this.button6.TabIndex = 22;
            this.button6.Text = "Paged Unsettled";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // button3
            // 
            this.button3.Enabled = false;
            this.button3.Location = new System.Drawing.Point(287, 57);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(108, 27);
            this.button3.TabIndex = 21;
            this.button3.Text = "Transact";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(152, 57);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(108, 27);
            this.button2.TabIndex = 20;
            this.button2.Text = "Query Settled";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // btnqus
            // 
            this.btnqus.Location = new System.Drawing.Point(15, 57);
            this.btnqus.Name = "btnqus";
            this.btnqus.Size = new System.Drawing.Size(108, 27);
            this.btnqus.TabIndex = 19;
            this.btnqus.Text = "Query Unsettled";
            this.btnqus.UseVisualStyleBackColor = true;
            this.btnqus.Click += new System.EventHandler(this.btnqus_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnRefund);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.button8);
            this.groupBox2.Controls.Add(this.btnqus);
            this.groupBox2.Controls.Add(this.button2);
            this.groupBox2.Controls.Add(this.button3);
            this.groupBox2.Controls.Add(this.button7);
            this.groupBox2.Controls.Add(this.button6);
            this.groupBox2.Controls.Add(this.button4);
            this.groupBox2.Controls.Add(this.dtpend);
            this.groupBox2.Controls.Add(this.button5);
            this.groupBox2.Controls.Add(this.dtpst);
            this.groupBox2.Location = new System.Drawing.Point(12, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(550, 136);
            this.groupBox2.TabIndex = 31;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "按照日期查询";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(222, 24);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(65, 12);
            this.label4.TabIndex = 28;
            this.label4.Text = "结束日期：";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 24);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 12);
            this.label3.TabIndex = 27;
            this.label3.Text = "起始日期：";
            // 
            // btnRefund
            // 
            this.btnRefund.Location = new System.Drawing.Point(448, 17);
            this.btnRefund.Name = "btnRefund";
            this.btnRefund.Size = new System.Drawing.Size(75, 23);
            this.btnRefund.TabIndex = 29;
            this.btnRefund.Text = "退款";
            this.btnRefund.UseVisualStyleBackColor = true;
            this.btnRefund.Click += new System.EventHandler(this.btnRefund_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(574, 427);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.button13);
            this.Controls.Add(this.button12);
            this.Controls.Add(this.button10);
            this.Controls.Add(this.button9);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.txtcontent);
            this.Name = "Form1";
            this.Text = "账单处理";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dtpst;
        private System.Windows.Forms.DateTimePicker dtpend;
        private System.Windows.Forms.TextBox txtcontent;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox singlebill;
        private System.Windows.Forms.Button button11;
        private System.Windows.Forms.DateTimePicker dtpsingle;
        private System.Windows.Forms.Button button13;
        private System.Windows.Forms.Button button12;
        private System.Windows.Forms.Button button10;
        private System.Windows.Forms.Button button9;
        private System.Windows.Forms.Button button8;
        private System.Windows.Forms.Button button7;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button btnqus;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnRefund;
    }
}

