<!-- 
//=============================================================================================//
// -->	VERSION			:	1.0
// -->	FILE NAME		:	smb1.js
// --> 	AUTHOR			: 	Jonathan Brumley (jonathan.brumley@hp.com)
// --> 	LAST MODIFIED	: 	2/17/2008 
// --> 	COPYRIGHT		: 	© 2006 Hewlett-Packard Development Company, L.P. All rights reserved.
//=============================================================================================//
/*	====================================================
	GLOBAL VARIABLES DECLARATION
	____________________________________________________
	WARNING: Please do not modify these variables
	because they are important for the script.
	____________________________________________________ */
	if(!s_prop1)var s_prop1="";		if(!s_prop2)var s_prop2="";
	if(!s_prop3)var s_prop3="";		if(!s_prop4)var s_prop4="";
	if(!s_prop7)var s_prop7="";		if(!s_prop8)var s_prop8="";
	if(!s_prop13)var s_prop13="";	if(!s_pageName)var s_pageName="";
	if(!s_hp_region)var s_hp_region=""; 
/*  ====================================================
	spVal - CONTAINS ALL ARGUMENTS
	____________________________________________________*/
var spVal = {
	aquarius_exep :	new Array("cceaacspro01", "cceaacspro02"),// This is only for the error that is produced in Aquarius	
	exep : new Array("https://","www.shopping.hp.com", "h20139.www2.hp.com", "ipgweb.cce.hp.com", "dcart", "http://www.hp.com/cpso-support-new/SDD/", "http://h30216.www3.hp.com/", "http://wwemail.support.hp.com/fd2/EmailForm","http://wwemail.support.hp.com/fd2/EmailSend","http://wwemail.support.hp.com/fd2/EmailValidate"),
/*__________________________________________________
	~ cname  = country name, ccode = country code or country
	~ pratio = popratio, clicks = number of clicks 
	____________________________________________________ */
	inf	: 	[{ //Main Information Variables
				index : 1 //position 0 is reserved .02
			},{ //Default Country
				cname: "default", ccode: '64', clicks: 4, pratio: 0.02,  pratio_first_svID: 0.0
		}],
	inv : 	{ //General Variables
				zIndex		: 1000,
				top			: "25px",
				left 		: "40px"
		},		
	gen : 	{ //General Variables
				svID			: Array("3BC1E4C177E4634B","3BC1E4C109415531"),
				sv_ebus_sitecode: "28",
				sv_ebus_jscript : "smb2psc.js",
				sv_ebus_tce 	: "n",
				sv_ebus_name	: new Array("tce","smb"),
				sv_ebus_domain 	: ".hp.com",
				cdomain 		: "HP",
				ref 			: self.location.href,
				myurl 			: location.href,
				title 			: document.title,
				reg 			: new RegExp("(google.com)", "i"),
				sv_logo			: "sv_logo.gif",
				use_ebus_clicks	: true,
				files_root		: "http://www.hp.com/cma/metrics/survey/"
		},
	js	: 	{	dir :  "lib/", files: new Array("svDrag1","naLang") },
	css	:	{	dir	:  "css/", files: new Array("sp"), csspfx: '' },
	
	img	:	{	dir	:  "img/" },		
	bwr : 	{	ie4 : document.all, ns6 : document.getElementById && !document.all },		
	td : 	{ // Time and Date Variables
				sv_ebus_yr 					: new Date().getFullYear(),							
				sv_ebus_clicks_expires 		: new Date(),
				sv_ebus_expires 			: new Date(),				
				sv_ebus_cookielife 			: 180, //in days
				sv_ebusclicks_cookielife 	: 30, //in minutes
				sv_ebus_random 				: Math.random()
		},
	https:	{ 	files_root	: 	"http://www.hp.com/cma/metrics/survey/",
				allowed	:	new Array("https://h30046.www3.hp.com")
		},
	test : 	{ // Test Variables				
				svLaunched 		: 	"no",
				invLaunched 	: 	"no",
				domain_url		:	"http://webmetrics1.americas.cpqcorp.net",
				files_root		: 	"http://webmetrics1.americas.cpqcorp.net/survey/source/",
				url_values		: 	new Array("sp_lang", "sp_popratio", "dual_popratio")
		},		
	varMap : { // Variable Maps for Scrape Meta Function
				target_country : "sv_ebus_country", segment : "sv_ebus_segment", hp_design_version : "sv_ebus_design_version", generator : "sv_ebus_generator", page_content : "sv_ebus_page_content", 
				lifecycle : "sv_ebus_lifecycle", product_service_name : "sv_ebus_product_service_name", web_section_id : "sv_ebus_web_section_id", ReversableHTMLId : "sv_ebus_reversablehtmlid"
		},		
	allMetas : document.getElementsByTagName("META"), // Asigning HTML meta tags to allMetas
	prop : { // prop Variables
				n1 : s_prop1.replace(/(\s|\/)/g,"_").toLowerCase(),
				n2 : s_prop2.replace(/(\s|\/)/g,"_").toLowerCase(),
				n3 : s_prop3.replace(/(\s|\/)/g,"_").toLowerCase(),
				n4 : s_prop4.replace(/(\s|\/)/g,"_").toLowerCase(),
				n7 : "",
				n8 : "",
				n9 : "",
				n13: s_prop13.toLowerCase()
		}
}//End of spVal
/*  ====================================================
	spSV - CONTAINS ALL FUNCTIONS
	____________________________________________________*/
var spSV = { 
// ==================== Function to initialize functions =============================
	init : function(){ 
		var tv = location.search.indexOf("l_supplemental");

		if ((document.cookie.indexOf("HP_EBUS=true")==-1)||(tv>-1)){
			td2 = spVal.td; gen2 = spVal.gen; iv2 = spVal.inv; test2 = spVal.test; img2 = spVal.img;
			prop2 = spVal.prop; inf2 = spVal.inf; bwr2 = spVal.bwr; js2 = spVal.js; css2 = spVal.css; https_ = spVal.https;
			spSV.setDomain(); spSV.initVars(); spSV.scrapeMeta(); spSV.getCountry(); spSV.setCookiesExp();
			var idx = inf2[0].index;
			inf2[idx].pratio = spSV.getURLValue(test2.url_values[1], inf2[idx].pratio);
			inf2[1].pratio_first_svID = spSV.getURLValue(test2.url_values[2], inf2[1].pratio_first_svID);
			if((spVal.https.allowed.length > 0) && (spSV.setExep(spVal.https.allowed) == true)){ spVal.exep[0] = "$@#)_?'";} 

			if ((spSV.checkClicks()!= null)||(tv>-1)){				
				if ((Math.random() < inf2[idx].pratio) && (gen2.reg.test(document.referrer) == false) && (spSV.setExep(spVal.exep)== false) || (tv>-1)){				
					if(Math.random() < inf2[1].pratio_first_svID){
						if(spSV.run()!= null){gen2.svID[0] = gen2.svID[1]; spSV.launchSurvey(1);}
					} else { if(spSV.run()!= null){ spSV.loadTags(); spSV.showOverlay();} }
				}				
			}
		}else{return;}
	}, 
// ==================== Function run (starts the script after init)=======================
	run: function(){
		/***************Determine Language*******************/	
		if ((sv_ebus_lang == "")&&(s_prop8 != ""))sv_ebus_lang = s_prop8;
		var lp8=sv_ebus_lang;
		if (lp8!=""){	
			l = "0";//Null
			if (lp8.toLowerCase().indexOf("en")>-1) {
				l = "9";//English from US
			}
			l = spSV.getURLValue(test2.url_values[0], l); 
			if((location.search.indexOf("l_supplemental")>-1) && (l == "0" )){l="9";}else if(l == "0"){return null;}
			return l;
		}else{return null;}
	},
// ==================== Function updatecookie ==================================================
	checkClicks: function(){		
		var idx = inf2[0].index; var ck = spSV.getCookieClicks(); var cl = ck[1]*1;		
		if((gen2.use_ebus_clicks == true)&&(cl != null)){ return (cl >= inf2[idx].clicks) ? cl : null;
		}else if (gen2.use_ebus_clicks == false){ return cl; }	return null;
	},

	getCookieClicks: function(){ return (document.cookie.indexOf("HP_EBUS_"+gen2.cdomain+"_CLICKS")>-1) ? spSV.getCookie('HP_EBUS_'+gen2.cdomain+'_CLICKS').split("x") : [null,null,null]; },
// ==================== Function initialize variables ======================================
	initVars: function(){
		css2.csspfx=css2.files[0];
		sv_ebus_country="";
		sv_ebus_segment="";
		sv_ebus_design_version=""; 
		sv_ebus_generator="";
		sv_ebus_page_content=""; 
		sv_ebus_lifecycle="";
		sv_ebus_product_service_name="";
		sv_ebus_web_section_id="";
		sv_ebus_reversablehtmlid="";
		compare_clicks = 0;
		sv_ebus_lang ="";
		target_country_value ="";
		root_folder = gen2.files_root;
		if(gen2.myurl.indexOf("https://")!=-1) {root_folder = https_.files_root;}
		else if(gen2.myurl.indexOf(test2.domain_url)!=-1) {root_folder = test2.files_root;}
	},
// ==================== Function set domain for cookies =====================================	
	setDomain: function(){
		if (location.host.indexOf("webmetrics1")!=-1){
			gen2.sv_ebus_domain = ".cpqcorp.net"; gen2.cdomain = "HPQCORP";
		}//End if statement
	},
// ====================	Function loadTags for overlay ====================================
	loadTags: function(){
		var head = document.getElementsByTagName("HEAD")[0];
			var lk = document.createElement('link');
			lk.setAttribute("type", "text/css");
			lk.setAttribute("rel", "stylesheet");
			lk.setAttribute("href", root_folder+css2.dir+css2.csspfx+"_inv.css");
			head.appendChild(lk);
		for (i=0;i <= js2.files.length-1;i++){
			var element = document.createElement("script");
			element.setAttribute("type", "text/javascript");
			element.setAttribute("src", root_folder+js2.dir+js2.files[i]+".js");
			head.appendChild(element);
		}		
	},
// ==================== Function find country ===============================================
	getCountry: function(){	target_country_value = sv_ebus_country;
		if (((sv_ebus_country == "")||(sv_ebus_country.length > 2))&&(s_prop7 != "")) sv_ebus_country = s_prop7; target_country_value = "undefined";
		if ((sv_ebus_country == "")&&(s_prop7 == "")) sv_ebus_country = "undefined";
		for (i=1; i<(inf2.length); i++){
			if(inf2[i].cname == sv_ebus_country.toLowerCase()){
				inf2[i].flag = "y"; inf2[0].index = i; return inf2[i];
			}			
		}return	inf2[1];
	},
// ==================== Cookies Expire Time Set Up ===========================================
	setCookiesExp: function(){
		td2.sv_ebus_expires.setTime(td2.sv_ebus_expires.getTime()+(td2.sv_ebus_cookielife*24*60*60*1000));		
	},
// ==================== Function check domains exeptions in URL ==============================
	setExep: function(exep_array){
		for (i=0; i <= exep_array.length-1; i++) {				
			var result = spVal.gen.myurl.indexOf(exep_array[i]); if ((result !=-1) && (exep_array[i] != "")){ return true; }}
		return false;
	},
// ==================== Function getcookie ===================================================
	getCookie: function(name){
		var dc = document.cookie; var prefix = name + "="; var begin = dc.indexOf("; " + prefix); 
		if (begin == -1) { begin = dc.indexOf(prefix);
			if (begin != 0) return null;
		}else{ begin += 2; }
		var end = document.cookie.indexOf(";", begin);
		if (end == -1) { end = dc.length; }
		return unescape(dc.substring(begin + prefix.length, end));
	},
// ==================== Function get Ready =====================================================
	getReady: function(f, a){ var n = 0; var t = setInterval(function(){ var c = true; n++; 	
		if(typeof document.getElementsByTagName != 'undefined' && (document.getElementsByTagName('body')[0] != null || document.body != null)) { c = false; if(typeof a == 'object'){
		for(var i in a)	{ if ( (a[i] == 'id' && document.getElementById(i) == null) || (a[i] == 'tag' && document.getElementsByTagName(i).length < 1) ) { c = true; break; }}} if(!c) { f(); clearInterval(t); } }		
		if(n >= 60) { clearInterval(t); } }, 250);
	},
// ==================== Function generate global unique id ======================================
	genGUID: function(){		
		var TempDate = new Date();
		var guid = (TempDate.getMonth()+1) + "-" + TempDate.getDate() + "-" + TempDate.getYear() + "_" + TempDate.getHours() + "-" + TempDate.getMinutes() + "-" + TempDate.getSeconds() + "-" + TempDate.getMilliseconds() + "_" + TempDate.getTimezoneOffset() + "_";
		for (var i = 1; i <= 32; i++){ var n = Math.floor(Math.random() *16.0).toString(16); guid += n; if ((i == 8) || (i == 12) || (i == 16) || (i == 20)) guid += "-"; }
		return guid;
	},
// ==================== Function return URL value ===============================================
	getURLValue: function(url_val, output){
	if(gen2.myurl.indexOf("&"+url_val+"=")>-1){ 				
		var regExp = new RegExp("[\\?&#]"+url_val+"=([^?&#]*)"); var result = regExp.exec( gen2.myurl ); 
		output = result[1];
	}return output;},
// ==================== Function show overlay ===================================================
	showOverlay: function(){
	if((window.Drag)&&(window.langLib)){ test2.invLaunched = "yes"; 
		document.cookie = "HP_EBUS=true;path=/;Expires="+td2.sv_ebus_expires.toGMTString()+";domain="+gen2.sv_ebus_domain;
		test2.invLaunched = "yes";
			if ((bwr2.ns6) || (bwr2.ie4)) {											
					var LCOD = 'L'+l;
					langResult2 = langLib.selectLang(LCOD);					
				/*****************************Begin overlay HTML code****************************************/
				var str='	<div id="'+css2.csspfx+'_titlebar">';
					str+='		<a href="javascript:spSV.toggleBox(\''+css2.csspfx+'_main\',0);"><img border="0" src="'+root_folder+img2.dir+'close.gif" alt="close button"></a>';
					str+='		<span>'+langResult2.title+'<\/span>';
					str+='	<\/div><!-- end titlebar \/\/-->';
					str+='	<div id="'+css2.csspfx+'_header"><img src="'+root_folder+img2.dir+gen2.sv_logo+'" alt="hp logo"><span>'+langResult2.title+ '<\/span>';					
					str+='	<\/div><!-- end header \/\/-->';
					str+='	<div id="'+css2.csspfx+'_body" dir='+langResult2.dir+'> ';
					str+=	langResult2.text;
					str+='		<form dir='+langResult2.dir+' class="'+css2.csspfx+'_form" action="" name="sv_ebus_form">';
					str+='			<input class="'+css2.csspfx+'_radio" type="radio" name="sv_ebus_invitation" value="yes" checked="true"><span>' + langResult2.yes + '<\/span>';
					str+='			<br \/><input class="'+css2.csspfx+'_radio" type="radio" name="sv_ebus_invitation" value="no"><span>' + langResult2.no + '<\/span><br \/>';
					str+='			<input class="'+css2.csspfx+'_button" type="button" onClick="spSV.sv_ebus_verify();" value='+ langResult2.button+' >';
					str+='		<\/form>';
					str+='	<\/div><!-- end body \/\/-->';
					str+='	<div id="'+css2.csspfx+'_footer"> &copy; ' + td2.sv_ebus_yr + ' Hewlett-Packard Development Company, L.P.';
					str+='	<\/div><!-- end footer \/\/-->';
					str+='<!-- END FLOATING LAYER CODE \/\/--> ';
				spSV.dv = document.createElement('div'); 
				spSV.dv.setAttribute('id',css2.csspfx+'_main');	
				spSV.dv.style.left = iv2.left;
				spSV.dv.style.top = iv2.top;
				spSV.dv.style.zIndex = iv2.zIndex;
				spSV.dv.innerHTML=str;
				spSV.dv.onmousemove=function(){Drag.startDrag();}				
				document.body.appendChild(spSV.dv); 
				csspfx = css2.csspfx;
				Drag.startDrag();
				spSV.toggleBox(css2.csspfx+'_main',1);
			}
		}else{ window.setTimeout("spSV.showOverlay()", 150); }
	},
// ==================== Function email check ===========================================	
	checkEmail: function(str) {
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(str)){return true} return false;
	},
// ==================== Function ebus verify ===========================================
	sv_ebus_verify: function(){
		if (document.sv_ebus_form.sv_ebus_invitation[1].checked == true){
			spSV.launchSurvey(2);
			td2.sv_ebus_expires.setTime(td2.sv_ebus_expires.getTime()+(td2.sv_ebus_cookielife*24*60*60*1000));
			document.cookie = "HP_EBUS=true;path=/;Expires="+td2.sv_ebus_expires.toGMTString()+";domain="+gen2.sv_ebus_domain;
			spSV.toggleBox(css2.csspfx+'_main',0);
		}else{ 			
			spSV.launchSurvey(1); spSV.toggleBox(css2.csspfx+'_main',0); }
	},
// ==================== Function launch survey =========================================
	launchSurvey: function(invitation){ var clk2 = spSV.getCookieClicks(); 
		test2.svLaunched = "yes"; document.cookie = "HP_EBUS=true;path=/;Expires="+td2.sv_ebus_expires.toGMTString()+";domain="+gen2.sv_ebus_domain;
		var url = "http://g1w2399g.austin.hp.com/Community/se.ashx?s="+gen2.svID[0]+"&c="+escape(sv_ebus_lang.toLowerCase());
		var url_arg = "&tce="+gen2.sv_ebus_tce.toLowerCase()+"&svLaunched="+test2.svLaunched+"&invLaunched="+test2.invLaunched+"&stop_click="+clk2[0]+"&total_clicks="+clk2[1]+"&seconds_to_launch="+clk2[2]+"&jscript="+gen2.sv_ebus_jscript+"&bus_prod_class="+sv_ebus_reversablehtmlid_arr[0]+"&bus_prod_type="+sv_ebus_reversablehtmlid_arr[1]+"&bus_prod_cat="+sv_ebus_reversablehtmlid_arr[2]+"&reference="+escape(gen2.ref)+"&title="+escape(gen2.title)+"&code="+gen2.sv_ebus_sitecode+"&country="+inf2[inf2[0].index].ccode+"&prop7="+escape(sv_ebus_country.toLowerCase())+"&s_hp_region="+escape(s_hp_region.toLowerCase())+"&prop8="+escape(sv_ebus_lang.toLowerCase())+"&prop9="+escape(prop2.n9)+"&prop13="+escape(prop2.n13)+"&prop1="+escape(prop2.n1)+"&prop2="+escape(prop2.n2)+"&prop3="+escape(prop2.n3)+"&prop4="+escape(prop2.n4)+"&hp_design_version="+escape(sv_ebus_design_version.toLowerCase())+"&generator="+escape(sv_ebus_generator.toLowerCase())+"&page_content="+escape(sv_ebus_page_content.toLowerCase())+"&lifecycle="+escape(sv_ebus_lifecycle.toLowerCase())+"&guid="+escape(this.genGUID())+"&product_service_name="+escape(sv_ebus_product_service_name.toLowerCase())+"&web_section_id="+escape(sv_ebus_web_section_id.toLowerCase()) 
		window.open(url+url_arg+"&invitation="+invitation,"","height=800,width=750,scrollbars=yes,resizable=yes");
	},
// ==================== Function toggle box ============================================
	toggleBox: function(szDivID, iState){
	   var obj = document.layers ? document.layers[szDivID] : document.getElementById ?  document.getElementById(szDivID).style : document.all[szDivID].style;
	   obj.visibility = document.layers ? (iState ? "show" : "hide") : (iState ? "visible" : "hidden");	   
	   if (bwr2.ie4){ var fr = document.getElementById("dummyFRM"); fr.style.visibility = obj.visibility; }
	   if (iState == 0){ document.cookie = "HP_EBUS=true;path=/;Expires="+td2.sv_ebus_expires.toGMTString()+";domain="+gen2.sv_ebus_domain;
		this.rmEle.All();
		}
	},
// ==================== Function scrape meta tags ======================================
	scrapeMeta: function(){
		if (document.getElementsByTagName){	var myMeta;	sv_ebus_lang = window.document.documentElement.lang;
			for (var i=0; i<spVal.allMetas.length; i++){ myMeta = spVal.allMetas[i];
				if (spVal.varMap[myMeta.name] != null){ eval(spVal.varMap[myMeta.name]+ " ='"+ myMeta.content.replace(/(\\|\/)/g,"_").toLowerCase().split("'").join("") +"'"); }
		}}
		prop2.n9 = sv_ebus_segment.toLowerCase();
		sv_ebus_reversablehtmlid_arr=sv_ebus_reversablehtmlid.split("-")
	},
	rmEle: {
		All: function(){ this.Div(css2.csspfx+'_main'); 
			this.Tgs(css2.csspfx+'_inv', 'LINK', 'css');
			for(i=0;i< js2.files.length;i++){  this.Tgs(js2.files[i], 'SCRIPT', 'js'); }
			this.Tgs(gen2.sv_ebus_jscript, 'SCRIPT', '');
		},
		Tgs: function(list, tag, ext){
			if(list.indexOf('.')==-1){list+='.'; var source = 'href';}
			for (var i=0;i < document.getElementsByTagName(tag).length;i++) {
				var tg = document.getElementsByTagName(tag)[i];
				if (tag.toLowerCase() == 'script') {source = 'src';}
				if (tg[source].indexOf('/'+list+ext) != -1 ){ var deleted = tg.parentNode.removeChild(tg);}
			}
		},
		Div: function(id){
			var div = document.getElementById(id); while (div.firstChild) { div.removeChild(div.firstChild)}
		}
	}	
}//End of spSV
if(spSV.setExep(spVal.aquarius_exep)== false) {
	spSV.getReady(spSV.init);
}
//-->