using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class admincontrols_addteachersubject : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        SqlDataSource1.DataBind();
        SqlDataSource2.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid && RegularExpressionValidator1.IsValid)
        {
            dataaccess da = new dataaccess();
            da.opencon();
           Label1.Text= da.addsubjectstudent(int.Parse( subject.SelectedValue),int.Parse(student.SelectedValue),year.Text,active.SelectedValue);
           da.closecon();
           Label1.Visible = true;
        }
    }
}
