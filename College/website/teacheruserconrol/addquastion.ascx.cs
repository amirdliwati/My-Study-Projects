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
public partial class teacheruserconrol_addquastion : System.Web.UI.UserControl
{
    Boolean check = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        if (ListBox2.SelectedValue == "single")
        {
            RadioButton1.GroupName = "1";
            RadioButton2.GroupName = "1";
            RadioButton3.GroupName = "1";
            RadioButton4.GroupName = "1";
            
        }
        else
        {
            RadioButton1.GroupName = "";
            RadioButton2.GroupName = "";
            RadioButton3.GroupName = "";
            RadioButton4.GroupName = "";
        }
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ListBox1.SelectedIndex == 1)
        {
            ListBox2.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RequiredFieldValidator6.Enabled = false;
            RequiredFieldValidator7.Enabled = false;
            TextBox3.Enabled = false;
            TextBox4.Enabled = false;
            TextBox5.Enabled = false;
            TextBox6.Enabled = false;
            RadioButton1.Enabled = false;
            RadioButton2.Enabled = false;
            RadioButton3.Enabled = false;
            RadioButton4.Enabled = false;
        }
        else
        {
            ListBox2.Enabled = true;
            RequiredFieldValidator4.Enabled = true;
            RequiredFieldValidator5.Enabled = true;
            RequiredFieldValidator6.Enabled = true;
            RequiredFieldValidator7.Enabled = true;
            TextBox3.Enabled = true;
            TextBox4.Enabled = true;
            TextBox5.Enabled = true;
            TextBox6.Enabled = true;
            RadioButton1.Enabled = true;
            RadioButton2.Enabled = true;
            RadioButton3.Enabled = true;
            RadioButton4.Enabled = true;
        }
    }
    protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ListBox2.SelectedIndex == 0)
        {
            RadioButton1.GroupName = "1";
            RadioButton2.GroupName = "1";
            RadioButton3.GroupName = "1";
            RadioButton4.GroupName = "1";
            RadioButton1.Checked = true;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton4.Checked = false;
        }
        else
        {
            RadioButton1.GroupName = "";
            RadioButton2.GroupName = "";
            RadioButton3.GroupName = "";
            RadioButton4.GroupName = "";
        }
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (ListBox1.SelectedIndex == 1)
        {
            if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RangeValidator1.IsValid)
            {
                dataaccess da = new dataaccess();
                da.opencon();
                Label1.Text = da.addquastion(TextBox1.Text, ListBox1.SelectedValue, ListBox2.SelectedValue, int.Parse(TextBox2.Text), int.Parse(ListBox3.SelectedValue));
                da.closecon();
                Label1.Visible = true;
            }
        }
        if (ListBox1.SelectedIndex == 0)
        {
            if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RangeValidator1.IsValid&&RequiredFieldValidator4.IsValid&&RequiredFieldValidator5.IsValid&&RequiredFieldValidator6.IsValid&&RequiredFieldValidator7.IsValid)
            {
                dataaccess da = new dataaccess();
                da.opencon();
                Label1.Text = da.addquastion(TextBox1.Text, ListBox1.SelectedValue, ListBox2.SelectedValue, int.Parse(TextBox2.Text), int.Parse(ListBox3.SelectedValue));
                da.closecon();
                Label1.Visible = true;
                int qid = 0;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
                string sql = "select qid from quastion where qtext like '" + TextBox1.Text + "'";
                SqlCommand checkcmd = new SqlCommand(sql, con);
                con.Open();
                SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (reader.Read())
                {

                    qid = reader.GetInt32(0);

                }
                reader.Close();
                con.Close();
                string truee="false";
                if(RadioButton1.Checked)
                    truee="true";
                da.opencon();
                Label1.Text = Label1.Text + "  " + da.addanswer(TextBox3.Text, truee, qid);
                truee = "false";
                da.closecon();
                if (RadioButton2.Checked)
                    truee = "true";
                da.opencon();
                Label1.Text = Label1.Text + "  " + da.addanswer(TextBox4.Text, truee, qid);
                da.closecon();
                truee = "false";
                if (RadioButton3.Checked)
                    truee = "true";
                da.opencon();
                Label1.Text = Label1.Text + "  " + da.addanswer(TextBox5.Text, truee, qid);
                da.closecon();
                truee = "false";
                if (RadioButton4.Checked)
                    truee = "true";
                da.opencon();
                Label1.Text = Label1.Text + "  " + da.addanswer(TextBox6.Text, truee, qid);
                truee = "false";
                da.closecon();
                Label1.Visible = true;
            }
        }

    }
}
