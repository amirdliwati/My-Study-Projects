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

public partial class teacheruserconrol_addlesson : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        SqlDataSource1.DataBind();
        if (subject.SelectedIndex == -1)
        {
            subject.DataBind();
            if (subject.Items.Count > 0)
                subject.SelectedIndex = 0;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid)
        {
            string fiurl="c:/lissons/"+name.Text+FileUpload1.FileName;
            FileUpload1.SaveAs(fiurl);
            dataaccess da = new dataaccess();
            da.opencon();
            Label1.Text = da.addlesson(name.Text, fiurl, int.Parse(subject.SelectedValue));
            da.closecon();
            Label1.Visible = true;
        }
    }
}
