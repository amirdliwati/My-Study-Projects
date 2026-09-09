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

public partial class teacheruserconrol_studentmarks : System.Web.UI.UserControl
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
        GridView1.DataBind();
    }
    protected void subject_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource2.DataBind();
        exam.DataBind();
            if (exam.Items.Count > 0)
                exam.SelectedIndex = 0;
        
        SqlDataSource3.DataBind();
        GridView1.DataBind();
    }
    protected void exam_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        GridView1.DataBind();
    }
}
