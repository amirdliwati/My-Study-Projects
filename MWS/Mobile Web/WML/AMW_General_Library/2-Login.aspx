<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2-Login.aspx.cs" Inherits="_2_Login" %>
<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">

<wml>
<head>

</head>
<card>
<% 
    Response.ContentType = "text/vnd.wap.wml";

    string Username = Request["userName"];
    string password = Request["password"];

    string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);

    string query = "select * from [User] where Username=@Username and password= @password ";
    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);
    cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Username", System.Data.SqlDbType.NVarChar, 20));
    cmd.Parameters["@Username"].Value = Username;
    cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@password", System.Data.SqlDbType.NVarChar, 8));
    cmd.Parameters["@password"].Value = password;
 
    con.Open();
    System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
    try
    {
        int userId = 0;
        if (reader.Read())
        {
            string name = reader[3].ToString() + " " + reader[4].ToString();
            userId = (int)reader[0];
            
            Response.Write("<big><i>Welcome " + name + "</i></big> <br/><br/>");
            Response.Write("<b>Please chose one of these options:</b><br/><br/>");
            if (userId == 1) //admin
            {
                Response.Write("<anchor><go method='post' href='4-AddForms.aspx#AddBook'></go>Add Book </anchor> <br/><br/>");
                Response.Write("<anchor><go method='post' href='4-AddForms.aspx#AddPublisher'></go>Add Publisher</anchor> <br/><br/>");
                Response.Write("<anchor><go method='post' href='4-AddForms.aspx#AddAuthor'></go>Add Author</anchor> <br/><br/>");
            
            }
            Response.Write("<anchor><go method='post' href='7-AllBooks.aspx'></go>All Books </anchor> <br/><br/>");
            Response.Write("<anchor><go method='post' href='9-SearchOptions.aspx'></go>Search Options </anchor> <br/><br/>");            
        }
        else
        {
            Response.Write("<b>Invalid User Name or Password!</b> <br/> ");
            Response.Write("<anchor>go to previous page <prev /></anchor>");
        }
    }
    catch (Exception err)
    {
        Response.Write(err.Message);
    }
    finally
    {
        reader.Close();
        con.Close();
    }
     %>
</card>
</wml>
