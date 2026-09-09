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

public partial class exam : System.Web.UI.Page
{
    public string quastionmark(int fanser, string first, int sanser, string second, int thanser, string third, int foanser, string fourth,int qid)
    {
        Boolean check = true;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        string sql = "select  true from anser where anid=" + fanser.ToString() ;
        SqlCommand checkcmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (reader.Read())
        {
            if (reader["true"].ToString() !=first)
                check = false;
        }
        reader.Close();
        con.Close();
        sql = "select  true from anser where anid=" + sanser.ToString();
        checkcmd .CommandText=sql;
        con.Open();
        reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);
        
        while (reader.Read())
        {
            if (reader["true"].ToString() != second)
                check = false;
        }
        reader.Close();
        con.Close();
        sql = "select  true from anser where anid=" + thanser.ToString();
        checkcmd.CommandText = sql;
        con.Open();
        reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {
            if (reader["true"].ToString() != third)
                check = false;
        }
        reader.Close();
        con.Close();
        sql = "select  true from anser where anid=" + foanser.ToString();
        checkcmd.CommandText = sql;
        con.Open();
        reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {
            if (reader["true"].ToString() != fourth)
                check = false;
        }
        reader.Close();
        con.Close();
        int mark = 0;
        if (check)
        {
            sql = "select  qgrade from quastion where qid=" + qid.ToString();
            checkcmd.CommandText = sql;
            con.Open();
            reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (reader.Read())
            {
                mark = reader.GetInt32(0);
            }
            reader.Close();
            con.Close();
        }
        return(mark.ToString());
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null )
            if( Session["usertype"].ToString() != "student")
            Response.Redirect("default.aspx");
        SqlDataSource1.DataBind();
        if (ListBox1.SelectedIndex == -1)
        {
            ListBox1.DataBind();
            if (ListBox1.Items.Count > 0)
                ListBox1.SelectedIndex = 0;
        }
        SqlDataSource2.DataBind();
        if (ListBox2.SelectedIndex == -1)
        {
            ListBox2.DataBind();
            if (ListBox2.Items.Count > 0)
                ListBox2.SelectedIndex = 0;
            if (ListBox2.SelectedIndex == -1)
                Response.Redirect("student.aspx");
        }
        SqlDataSource3.DataBind();
        if (ListBox3.SelectedIndex == -1)
        {
            ListBox3.DataBind();
            if (ListBox3.Items.Count > 0)
            
                ListBox3.SelectedIndex = 0;
                if (ListBox3.SelectedIndex == -1)
                    Response.Redirect("student.aspx");
            
        }

        
        

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (RequiredFieldValidator1.IsValid && RequiredFieldValidator3.IsValid && RequiredFieldValidator3.IsValid)
            Panel1.Visible = false;
        if (ListBox4.Items.Count == 0 && ListBox3.SelectedIndex != -1)
        {
            int i = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            string sql = "SELECT quastion.qid FROM quastion INNER JOIN quastion_examform ON quastion.qid = quastion_examform.qid WHERE (quastion_examform.efid =" + ListBox3.SelectedValue + ")";
            SqlCommand checkcmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (reader.Read())
            {
                ListItem item = new ListItem();
                i = 1 + i;
                item.Text = i.ToString();
                item.Value = reader["qid"].ToString();
                ListBox4.Items.Add(item);

            }
            ListBox4.Rows = i;
            i = 0;
            reader.Close();
            con.Close();
            ListBox4.SelectedIndex = 0;
            sql = "SELECT qtype,multy FROM quastion WHERE (qid =" + ListBox4.SelectedValue + ")";
            checkcmd.CommandText = sql;
            con.Open();
            reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (reader.Read())
            {
                if (reader["qtype"].ToString() == "written")
                {
                    CheckBoxList1.Visible = false;
                    RadioButtonList1.Visible = false;
                    TextBox1.Visible = true;
                }
                else
                {
                    if (reader["multy"].ToString() == "multy")
                    {
                        CheckBoxList1.Visible = true;
                        RadioButtonList1.Visible = false;
                        TextBox1.Visible = false;
                    }
                    else
                    {
                        CheckBoxList1.Visible = false;
                        RadioButtonList1.Visible = true;
                        TextBox1.Visible = false;
                    }
                }
            }
                    reader.Close();
                    con.Close();
                }
        
        Panel2.Visible = true;
    }
    protected void ListBox4_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        string sql = "SELECT qtype,multy FROM quastion WHERE (qid =" + ListBox4.SelectedValue + ")";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {
            if (reader["qtype"].ToString() == "written")
            {
                CheckBoxList1.Visible = false;
                RadioButtonList1.Visible = false;
                TextBox1.Visible = true;
            }
            else
            {
                if (reader["multy"].ToString() == "multy")
                {
                    CheckBoxList1.Visible = true;
                    RadioButtonList1.Visible = false;
                    TextBox1.Visible = false;
                }
                else
                {
                    CheckBoxList1.Visible = false;
                    RadioButtonList1.Visible = true;
                    TextBox1.Visible = false;
                }
            }
        }

        reader.Close();
        con.Close();
        SqlDataSource5.DataBind();
        CheckBoxList1.DataBind();
        RadioButtonList1.DataBind();
        sql = "select anser, sid, qid, exid, first, sec, thi,fou from writeanser where sid=" + Session["id"] + " and qid=" + ListBox4.SelectedValue + " and exid=" + ListBox2.SelectedValue;
        checkcmd.CommandText = sql;
        con.Open();
        reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (reader.Read())
        {
            if (RadioButtonList1.Visible)
            {
                if (reader["first"].ToString() == "true")
                    RadioButtonList1.SelectedIndex = 0;
                if (reader["sec"].ToString() == "true")
                    RadioButtonList1.SelectedIndex = 1;
                if (reader["thi"].ToString() == "true")
                    RadioButtonList1.SelectedIndex = 2;
                if (reader["fou"].ToString() == "true")
                    RadioButtonList1.SelectedIndex = 3;
            }
            if (CheckBoxList1.Visible)
            {
                if (reader["first"].ToString() == "true")
                    CheckBoxList1.Items[0].Selected = true;
                if (reader["sec"].ToString() == "true")
                    CheckBoxList1.Items[1].Selected = true;
                if (reader["thi"].ToString() == "true")
                    CheckBoxList1.Items[2].Selected = true;
                if (reader["fou"].ToString() == "true")
                    CheckBoxList1.Items[3].Selected = true;
            }
            if (TextBox1.Visible)
                TextBox1.Text = reader["anser"].ToString();
        }

        reader.Close();
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        string sql = "select  sid, qid, exid from writeanser where sid=" + Session["id"] + " and qid=" + ListBox4.SelectedValue + " and exid=" + ListBox2.SelectedValue;
        SqlCommand checkcmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);
        Boolean check = true; 
        while (reader.Read())
        {
            if (reader["sid"].ToString() == Session["id"].ToString() && reader["qid"].ToString() == ListBox4.SelectedValue && reader["exid"].ToString() == ListBox2.SelectedValue)
                check = false;
        }
        reader.Close();
        con.Close();

        sql = "INSERT INTO writeanser(anser, sid, qid, exid, first, sec, thi, fou, mark) VALUES (,,,,,,,,)";

        string first = "false";
        string second = "false";
        string third = "false";
        string fourth = "false"; 
        if (RadioButtonList1.Visible)
        {

            if (RadioButtonList1.Items[0].Selected)
                first = "true";
            else first = "false";
            if (RadioButtonList1.Items[1].Selected)
                second = "true";
            else second = "false";
            if (RadioButtonList1.Items[2].Selected)
                third = "true";
            else third = "false";
            if (RadioButtonList1.Items[3].Selected)
                fourth = "true";
            else fourth = "false";
            if (check)
                sql = "INSERT INTO writeanser(anser, sid, qid, exid, first, sec, thi, fou,mark) VALUES ('null'," + Session["id"] + "," + ListBox4.SelectedValue + "," + ListBox2.SelectedValue + ",'" + first + "','" + second + "','" + third + "','" + fourth + "'," + quastionmark(int.Parse(RadioButtonList1.Items[0].Value), first, int.Parse(RadioButtonList1.Items[1].Value), second, int.Parse(RadioButtonList1.Items[2].Value), third, int.Parse(RadioButtonList1.Items[3].Value), fourth, int.Parse(ListBox4.SelectedValue)) + ")";
            else
                sql = "UPDATE writeanser SET anser ='null',first='" + first + "', sec ='" + second + "', thi ='" + third + "', fou ='" + fourth + "', mark=" + quastionmark(int.Parse(RadioButtonList1.Items[0].Value), first, int.Parse(RadioButtonList1.Items[1].Value), second, int.Parse(RadioButtonList1.Items[2].Value), third, int.Parse(RadioButtonList1.Items[3].Value), fourth, int.Parse(ListBox4.SelectedValue)) + " where sid=" + Session["id"] + " and qid=" + ListBox4.SelectedValue + " and exid=" + ListBox2.SelectedValue;

        }
        if (CheckBoxList1.Visible)
        {
             first = "false";
            second = "false";
            third = "false";
            fourth = "false";
            if (CheckBoxList1.Items[0].Selected)
                first = "true";
            else first = "false";
            if (CheckBoxList1.Items[1].Selected)
                second = "true";
            else second = "false";
            if (CheckBoxList1.Items[2].Selected)
                third = "true";
            else third = "false";
            if (CheckBoxList1.Items[3].Selected)
                fourth = "true";
            else fourth = "false";
            if(check)
                sql = "INSERT INTO writeanser(anser, sid, qid, exid, first, sec, thi, fou,mark) VALUES ('null'," + Session["id"] + "," + ListBox4.SelectedValue + "," + ListBox2.SelectedValue + ",'" + first + "','" + second + "','" + third + "','" + fourth + "'," + quastionmark(int.Parse(CheckBoxList1.Items[0].Value), first, int.Parse(CheckBoxList1.Items[1].Value), second, int.Parse(CheckBoxList1.Items[2].Value), third, int.Parse(CheckBoxList1.Items[3].Value), fourth, int.Parse(ListBox4.SelectedValue)) + ")";
            else
                sql = "UPDATE writeanser SET anser ='null',first='" + first + "', sec ='" + second + "', thi ='" + third + "', fou ='" + fourth + "',mark=" + quastionmark(int.Parse(CheckBoxList1.Items[0].Value), first, int.Parse(CheckBoxList1.Items[1].Value), second, int.Parse(CheckBoxList1.Items[2].Value), third, int.Parse(CheckBoxList1.Items[3].Value), fourth, int.Parse(ListBox4.SelectedValue)) + " where sid=" + Session["id"] + " and qid=" + ListBox4.SelectedValue + " and exid=" + ListBox2.SelectedValue;
       
        }
        if(TextBox1.Visible)
            if(check)
            sql = "INSERT INTO writeanser(anser, sid, qid, exid, first, sec, thi, fou,mark) VALUES ('"+TextBox1.Text+"'," + Session["id"] + "," + ListBox4.SelectedValue + "," + ListBox2.SelectedValue + ",'false','false','false','false',0)";
            else
            sql = "UPDATE writeanser SET anser ='" + TextBox1.Text + "',first='false', sec ='false', thi ='false', fou ='false', mark=0 where sid=" + Session["id"] + " and qid=" + ListBox4.SelectedValue + " and exid=" + ListBox2.SelectedValue;
        checkcmd.CommandText = sql ;
        con.Open();
        checkcmd.ExecuteNonQuery(); ;
        con.Close();
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        string sql = "SELECT mark FROM writeanser WHERE (sid="+Session["id"].ToString()+") and (exid="+ListBox2.SelectedValue+")";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);
        int mark = 0;
        while (reader.Read())
        {
            mark = mark + reader.GetInt32(0);   
        }
        
        reader.Close();
        con.Close();
        sql = "INSERT INTO result(result, sid, exid) VALUES ("+mark.ToString()+","+Session["id"].ToString() +","+ ListBox2.SelectedValue+")";
        checkcmd.CommandText = sql;
        con.Open();
        checkcmd.ExecuteNonQuery(); 
        con.Close();
        Panel3.Visible = true;
        Panel2.Visible = false;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session["brows"] = "true";
        Response.Redirect("Default.aspx");
    }
}
