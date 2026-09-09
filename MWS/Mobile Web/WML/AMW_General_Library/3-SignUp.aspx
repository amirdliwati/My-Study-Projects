<%@ Page Language="C#" AutoEventWireup="true" CodeFile="3-SignUp.aspx.cs" Inherits="_3_SignUp" %>
<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">
<% 
    Response.ContentType = "text/vnd.wap.wml";
%>
<wml>
<head>


</head>
<card>
<%  
    string Username = Request["userName"];
    string password = Request["password"];
    string FName = Request["FName"];
    string LName = Request["LName"];
    
    string connectionstring = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
    string sql = "select * from[User] where Username=@Username";
       
    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionstring);
    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sql, con);
    cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Username", System.Data.SqlDbType.NVarChar, 20));
    cmd.Parameters["@Username"].Value = Username;  
    con.Open();
    System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
    if (reader.Read())
    {
        Response.Write("This User Name is <b>Not Available</b><br/>");
        Response.Write("Please try Another One<br/>");
        Response.Write("<anchor>go to previous page <prev /></anchor>");
        reader.Close();
    }
    else
    {
        reader.Close();

        string insert = "insert into [User] (Username, password, FName, LName) values (@Username, @password, @FName, @LName)";

        System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand(insert, con);
        cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Username", System.Data.SqlDbType.NVarChar, 20));
        cmd2.Parameters["@Username"].Value = Username;
        cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@password", System.Data.SqlDbType.NVarChar, 8));
        cmd2.Parameters["@password"].Value = password;
        cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FName", System.Data.SqlDbType.NVarChar, 20));
        cmd2.Parameters["@FName"].Value = FName;
        cmd2.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LName", System.Data.SqlDbType.NVarChar, 20));
        cmd2.Parameters["@LName"].Value = LName;

        cmd2.ExecuteNonQuery();


        con.Close();
        Response.Write("Registered Successfully.<br/>");
        Response.Write("Please <a href='1-Home.aspx#Login'>login</a> now.<br/>");
    }
    %>
    </card>
</wml>
