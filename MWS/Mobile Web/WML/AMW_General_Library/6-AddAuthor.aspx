<%@ Page Language="C#" AutoEventWireup="true" CodeFile="6-AddAuthor.aspx.cs" Inherits="_6_AddAuthor" %>

<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">
<% 
    Response.ContentType = "text/vnd.wap.wml";
%>
<wml>
<head>


</head>
<card >
<% 
        string Fname = Request["Fname"]; ;
        string Lname = Request["Lname"]; ;
        string Country = Request["Country"]; ;
        string City = Request["City"]; ;
        string Address = Request["Address"]; ;

        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
        
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);

        string query = "insert into Author (Fname,Lname,Country,City,Address) values (@Fname, @Lname, @Country, @City, @Address) ";
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);

        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Fname", System.Data.SqlDbType.NVarChar, 20));
        cmd.Parameters["@Fname"].Value = Fname;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Lname", System.Data.SqlDbType.NVarChar, 20));
        cmd.Parameters["@Lname"].Value = Lname;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Country", System.Data.SqlDbType.NVarChar, 20));
        cmd.Parameters["@Country"].Value = Country;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@City", System.Data.SqlDbType.NVarChar, 20));
        cmd.Parameters["@City"].Value = City;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Address", System.Data.SqlDbType.NVarChar, 40));
        cmd.Parameters["@Address"].Value = Address;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("Author Added Succefully.<br/>");
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
        }
        finally
        {
            con.Close();
            Response.Write("<anchor>go to previous page <prev /></anchor>");
        }
        %>
</card>
</wml>
