using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AnalysisServices.AdomdClient;

public partial class admin_controles_Forecast : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtPeriod.Focus();
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        AdomdConnection con = new AdomdConnection("Data Source=localhost;catalog=FreqBoughtTogether");
        con.Open();
        AdomdCommand cmd = con.CreateCommand();

        string s = @"Select Flattened
PredictTimeSeries
([Total Sales], {0})
From SalesSeries_MM";
        s = string.Format(s, txtPeriod.Text);
        cmd.CommandText = s;
        GridView2.DataSource = cmd.Execute();
        GridView2.DataBind();
        con.Close();
    }


    
}