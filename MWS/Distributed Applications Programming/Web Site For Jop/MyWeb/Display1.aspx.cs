using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.ServiceReference1;

namespace MyWeb
{
    public partial class Display1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            MyCompanyClient c = new MyCompanyClient("WsEndpoint");
            MyCompany[] m = c.GetCandidate();
            for (int i = 0; i < m.Length; i++)
            {
                DropDownList1.Items.Add(m[i].FullName);
                DropDownList1.Items[i].Value = m[i].experienceYears.ToString();
            }
            Label1.Text = "Successfully";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {            
            MyCompanyClient c = new MyCompanyClient("WsEndpoint");           
            MyCompany[] m = c.GetJobForCandidates(Convert.ToInt32(DropDownList1.SelectedItem.Value));
            if (m.Length >= 1)
            {
                GridView1.DataSource = m;
                GridView1.DataBind();
                Label1.Text = "Successfully Search";
            }
            else
                Label1.Text = "UnSuccessfully Search";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            
        }
    }
}