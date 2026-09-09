using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Admin : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cook = Request.Cookies["nam"];

        if (cook != null)
        {
            Label1.Text = "Welcome" + "  " + cook["student"];


        }
    }





    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {   AddProgram1.Visible = false;
    ViewPrograms2.Visible = false;
    AddCourse1.Visible = false;
    ViewCourses1.Visible = false;
        VewRegisterd1.Visible = false;
   
        string x = TreeView1.SelectedNode.Value;
        switch(x)
        {
            case "Add New Program": AddProgram1.Visible = true; break;
            case "View All Programs": ViewPrograms2.Visible = true;  break;
            case "Add Course": AddCourse1.Visible = true;  break;
            case "View Courses": ViewCourses1.Visible = true; break;
            case "View Registered Student": VewRegisterd1.Visible = true; break;
           

            
            
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}
