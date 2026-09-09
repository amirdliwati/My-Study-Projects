using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for dataaccess
/// </summary>
public class dataaccess
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    public void opencon()
    {
        con.Open();
    }
    public void closecon()
    {
        con.Close();
    }
    public string addadvertising(string title, string text, string date)
    {
        Boolean check = true;
        string view = "";

        string sql = "select titel from advertising where titel='" + title + "'";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["titel"].ToString() == title)
            {
                check = false;
                view = "advertising titel is exist try another one";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addadvertising", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@titel", title);
            cmd.Parameters.AddWithValue("@text", text);
            cmd.Parameters.AddWithValue("@date", date);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " advertising ";

        }
        return (view);
    }
    public string adddept(string dname)
    {
        Boolean check = true;
        string view = "";

        string sql = "select dname from dept where dname='" + dname + "'";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["dname"].ToString() == dname)
            {
                check = false;
                view = "department name is exist try another one";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("adddept", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dname", dname);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " department ";

        }
        return (view);
    }
    public string addsubject(string suname,int suyear,string active)
    {
        Boolean check = true;
        string view = "";

        string sql = "select suname from subject where suname='" + suname + "'";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["suname"].ToString() == suname)
            {
                check = false;
                view = "subject name is exist try another one";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addsubject", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@suname", suname);
            cmd.Parameters.AddWithValue("@suyear", suyear);
            cmd.Parameters.AddWithValue("@active", active);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " subject ";

        }
        return (view);
    }
    public string addsubjectteacher(int suid,int tid,string year,string active)
    {
        Boolean check = true;
        string view = "";

        string sql = "select suid,tid,year from teacher_subject where suid=" + suid + " and tid=" + tid+" and year ='"+year+"'";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader.GetInt32(0) == suid && reader.GetInt32(1)==tid && reader["year"].ToString()==year)
            {
                check = false;
                view = "subject has been added to this teacher";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addteacher_subject", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@suid", suid);
            cmd.Parameters.AddWithValue("@tid", tid);
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@active", active);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " subject to teacher ";

        }
        return (view);
    }
    public string addteacher(string fname,string lname,string username,string pass,string birthdate,string email,string phon,string active,string sex)
    {
        Boolean check = true;
        string view = "";

        string sql = "select fname,lname from teacher where fname='" + fname + "' and lname=" + lname;
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["fname"].ToString()==fname && reader["lname"].ToString()==lname)
            {
                check = false;
                view = "teacher name is exist try another one";
            }

        }
        reader.Close();
        closecon();
        opencon();
        sql = "select username from teacher where username='" + username +"'";
        checkcmd.CommandText = sql;
        reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["username"].ToString() == username)
            {
                check = false;
                view = "username is exist try another one";
            }

        }
        reader.Close();
        closecon();
        opencon();
        sql = "select email from teacher where email='" + email + "'";
        checkcmd.CommandText = sql;
        reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["email"].ToString() == email)
            {
                check = false;
                view = "email adress is exist try another one";
            }

        }
        reader.Close();
        closecon();
        opencon();
        sql = "select phon from teacher where phon='" + phon + "'";
        checkcmd.CommandText = sql;
        reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["phon"].ToString() == phon)
            {
                check = false;
                view = "phon number is exist try another one";
            }

        }
        reader.Close();
        closecon();
        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addteacher", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fname", fname);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@pass", pass);
            cmd.Parameters.AddWithValue("@sex", sex);
            cmd.Parameters.AddWithValue("@birthdate", birthdate);
            cmd.Parameters.AddWithValue("@phon", phon);
            cmd.Parameters.AddWithValue("@lname", lname);
            cmd.Parameters.AddWithValue("@active", active);
            cmd.Parameters.AddWithValue("@email", email);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " subject to student ";

        }
        return (view);
    }
    public string addsubjectstudent(int suid, int sid, string year, string active)
    {
        Boolean check = true;
        string view = "";

        string sql = "select suid,sid,year from subject_student where suid=" + suid + " and sid=" + sid + " and year ='" + year + "'";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader.GetInt32(0) == suid && reader.GetInt32(1) == sid && reader["year"].ToString() == year)
            {
                check = false;
                view = "subject has been added to this student";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addsubject_student", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@suid", suid);
            cmd.Parameters.AddWithValue("@sid", sid);
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@active",active);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " subject to student ";

        }
        return (view);
    }
    public string addclupsubject(string subtitel, string subtext, string date,string active,int suid)
    {
        Boolean check = true;
        string view = "";

        string sql = "select subtitel from clupsubject where subtitel='" + subtitel + "' and suid="+suid.ToString();
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["subtitel"].ToString() == subtitel)
            {
                check = false;
                view = "subject titel is exist try another one";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addclupsubject", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@subtitel", subtitel);
            cmd.Parameters.AddWithValue("@subtext", subtext);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@active", active);
            cmd.Parameters.AddWithValue("@suid", suid);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " subject ";

        }
        return (view);
    }
    public string updateclupsubject(string subtitel, string subtext, string date, string active, int suid,int cbid)
    {
        Boolean check = true;
        string view = "";

        string sql = "select subtitel from clupsubject where subtitel='" + subtitel + "' and suid=" + suid.ToString()+" and cbid<>"+cbid;
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["subtitel"].ToString() == subtitel)
            {
                check = false;
                view = "subject titel is exist try another one";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("updateclupsubject", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@subtitel", subtitel);
            cmd.Parameters.AddWithValue("@subtext", subtext);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@active", active);
            cmd.Parameters.AddWithValue("@suid", suid);
            cmd.Parameters.AddWithValue("@cbid", cbid);
            view = "update " + (cmd.ExecuteNonQuery().ToString()) + " subject ";

        }
        return (view);
    }
    public string addquastion(string text,string type, string multy,int grade,int suid)
    {
        
            SqlCommand cmd = new SqlCommand("addquastion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@text", text);
            cmd.Parameters.AddWithValue("@type", type);
            cmd.Parameters.AddWithValue("@multy", multy);
            cmd.Parameters.AddWithValue("@grade", grade);
            cmd.Parameters.AddWithValue("@suid", suid);
           string view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " quastion ";

       
        return (view);
    }
    public string addanswer(string text, string truee, int qid)
    {
        Boolean check = true;
        string view = "";

        string sql = "select antext from anser where antext='" + text + "'";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["antext"].ToString() == text)
            {
                check = false;
                view = "answer text is exist try another one";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addanswer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@text", text);
            cmd.Parameters.AddWithValue("@true", truee);
            cmd.Parameters.AddWithValue("@qid", qid);

            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " anser ";

        }
        return (view);
    }
    public string addformquastion(int qid, int efid)
    {
        Boolean check = true;
        string view = "";

        string sql = "select qid,efid from quastion_examform where qid=" + qid.ToString() + " and efid=" +efid.ToString() ;
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader.GetInt32(0) == qid && reader.GetInt32(1) == efid )
            {
                check = false;
                view = "quastion has been added to this form";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addformquastio", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@qid", qid);
            cmd.Parameters.AddWithValue("@efid", efid);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " quastion to form ";

        }
        return (view);
    }
    public string addlesson(string liname, string liurl,int suid)
    {
        Boolean check = true;
        string view = "";

        string sql = "select lisname from lisson where lisname='" + liname + "' and suid=" + suid.ToString();
        SqlCommand checkcmd = new SqlCommand(sql, con);
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["lisname"].ToString()==liname)
            {
                check = false;
                view = "lisson name is exist";
            }

        }
        reader.Close();
        closecon();

        if (check)
        {
            opencon();
            SqlCommand cmd = new SqlCommand("addlisson", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@lisname", liname);
            cmd.Parameters.AddWithValue("@lisurl", liurl);
            cmd.Parameters.AddWithValue("@suid", suid);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " lisson ";

        }
        return (view);
    }
    public string updateresult(int sid,int exid,int qumark,int qid )
    {
        string view = "";
        SqlCommand cmd = new SqlCommand("updateanswermark", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@sid", sid);
        cmd.Parameters.AddWithValue("@exid", exid);
        cmd.Parameters.AddWithValue("@mark", qumark);
        cmd.Parameters.AddWithValue("@qid", qid);
        cmd.ExecuteNonQuery();
        string sql = "SELECT mark FROM writeanser WHERE (sid=" + sid.ToString() + ") and (exid=" + exid.ToString() + ")";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);
        int mark = 0;
        while (reader.Read())
        {
            mark = mark + reader.GetInt32(0);
        }

        reader.Close();

        opencon();
            SqlCommand cmd1 = new SqlCommand("updatemark", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@sid", sid);
            cmd1.Parameters.AddWithValue("@exid", exid);
            cmd1.Parameters.AddWithValue("@result", mark);
            view = "correct " + (cmd1.ExecuteNonQuery().ToString()) + " answer ";

        
        return (view);
    }
    public string changpass(string type, int id, string pass)
    {
        string view = "";
        SqlCommand cmd = new SqlCommand("changpass", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@type", type);
            cmd.Parameters.AddWithValue("@pass", pass);
            cmd.Parameters.AddWithValue("@id", id);
            
            view = "changed " + (cmd.ExecuteNonQuery().ToString()) + " password ";

        
        return (view);
    }
    public string addreply(string text,DateTime time,string active ,int cbid,int sid)
    {
        string view = "";
        SqlCommand cmd = new SqlCommand("addreply", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@retext", text);
            cmd.Parameters.AddWithValue("@date", time);
            cmd.Parameters.AddWithValue("@active", active);
            cmd.Parameters.AddWithValue("@cbid", cbid);
            cmd.Parameters.AddWithValue("@sid", sid);
            view = "inserted " + (cmd.ExecuteNonQuery().ToString()) + " reply ";

       
        return (view);
    }
}
