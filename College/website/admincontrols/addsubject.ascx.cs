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

public partial class admincontrols_addsubject : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid )
        {
            dataaccess da = new dataaccess();
            da.opencon();
            Label1.Text = da.addsubject(subject.Text, int.Parse(year.SelectedValue), "active");
            da.closecon();
            Label1.Visible = true;
        }
    }
}
