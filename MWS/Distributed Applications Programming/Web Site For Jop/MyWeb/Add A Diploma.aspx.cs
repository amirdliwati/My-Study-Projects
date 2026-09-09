using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.ServiceReference1;

namespace MyWeb
{
    public partial class Add_A_Diploma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MyCompanyClient c = new MyCompanyClient("BasicEndpoint");
            MyCompany m = new MyCompany();
            m.ID = Convert.ToInt32(TextBox1.Text);
            m.DiplomaTitle = TextBox2.Text;
            if (c.AddDiplomaForCandidate(m))
                Label1.Text = "Added";
            else
                Label1.Text = "Not Added";
        }
    }
}