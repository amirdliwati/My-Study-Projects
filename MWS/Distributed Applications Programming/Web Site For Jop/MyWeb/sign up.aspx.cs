using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.ServiceReference1;

namespace MyWeb
{
    public partial class sign_up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MyCompanyClient c = new MyCompanyClient("WsEndpoint");
            MyCompany m = new MyCompany();
            m.login = TextBox1.Text;
            m.password = TextBox2.Text;
            m.FullName = TextBox3.Text;
            m.tel = Convert.ToInt32(TextBox4.Text);
            m.experienceYears = Convert.ToInt32(TextBox5.Text);
            if (c.SignUp(m))
                Label1.Text = "Successfully";
            else
                Label1.Text = "Faild";
        }
    }
}