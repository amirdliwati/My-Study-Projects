using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyLibrary;

namespace MyWeb
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            object x = Activator.GetObject(typeof(MyLibrary.ISignin),
           "http://127.0.0.1:9000/SvuCompany/MyRemoteObject");

            ISignin c = (ISignin)x;
            Signin m = new Signin();
            m.LoginName = TextBox1.Text;
            m.LoginPassword = TextBox2.Text;


            if (c.GetLoginPassword(m))
            {
                Label1.Text = "successfully";
                
            }
            else
                Label1.Text = "Faild";
        }

       
    }
}
