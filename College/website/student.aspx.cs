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

public partial class student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "true" && Session["usertype"] != "student")
            Response.Redirect("default.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session["brows"] = "true";
        Response.Redirect("default.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("exam.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Viewlessons1.Visible = true;
        Viewmarks1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Viewmarks1.Visible = true;
        Viewlessons1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Changpass1.Visible = true;
        Viewmarks1.Visible = false;
        Viewlessons1.Visible = false;
        Advertisingcontent1.Visible = false;
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Advertisingcontent1.Visible = true;
        Changpass1.Visible = false;
        Viewmarks1.Visible = false;
        Viewlessons1.Visible = false;
    }
}
