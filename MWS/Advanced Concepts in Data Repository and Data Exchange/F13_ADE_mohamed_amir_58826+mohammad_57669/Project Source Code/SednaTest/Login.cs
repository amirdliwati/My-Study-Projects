using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using Sedna.Net;

namespace SednaTest
{
    
	/// <summary>
	/// Summary description for Login.
	/// </summary>
	public class Login : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox ServerTextBox;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox DatabaseTextBox;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.ComboBox UserTextBox;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Button Cancel_Button;
		private System.Windows.Forms.TextBox PasswordTextBox;
		private System.Windows.Forms.Button LoginButton;
        private TextBox txtUserName;
        private TextBox txtUserPassword;
        private Label label6;
        private Label label7;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Login()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.label1 = new System.Windows.Forms.Label();
            this.ServerTextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.DatabaseTextBox = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.UserTextBox = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.Cancel_Button = new System.Windows.Forms.Button();
            this.LoginButton = new System.Windows.Forms.Button();
            this.PasswordTextBox = new System.Windows.Forms.TextBox();
            this.txtUserName = new System.Windows.Forms.TextBox();
            this.txtUserPassword = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(-224, 131);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(66, 17);
            this.label1.TabIndex = 6;
            this.label1.Text = "Server";
            this.label1.Visible = false;
            // 
            // ServerTextBox
            // 
            this.ServerTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ServerTextBox.Location = new System.Drawing.Point(-140, 128);
            this.ServerTextBox.Name = "ServerTextBox";
            this.ServerTextBox.Size = new System.Drawing.Size(158, 20);
            this.ServerTextBox.TabIndex = 7;
            this.ServerTextBox.Text = "localhost";
            this.ServerTextBox.Visible = false;
            this.ServerTextBox.TextChanged += new System.EventHandler(this.ServerTextBox_TextChanged);
            // 
            // label2
            // 
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(16, 16);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(242, 17);
            this.label2.TabIndex = 0;
            this.label2.Text = "Please enter your login information";
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(-225, 163);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(77, 17);
            this.label3.TabIndex = 8;
            this.label3.Text = "Database";
            this.label3.Visible = false;
            // 
            // DatabaseTextBox
            // 
            this.DatabaseTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.DatabaseTextBox.Location = new System.Drawing.Point(-140, 160);
            this.DatabaseTextBox.Name = "DatabaseTextBox";
            this.DatabaseTextBox.Size = new System.Drawing.Size(158, 20);
            this.DatabaseTextBox.TabIndex = 9;
            this.DatabaseTextBox.Text = "mydata";
            this.DatabaseTextBox.Visible = false;
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.BackColor = System.Drawing.SystemColors.ControlDark;
            this.panel1.Location = new System.Drawing.Point(-224, 114);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(242, 4);
            this.panel1.TabIndex = 5;
            this.panel1.Visible = false;
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(-227, 49);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 17);
            this.label4.TabIndex = 1;
            this.label4.Text = "User Name";
            this.label4.Visible = false;
            // 
            // UserTextBox
            // 
            this.UserTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.UserTextBox.Items.AddRange(new object[] {
            "SYSTEM"});
            this.UserTextBox.Location = new System.Drawing.Point(-140, 46);
            this.UserTextBox.Name = "UserTextBox";
            this.UserTextBox.Size = new System.Drawing.Size(158, 21);
            this.UserTextBox.TabIndex = 2;
            this.UserTextBox.Text = "SYSTEM";
            this.UserTextBox.Visible = false;
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(-226, 81);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(71, 17);
            this.label5.TabIndex = 3;
            this.label5.Text = "Password";
            this.label5.Visible = false;
            // 
            // Cancel_Button
            // 
            this.Cancel_Button.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.Cancel_Button.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.Cancel_Button.Location = new System.Drawing.Point(177, 208);
            this.Cancel_Button.Name = "Cancel_Button";
            this.Cancel_Button.Size = new System.Drawing.Size(92, 28);
            this.Cancel_Button.TabIndex = 11;
            this.Cancel_Button.Text = "Cancel";
            this.Cancel_Button.Click += new System.EventHandler(this.CancelButton_Click);
            // 
            // LoginButton
            // 
            this.LoginButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.LoginButton.Location = new System.Drawing.Point(74, 208);
            this.LoginButton.Name = "LoginButton";
            this.LoginButton.Size = new System.Drawing.Size(92, 28);
            this.LoginButton.TabIndex = 12;
            this.LoginButton.Text = "Login";
            this.LoginButton.Click += new System.EventHandler(this.LoginButton_Click);
            // 
            // PasswordTextBox
            // 
            this.PasswordTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.PasswordTextBox.Location = new System.Drawing.Point(-140, 77);
            this.PasswordTextBox.Name = "PasswordTextBox";
            this.PasswordTextBox.PasswordChar = '*';
            this.PasswordTextBox.Size = new System.Drawing.Size(158, 20);
            this.PasswordTextBox.TabIndex = 4;
            this.PasswordTextBox.Text = "MANAGER";
            this.PasswordTextBox.Visible = false;
            // 
            // txtUserName
            // 
            this.txtUserName.Location = new System.Drawing.Point(28, 68);
            this.txtUserName.Name = "txtUserName";
            this.txtUserName.Size = new System.Drawing.Size(230, 20);
            this.txtUserName.TabIndex = 0;
            // 
            // txtUserPassword
            // 
            this.txtUserPassword.Location = new System.Drawing.Point(28, 131);
            this.txtUserPassword.Name = "txtUserPassword";
            this.txtUserPassword.Size = new System.Drawing.Size(230, 20);
            this.txtUserPassword.TabIndex = 1;
            this.txtUserPassword.UseSystemPasswordChar = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(25, 49);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(63, 13);
            this.label6.TabIndex = 15;
            this.label6.Text = "User Name:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(25, 112);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(57, 13);
            this.label7.TabIndex = 16;
            this.label7.Text = "Password:";
            // 
            // Login
            // 
            this.AcceptButton = this.LoginButton;
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(289, 249);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtUserPassword);
            this.Controls.Add(this.txtUserName);
            this.Controls.Add(this.PasswordTextBox);
            this.Controls.Add(this.Cancel_Button);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.ServerTextBox);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.DatabaseTextBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.UserTextBox);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.LoginButton);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Login";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Login";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Login_FormClosed);
            this.Load += new System.EventHandler(this.Login_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

		}
		#endregion

		private SednaSession session;

		private SednaSession AttemptLogin()
		{
			try
			{
				Cursor.Current = Cursors.WaitCursor;
				return SednaSession.CreateSession(ServerTextBox.Text, DatabaseTextBox.Text, UserTextBox.Text, PasswordTextBox.Text);
			}
			catch (System.Net.Sockets.SocketException ex)
			{
				MessageBox.Show(this, "Unable to contact the server." + Environment.NewLine + Environment.NewLine  + ex.Message + " (" + ex.GetType().Name + ")", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			catch (Exception ex)
			{
				MessageBox.Show(this, "Unable to login: " + ex.Message + " (" + ex.GetType().Name + ")", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			finally
			{
				Cursor.Current = Cursors.Default;
			}
			return null;
		}
		
		internal SednaSession GetSession()
		{	
			return session;
		}
		
		private void DatabaseTextBox_DropDown(object sender, System.EventArgs e)
		{
			// try to connect to the server and get a list of databases.
			SednaSession session = AttemptLogin();
			if (session!=null)
			{
				session.Close();
			}
           
		}

		private void LoginButton_Click(object sender, System.EventArgs e)
		{
            if (txtUserName.Text.Trim() == "")
                txtUserName.Focus();
            else if (txtUserPassword.Text.Trim() == "")
                txtUserPassword.Focus();
            else if (Users.CheckLogin(txtUserName.Text, txtUserPassword.Text))
            {
                session = AttemptLogin();
                if (session != null)
                {
                    DialogResult = DialogResult.OK;
                    Hide();
                }
            }
            else
            {
                MessageBox.Show("Login Faild, Please Check Name and Password");
                txtUserPassword.Text = "";
                txtUserPassword.Focus();
            }
		}

		private void Login_Load(object sender, System.EventArgs e)
		{

        }

		private void ServerTextBox_TextChanged(object sender, System.EventArgs e)
		{
		
		}

        private void Login_FormClosed(object sender, FormClosedEventArgs e)
        {


        }

        private void CancelButton_Click(object sender, EventArgs e)
        {

        }
	}
}
