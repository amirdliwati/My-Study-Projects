var strbarcolor;
var strbgcoloroff;
var strbgcoloron;
var strtextcolor;
var strhovercolor;
var strbordercolor;

function fnMenuStyle()
{
	this.barcolor = "#006699";
	this.bgcoloroff = "#006699";
	this.bgcoloron = "#D1E6FA";
	this.textcolor = "white";
	this.hovercolor = "black";
	this.bordercolor = "#6699CC";
	this.fnSetMenuStyles = fnSetMenuStyles;
}


function fnSetMenuStyles()
{
	strbarcolor="#006699"  
	strbgcoloroff="#006699"  
	strbgcoloron="#D1E6FA"  
	strtextcolor="white"  
	strhovercolor="black"  
	strbordercolor = "#6699CC"
	this.barcolor = strbarcolor;
	this.bgcoloroff = strbgcoloroff;
	this.bgcoloron = strbgcoloron;
	this.textcolor = strtextcolor;
	this.hovercolor = strhovercolor;
	this.bordercolor = strbordercolor;
}				


