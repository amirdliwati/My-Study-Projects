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

public partial class teacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "true" && Session["usertype"]!="teacher")
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
        Addexam1.Visible = true;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Correctansewr1.Visible = false;
        Studentmarks1.Visible = false;
        Addlesson1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Addexam1.Visible = false;
        Addexamform1.Visible = true;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Correctansewr1.Visible = false;
        Studentmarks1.Visible = false;
        Addlesson1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = true;
        Addformquastion1.Visible = false;
        Correctansewr1.Visible = false;
        Studentmarks1.Visible = false;
        Addlesson1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = true;
        Correctansewr1.Visible = false;
        Studentmarks1.Visible = false;
        Addlesson1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Correctansewr1.Visible = true;
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Studentmarks1.Visible = false;
        Addlesson1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Studentmarks1.Visible = true;
        Correctansewr1.Visible = false;
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Addlesson1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Addlesson1.Visible = true;
        Studentmarks1.Visible = false;
        Correctansewr1.Visible = false;
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        Changpass1.Visible = true;
        Addlesson1.Visible = false;
        Studentmarks1.Visible = false;
        Correctansewr1.Visible = false;
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Advertisingcontent1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Advertisingcontent1.Visible = true;
        Changpass1.Visible = false;
        Addlesson1.Visible = false;
        Studentmarks1.Visible = false;
        Correctansewr1.Visible = false;
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Addadvertising1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        Addadvertising1.Visible = true;
        Advertisingcontent1.Visible = false;
        Changpass1.Visible = false;
        Addlesson1.Visible = false;
        Studentmarks1.Visible = false;
        Correctansewr1.Visible = false;
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Activeexam1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        Activeexam1.Visible = true;
        Addadvertising1.Visible = false;
        Advertisingcontent1.Visible = false;
        Changpass1.Visible = false;
        Addlesson1.Visible = false;
        Studentmarks1.Visible = false;
        Correctansewr1.Visible = false;
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
        Activeexamform1.Visible = false;
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        Activeexamform1.Visible = true;
        Activeexam1.Visible = false;
        Addadvertising1.Visible = false;
        Advertisingcontent1.Visible = false;
        Changpass1.Visible = false;
        Addlesson1.Visible = false;
        Studentmarks1.Visible = false;
        Correctansewr1.Visible = false;
        Addexam1.Visible = false;
        Addexamform1.Visible = false;
        Addquastion1.Visible = false;
        Addformquastion1.Visible = false;
    }
}
