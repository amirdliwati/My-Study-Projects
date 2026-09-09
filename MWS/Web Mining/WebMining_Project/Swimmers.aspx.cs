using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Swimmers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SwimmerGV_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbn = (Label)e.Row.Cells[0].FindControl("Label1");
            GridView SwimmerTeamChild = (GridView)e.Row.FindControl("SwimmerTeamGV");
            Functions f = new Functions();
            SwimmerTeamChild.DataSource = f.GetSwimmerTeam(lbn.Text);
            SwimmerTeamChild.DataBind();

            GridView SwimInChild = (GridView)e.Row.FindControl("SwimInGV");
            SwimInChild.DataSource = f.GetSwimInPool(lbn.Text);
            SwimInChild.DataBind();
        }
    }
}