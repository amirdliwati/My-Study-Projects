using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.ServiceReference1;

namespace MyWeb
{
    public partial class Add_A_Job : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MyCompanyClient c = new MyCompanyClient("WsEndpoint");
            MyCompany m = new MyCompany();
            m.ID = Convert.ToInt32(TextBox1.Text);
            m.Title = TextBox2.Text;
            m.Salary = Convert.ToDecimal(TextBox3.Text);
            m.RequiredEducationLevel = TextBox4.Text;
            m.RequiredExperienceYears = Convert.ToInt32(TextBox5.Text);

            if (c.AddJobForCompany(m))
                Label1.Text = "Added";
            else

                Label1.Text = "Not Added";
            
        }
    }
}