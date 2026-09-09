<%@ Page Language="C#" AutoEventWireup="true" CodeFile="1-Home.aspx.cs" Inherits="_1_Home" %>
<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">

<% 
    Response.ContentType = "text/vnd.wap.wml";
%>

<wml>
<head>


</head>
<card id="1">
    <p>
        <big><b>Hello , You are welcome </b></big><br />
        <br />
        If you are a new user, click the <b>Button</b> below to SignUp
        <br />
        <do type="accept" label="SignUp">
            <go href="#SignUp" ></go>
        </do>
        <br />
        If you are already a member, click the <b>link</b> below to Login 
        <br />
        <anchor>
            <go href="#Login" ></go>
            Login
        </anchor>
        <br />
    </p>
</card>


 <card id="SignUp" title="SignUp">
     <p>
        <b>Please fill the information below</b><br />
        <pre>
First Name  : <input type="text" name="FName"  maxlength="20" /> <br />
Last Name   : <input type="text" name="LName"  maxlength="20" /> <br />
User Name : <input type="text" name="userName"  maxlength="20" /> <br />
Password   : <input type="password" name="password" maxlength="8" /> <br />
        </pre>
        <anchor>
            <go method="post" href="3-SignUp.aspx">
                <postfield name="FName" value="$(FName)"/>
                <postfield name="LName" value="$(LName)"/>
                <postfield name="userName" value="$(userName)"/>
                <postfield name="password" value="$(password)"/>
            </go>
            SignUp
        </anchor>
     </p>
 </card>  

<card id="Login" title="Login">
    <p>        
    <b>Please fill the information below</b><br />

        <pre>
User Name : <input type="text" name="userName" maxlength="20" /><br />
Password   : <input type="password" name="password" maxlength="8"  /><br />
</pre>
<anchor>
    <go method="post" href="2-Login.aspx">
        <postfield name="userName" value="$(userName)"/>
        <postfield name="password" value="$(password)"/>
    </go>
    Login
</anchor>
    </p>
</card>  
</wml>
