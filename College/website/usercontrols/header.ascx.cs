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

public partial class usercontrols_header : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='780' height='215'> <param name='movie' value='2.swf'>  <param name='quality' value='high'>  <embed src='2.swf' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='780' height='215'></embed></object>";
        if (Session["brows"]=="true")
        {
            Label1.Text = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='780' height='215'> <param name='movie' value='1.swf'>  <param name='quality' value='high'>  <embed src='1.swf' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='780' height='215'></embed></object>";

        }
        else
        {
            Label1.Text = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='780' height='215'> <param name='movie' value='2.swf'>  <param name='quality' value='high'>  <embed src='2.swf' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='780' height='215'></embed></object>";
            Session["brows"] = "true";
        }


    }
}
