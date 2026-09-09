using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportLibrary;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class DBpedia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    private void NoDataError(Label cell)
    {
        cell.Text = " No Data Available.";
        cell.Style.Add("Color", "Red");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = (string)GridView1.SelectedDataKey.Values["Resource"];
        int x = s.IndexOf("href");
        int y = s.IndexOf(">");
        Response.Redirect(s.Substring(x + 6, y - (x + 6 + 1)));
        
    }
    protected void SwimGV_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = (string)SwimGV.SelectedDataKey.Values["Resource"];
        int x = s.IndexOf("href");
        int y = s.IndexOf(">");
        Response.Redirect(s.Substring(x + 6, y - (x + 6 + 1)));

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 0)
        {
            GridView1.Visible = true;
        }
        else
        {
            GridView1.Visible = false;
        }
        if (RadioButtonList1.SelectedIndex == 1)
        {
            SwimGV.Visible = true;
        }
        else
        {
            SwimGV.Visible = false;
        }
        if (RadioButtonList1.SelectedIndex == 2)
        {
            BasketGV.Visible = true;
        }
        else
        {
            BasketGV.Visible = false;
        }
    }
    protected void BasketGV_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = (string)BasketGV.SelectedDataKey.Values["Resource"];
        int x = s.IndexOf("href");
        int y = s.IndexOf(">");
        Response.Redirect(s.Substring(x + 6, y - (x + 6 + 1)));

    }
}