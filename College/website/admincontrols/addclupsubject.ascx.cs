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

public partial class admincontrols_addclupsubject : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RegularExpressionValidator1.IsValid)
        {
            dataaccess da = new dataaccess();
            da.opencon();
            Label1.Text = da.addclupsubject(titel.Text, text.Text, date.Text, active.SelectedValue, int.Parse(subject.SelectedValue));
            da.closecon();
            Label1.Visible = true;
        }
    }
}
