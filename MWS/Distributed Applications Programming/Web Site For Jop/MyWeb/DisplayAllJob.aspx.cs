using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyLibrary;


namespace MyWeb
{
    public partial class MainForm : System.Web.UI.Page
    {
        protected void Button1_Click1(object sender, EventArgs e)
        {
            object x1 = Activator.GetObject(typeof(MyLibrary.IMyCompany),
           "http://127.0.0.1:9000/SvuCompany/MyRemoteObject1");

            IMyCompany company = (IMyCompany)x1;
            GridView1.DataSource = company.getdata();
            GridView1.DataBind();
            Label1.Text = "Successfully";

        }

    }
}