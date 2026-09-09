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
public partial class teacheruserconrol_correctansewr : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.DataBind();
        if (subject.SelectedIndex == -1)
        {
            subject.DataBind();
            if (subject.Items.Count > 0)
                subject.SelectedIndex = 0;
        }
        SqlDataSource2.DataBind();
        if (exam.SelectedIndex == -1)
        {
            exam.DataBind();
            if (exam.Items.Count > 0)
                exam.SelectedIndex = 0;
        }
        SqlDataSource3.DataBind();
        if (student.SelectedIndex == -1)
        {
            student.DataBind();
            if (student.Items.Count > 0)
                student.SelectedIndex = 0;
        }
        SqlDataSource4.DataBind();
        if (quastion.SelectedIndex == -1)
        {
            quastion.DataBind();
            if (quastion.Items.Count > 0)
                quastion.SelectedIndex = 0;
        }
        SqlDataSource6.DataBind();
        FormView2.DataBind();
        SqlDataSource5.DataBind();
        FormView1.DataBind();
        Label1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RequiredFieldValidator4.IsValid && RequiredFieldValidator5.IsValid && RegularExpressionValidator1.IsValid)
        {
            dataaccess da = new dataaccess();
            da.opencon();
            Label1.Text = da.updateresult(int.Parse(student.SelectedValue), int.Parse(exam.SelectedValue), int.Parse(mark.Text), int.Parse(quastion.SelectedValue));
            da.closecon();
            Label1.Visible = true;
            
        }
    }
}
