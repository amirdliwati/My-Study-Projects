using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.ServiceReference1;

namespace MyWeb
{
    public partial class Add_A_Company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MyCompanyClient c = new MyCompanyClient("BasicEndpoint");
            MyCompany m = new MyCompany();
            m.FullName = TextBox1.Text;
            m.tel = Convert.ToInt32(TextBox2.Text);
            m.login = TextBox3.Text;
            m.password = TextBox4.Text;
            if (c.AddCompany(m))
                Label1.Text = "Added";
            else
                Label1.Text = "Not Added";
            
        }
    }
}