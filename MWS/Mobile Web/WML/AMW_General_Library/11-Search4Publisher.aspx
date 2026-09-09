<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11-Search4Publisher.aspx.cs" Inherits="_11_Search4Publisher" %>

<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">

<wml>
<head>

</head>
<card>
<% 
    Response.ContentType = "text/vnd.wap.wml";
    string PName = Request["PName"];
    if (PName != "")
    {

        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);
        string query = "select * from [Publisher] where (PName Like '%'+@PName+'%')";
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PName", System.Data.SqlDbType.NVarChar, 50));
        cmd.Parameters["@PName"].Value = PName;

        try
        {
            con.Open();
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                Response.Write("<i>Click on a Publisher Name and see published books.</i><br/><br/> <table><tr><td><b>Publisher Name</b></td></tr>");
                while (reader.Read())
                {
                    Response.Write("<tr><td><anchor><go method='post' href='#PublishedBooks'><postfield name='PName' value='" + reader[1].ToString() + "'/><postfield name='Id' value='" + reader[0].ToString() + "'/></go>" + reader[1].ToString() + "</anchor></td></tr>");
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
<card id="PublishedBooks" title="Published Books">
<%
    string Id = Request["Id"];
    PName = Request["PName"];
    string ConnectionString1 = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
    System.Data.SqlClient.SqlConnection con1 = new System.Data.SqlClient.SqlConnection(ConnectionString1);
    string sql = "select * From Book where pubId='" + Id + "'";
            
    System.Data.SqlClient.SqlCommand cmd1 = new System.Data.SqlClient.SqlCommand(sql, con1);
    try
    {
        con1.Open();
        System.Data.SqlClient.SqlDataReader reader1 = cmd1.ExecuteReader();
        if (reader1.HasRows)
        {
            Response.Write("Books that Published by <i> " + PName + " </i>:<br/><table><tr><td><b>Book Title</b></td></tr><tr><td> ");
            while (reader1.Read())
            {
                Response.Write("- <i>" + reader1[1].ToString() + "</i> </td></tr>");
            }
             Response.Write("</table>");
        }
        reader1.Close();
        Response.Write("<br /><anchor><b>Go to previous page.</b> <br /> <prev /></anchor>");
    }
    catch (Exception err)
    {
        Response.Write(err.Message);
    }
    finally
    {
        con1.Close();
    }  
     %>
</card>

</wml>
