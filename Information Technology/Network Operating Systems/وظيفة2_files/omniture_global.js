// HP Common Metrics Architecture 20061107a
// BEGIN Clickstream:
var s_hp_optOut = false // WARNING: IF SET TO TRUE, PAGE WILL NOT BE TRACKED

// Common Dynamic Account structure - please do not use unless authorized by CKM&A Ops
var s_dynamicAccountSelection=false;
var s_dynamicAccountList="";
var s_dynamicAccountMatch=window.location.hostname

if (!(window.s_account)){
	var s_account="hphqglobal"
}
var s_trackDownloadLinks=true
var s_trackExternalLinks=true
var s_trackInlineStats=true
var s_linkDownloadFileTypes="exe,zip,wav,mp3,mov,mpg,avi,doc,pdf,xls,cgi,dot,pot,ppt,wmv,asx"
var s_linkInternalFilters="hp,compaq,cpqcorp,javascript:"
var s_linkLeaveQueryString=true

// Common metrics plugin function - do not remove
function s_hp_doMetricsPlugins() { 
}

/*** DO NOT MODIFY THIS SECTION ***/
/* Under no circumstances should you modify this code */
if(window.s_account && s_account.indexOf("hphqap") != -1) {
	s_hp_includeJavaScriptFile("welcome.hp-ww.com","/cma/region/ap/apcma.js");
} 
if(window.s_account && s_account.indexOf("hphqemea") != -1) {
	s_hp_includeJavaScriptFile("welcome.hp-ww.com","/cma/region/emea/emeacma.js");
}
if(window.s_account && s_account.indexOf("hphqna") != -1) {
	s_hp_includeJavaScriptFile("welcome.hp-ww.com","/cma/region/na/nacma.js");
}
s_hp_includeJavaScriptFile("welcome.hp-ww.com","/cma/metrics/sc/s_code_remote.js");

function s_hp_includeJavaScriptFile(hp_hostname,hp_path) {
	if(!(window.s_hp_optOut && window.s_hp_optOut == true)) {
		var hp_ssl=(window.location.protocol.toLowerCase().indexOf('https')!=-1)
		if(hp_hostname && hp_hostname.length>0) {
			if(hp_ssl == true && hp_hostname.toLowerCase().indexOf("welcome.") != -1) { hp_hostname = "secure.hp-ww.com"; }
			var fullURL = "http" + (hp_ssl?"s":"") + "://" + hp_hostname + hp_path
		}
		else
			var fullURL=hp_path;
		document.write("<sc" + "ript language=\"JavaScript\" src=\""+fullURL+"\"></sc" + "ript>");
	}
}
// END Clickstream:
