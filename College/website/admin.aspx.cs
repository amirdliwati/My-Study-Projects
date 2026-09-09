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
public partial class admin : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "true" && Session["usertype"]!="admin")
            Response.Redirect("default.aspx");
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session["brows"] = "true";
        Response.Redirect("default.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = true;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
   
    protected void Button8_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = true;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = true;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = true;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = true;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = true;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = true;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = true;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = true;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = true;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = true;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = true;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = true;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        Activeteachersubject1.Visible = true;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changpass1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        Changpass1.Visible = true;
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Advertisingcontent1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        Advertisingcontent1.Visible = true;
        Advertisingcontent1.DataBind();
        Changpass1.Visible = false;
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Clupsubject1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button18_Click(object sender, EventArgs e)
    {
        Clupsubject1.Visible = true;
        Advertisingcontent1.Visible = false;
        Advertisingcontent1.DataBind();
        Changpass1.Visible = false;
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Activereplay1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button19_Click(object sender, EventArgs e)
    {
        Activereplay1.Visible = true;
        Clupsubject1.Visible = false;
        Advertisingcontent1.Visible = false;
        Advertisingcontent1.DataBind();
        Changpass1.Visible = false;
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changteacherpass1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button20_Click(object sender, EventArgs e)
    {
        Changteacherpass1.Visible = true;
        Activereplay1.Visible = false;
        Clupsubject1.Visible = false;
        Advertisingcontent1.Visible = false;
        Advertisingcontent1.DataBind();
        Changpass1.Visible = false;
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
        Changstudentpass1.Visible = false;
    }
    protected void Button21_Click(object sender, EventArgs e)
    {
        Changstudentpass1.Visible = true;
        Changteacherpass1.Visible = false;
        Activereplay1.Visible = false;
        Clupsubject1.Visible = false;
        Advertisingcontent1.Visible = false;
        Advertisingcontent1.DataBind();
        Changpass1.Visible = false;
        Activeteachersubject1.Visible = false;
        Addteachersubject1.Visible = false;
        Activestudentsubject1.Visible = false;
        Addstudentsubject1.Visible = false;
        Updateteacher1.Visible = false;
        Addteacher1.Visible = false;
        Updatestudent1.Visible = false;
        Addstudent1.Visible = false;
        Updatesubject1.Visible = false;
        Addsubject1.Visible = false;
        Updatedepartment1.Visible = false;
        Adddepartment1.Visible = false;
        Updateadvertising1.Visible = false;
        Addadvertising1.Visible = false;
    }
}
