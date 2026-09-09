<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10-Search4Book.aspx.cs" Inherits="_10_Search4Book" %>

<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">

<wml>
<head>

</head>
<card>
<% 
    Response.ContentType = "text/vnd.wap.wml";
    string Title = Request["Title"];
    if (Title != "")
    {

        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);
        string query = "select * from [Book] where (Title Like '%'+@Title+'%')";
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Title", System.Data.SqlDbType.NVarChar, 20));
        cmd.Parameters["@Title"].Value = Title;

        try
        {
            con.Open();
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                Response.Write("<i>Click on a book and see its details.</i><br/><br/> <table><tr><td><b>Book Title</b></td></tr>");
                while (reader.Read())
                {
                    Response.Write("<tr><td><anchor><go method='post' href='8-BookInfo.aspx'><postfield name='Id' value='" + reader[0].ToString() + "'/></go>" + reader[1].ToString() + "</anchor></td></tr>");
                }
            }
            else
            {
                Response.Write("There is no result");
            }
            reader.Close();
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
        }
        finally
        {
            Response.Write("</table>");
            con.Close();
        }
    }
    else
    {
        Response.Write("<i>Please fill the Search Box</i><br />"); 
        Response.Write("<anchor><b>Go to previous page.</b> <br /> <prev /></anchor>");
    }
    %>
</card>

</wml>
