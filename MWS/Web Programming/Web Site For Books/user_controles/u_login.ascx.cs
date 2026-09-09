using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class user_controles_u_login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {    
        
        HttpCookie cook = new HttpCookie("nam");
        cook["custmer"] = TextBox1.Text;
        Response.Cookies.Add(cook);
        cook.Expires = DateTime.Now.AddYears(1);


        AWPDataSetTableAdapters.loginTableAdapter ta = new AWPDataSetTableAdapters.loginTableAdapter();
        AWPDataSet.loginDataTable dt = ta.GetDataByCheck(TextBox1.Text, TextBox2.Text, DropDownList1.Text);
        if (dt == null || dt.Rows.Count == 0)
        {
            Label10.Visible = true;
            Label10.Text = "User Name Or Password Is Wrong";
        }
        else
        {
            if (DropDownList1.SelectedValue == "Custmer")
                Response.Redirect("Customer/Custmer.aspx");
            else
                Response.Redirect("Admin/Admin.aspx");
        }

        
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("SignUp.aspx");
    }
}