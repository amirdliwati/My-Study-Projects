function checkOne(form){var total=0;var max=form.ckbox.length;for(var idx=0;idx<max;idx++){if(eval("form.ckbox["+idx+"].checked")==true){total+=1;}}
if(total==0){alert("Please check the boxes of the products you would like to buy.");return false;}
else{return true;}}
function checkTwo(form){var total=0;var max=form.selectedSeries.length;for(var idx=0;idx<max;idx++){if(eval("form.selectedSeries["+idx+"].checked")==true){total+=1;}}
if(total<2){alert("To compare, please check the boxes of at least two products.");return false;}
else{return true;}}
function checkTwoWithMsg(form,msg){var total=0;var max=form.selectedSeries.length;for(var idx=0;idx<max;idx++){if(eval("form.selectedSeries["+idx+"].checked")==true){total+=1;}}
if(total<2){alert(msg);return false;}
else{return true;}}
function emptyField(textObj){if(textObj.value.length==0)
return true;for(var i=0;i<textObj.value.length;i++){var ch=textObj.value.charAt(i);if(ch!=' '&&ch!='\t')
return false;}
return true;}
function validateForm(formObj){if(emptyField(formObj.qt))
alert("Please enter a product name (e.g., deskjet 630c, Evo D310) or product number (e.g., C6467A).");else
return true;return false;}
function openWin(url,width,height,win_name)
{bName=navigator.appName;var new_url="";if(bName=="Microsoft Internet Explorer")
{for(var i=0;i<url.length;i++)
{var c=url.charAt(i);if(c=='%')
{i+=1;var d=url.charAt(i);new_url+="%25"+d;}
else
{new_url+=c;}}}
else
{new_url=url;}
if(win_name==null)
{win_name="newPopupWindow";}
varn=open(new_url,win_name,"resizable=yes,toolbar=0,scrollbars=yes,directories=0,status=0,menubar=0,width="+width+",height="+height);}
function strtrim(str)
{if(str!=null)
{return str.replace(/^\s+/,'').replace(/\s+$/,'');}}
function isEmptyString(s)
{return(s==null||/^ *$/.test(s));}
function decodeHtml(str)
{str=str+"";str=str.replace(/"/g,'"');return str;}
var myDate=new Date;myDate.setDate(myDate.getDate()+28);var metas=document.getElementsByTagName("meta");for(var i=0;i<metas.length;i++){if(metas[i].name=="product_service_name"){var tmp=metas[i].content;document.cookie='smbRMcookie='+tmp+'; expires='+myDate+'; path=/; domain=hp.com';i=metas.length;}}new Date;myDate.setDate(myDate.getDate()+28);var metas=document.getElementsByTagName("meta");for(var i=0;i<metas.length;i++){if(metas[i].name=="product_service_name"){var tmp=metas[i].content;document.cookie='smbRMcookie='+tmp+'; expires='+myDate+'; path=/; domain=hp.com';i=metas.length;}}
var PSC_Segment = set_segment();
var PSC_Wireframe = set_wireframe();
var PSC_Type = set_hierarchy_value('0');
var PSC_Category = set_hierarchy_value('1');
var PSC_Family = set_hierarchy_value('2');
var PSC_genericoid = set_GenericOID();
var psc_genericoid = set_GenericOID();
var PSC_ShowBV = set_ShowBV();

function set_segment(){
	var str_Segment;
	if (top.document.getElementsByTagName("meta").segment){ 
		str_Segment=top.document.getElementsByTagName("meta").segment.content; }
	else if (top.document.getElementsByName('segment')[0]){
		str_Segment=top.document.getElementsByName('segment')[0].content; }
	var segment_code="";
	switch(str_Segment){
		case"smb":
			segment_code="SMB";
		break;
		case"large":
			segment_code="ENT";
		break;
		case"GA":
			segment_code="GA";
		break;
		case"b_to_b":
			segment_code="BB";
		break;
		case"RE":
			segment_code="RE";
		break;
		default:segment_code="";
	}
 return segment_code;
}

function set_wireframe(){
	var strCurrPage = location.pathname;
	var arrLocation = strCurrPage.split("/");
	var strWireframe = arrLocation[arrLocation.length-2];
	return strWireframe;
}

function set_report_suites(BU_key){
	switch (BU_key)
	{
	case "IPG":
		var report_suites = "hphqglobal,hphqna,hphqNAcomprod,hphqprodcat";
	break;
	case "PSG":
		var report_suites = "hphqglobal,hphqna,hphqNAcomprod,hphqprodcat,hphqPSG";
	break;
	case "ISS":
		if (PSC_Segment == "ENT") {
		var report_suites = "hphqglobal,hphqna,hphqNAcomprod,hphqprodcat,hphqwwesg,hphqiss";
		}
		else{
		var report_suites = "hphqglobal,hphqna,hphqNAcomprod,hphqprodcat,hphqiss";
		}
	break;
	case "SWD":
		if (PSC_Segment == "ENT") {
		var report_suites = "hphqglobal,hphqna,hphqNAcomprod,hphqprodcat,hphqwwesg,hphqnetworkstorage";
		}
		else{
		var report_suites = "hphqglobal,hphqna,hphqNAcomprod,hphqprodcat,hphqnetworkstorage";
		}
	break;
	default:
		var report_suites = "hphqglobal,hphqna,hphqNAcomprod,hphqprodcat";
	}
return report_suites;
}

function set_hierarchy_value(number_key){
	var level_value = "";
	var str_prod_service = "";
	var arr_prod_service = "";

	if (top.document.getElementsByTagName("meta").product_service_name){ 
		str_prod_service = top.document.getElementsByTagName("meta").product_service_name.content; }
	else if (top.document.getElementsByTagName("meta").product_service_solution_hierarchy){ 
		str_prod_service = top.document.getElementsByTagName("meta").product_service_solution_hierarchy.content; }
	else if (top.document.getElementsByName('product_service_name')[0]){ 
		str_prod_service = top.document.getElementsByName('product_service_name')[0].content; }
	else if (top.document.getElementsByName('product_service_solution_hierarchy')[0]){ 
		str_prod_service = top.document.getElementsByName('product_service_solution_hierarchy')[0].content; }


	arr_prod_service = str_prod_service.split("\\");
	level_value = arr_prod_service[number_key];

	return level_value;
}

function set_GenericOID(){
	var x;
	if (top.document.getElementsByTagName("meta").ReversableHTMLId){
		x=top.document.getElementsByTagName("meta").ReversableHTMLId.content;
	}
	else if (top.document.getElementsByName('ReversableHTMLId')[0]){
		x=top.document.getElementsByName('ReversableHTMLId')[0].content;
	}
	return x;
}

function set_ShowBV(){
	if ((PSC_genericoid) && (PSC_Wireframe == "WF05a") || (PSC_Wireframe == "WF06a") || (PSC_Wireframe == "WF25a") || (PSC_Wireframe == "WF25b") || (PSC_Wireframe == "WF06b") || (PSC_Wireframe == "WF31a")){
		return true;
	}
	else{
		return false;
	}
}

function gup( name )
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return results[1];
}

function checkuExp()
{
	var parameterName = gup('uExp');
	var strCurrPage = top.document.location.pathname;
	var arrLocation = strCurrPage.split("/");
	var strHostPath = arrLocation[arrLocation.length-1];
	var strWireframe = arrLocation[arrLocation.length-2];
	var strSegment = arrLocation[arrLocation.length-3];
	var strLang = arrLocation[arrLocation.length-4];
	var strCountry = arrLocation[arrLocation.length-5];

	var SAWireframe = ""
	if (strWireframe == 'WF28a'){
	SAWireframe = 'WF2833c';
	}
	else if (strWireframe == 'WF08a'){
	SAWireframe = 'WF0813c';
	}
 if (parameterName == "HPS"){
	getdetail('/wwpc/'+strCountry+'/'+strLang+'/'+strSegment+'/'+SAWireframe+'/A10-22744-449130-80934-'+strHostPath, 'SupplyAccessoryInfo');
	location.hash="#SupplyAccessoryInfo";
	}
 if (parameterName == "POS"){
	getdetail('/wwpc/'+strCountry+'/'+strLang+'/'+strSegment+'/'+SAWireframe+'/A10-51210-3242660-'+strHostPath, 'SupplyAccessoryInfo');
	location.hash="#SupplyAccessoryInfo";
	}
}


function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

var default_ck_name = "hp_cust_seg_sel";
var default_ck_domain = ".hp.com";
var default_ck_path = "/";
var default_ck_days = 90;

function _setCK(ck_value, ck_name, ck_days, ck_path, ck_domain) 
{
	if(!ck_value) return;
	if(!ck_name) 
	{
		ck_name = default_ck_name;
		var segment_cookie = getCookie(ck_name);
		//If the cookie is HHO or not set then only the value needs to be overwritten
		if (segment_cookie!=null && (segment_cookie=="LEB" || segment_cookie=="GHE"|| segment_cookie=="GA"))
		return;
	}
	
	
	if(!ck_days) ck_days = default_ck_days; if(!ck_path) ck_path = default_ck_path; if(!ck_domain) ck_domain = default_ck_domain;	
	var expireDate = new Date(); expireDate.setTime(expireDate.getTime() + (ck_days * 24 * 3600 * 1000));
	document.cookie = ck_name + "=" + escape(ck_value) + ((ck_days) ? "; expires=" + expireDate.toGMTString() : "") + ((ck_domain) ? "; domain=" + ck_domain : "") + ((ck_path) ? "; path=" + ck_path : "");
}

function getCookie(cookieName)
{
	var sR = document.cookie.match( cookieName + '=(.*?)(;|$)' ); return sR ? unescape(sR[1]) : null; 
}
	
_setCK('SMB');

if (PSC_ShowBV){
	document.domain = "hp.com";
	var x=document.getElementsByTagName("meta").ReversableHTMLId;
	var PSC_genericoid=x.content;
	function ratingsDisplayed(totalReviewsCount, avgRating, ratingsOnlyReviewCount, buyAgainPercentage, productID){
		if (totalReviewsCount > 0) {
			var bvRevCntr = document.getElementById("BVReviewsContainer");
			if (bvRevCntr) {
				bvRevCntr.style.display = "block"; 
			}
			var bvSVPLink = document.getElementById("BVSVPLinkContainer");
			if (bvSVPLink) {
				bvSVPLink.style.display = "block";
			}
		}
	}
}
