// Date last modified =  <091126>
// Modified by =  <Motty_Shalev>

//***********************************************************************************DISCLAIMER************************************************************************************
// NOTE: By downloading and using this software you expressly agree to the following: This software is for the limited use only in connection with the LivePerson services purchased by you. 
// Once the LivePerson services are no longer in use, you must cease all use of the software and destroy all copies. 
// The software is provided to you “as is” and without any warranty of any kind, express, implied or otherwise, including without limitation, any warranty of merchantability or fitness for a particular purpose.  
// In no event shall LivePerson or any of its affiliates be liable for any direct, indirect, special, incidental, or consequential damages or any other damages of any kind, whether LivePerson
// or any of its affiliates have been advised of the possibility of such loss, however caused, and on any theory of liability, arising out of or related to the possession, use or performance of this software.  
// IF YOU DO NOT AGREE TO THE FOREGOING TERMS, DO NOT DOWNLOAD THE SOFTWARE OR USE THE SOFTWARE.
//***********************************************************************************DISCLAIMER************************************************************************************
var lpMTagConfig = {
        'lpServer' : "sales.liveperson.net",
        'lpNumber' : "43836137",
        'lpProtocol' : (document.location.toString().indexOf("https:")==0) ? "https" : "http",
		'sendCookies' : "true",
		'lpTagSrv' : 'sr2.liveperson.net'
};

function lpAddMonitorTag(src) { 
	if (!lpMTagConfig.lpTagLoaded) {if (typeof(src) == 'undefined' || typeof(src) == 'object') {if (lpMTagConfig.lpMTagSrc) {src = lpMTagConfig.lpMTagSrc;}else {if (lpMTagConfig.lpTagSrv) {src = lpMTagConfig.lpProtocol + '://' +lpMTagConfig.lpTagSrv + '/hcp/html/mTag.js';}else {src = '/hcp/html/mTag.js';};};};if (src.indexOf('http') != 0) {src = lpMTagConfig.lpProtocol + '://' + lpMTagConfig.lpServer + src + '?site=' + lpMTagConfig.lpNumber;} else {if (src.indexOf('site=') < 0) {if (src.indexOf('?') < 0) {src = src + '?';} else{src = src + '&';} src = src + 'site=' + lpMTagConfig.lpNumber;  };};var s = document.createElement('script');s.setAttribute('type', 'text/javascript');s.setAttribute('charset', 'iso-8859-1');s.setAttribute('src', src);document.getElementsByTagName('head').item(0).appendChild(s);}
}
if (window.attachEvent) window.attachEvent('onload',lpAddMonitorTag);
else window.addEventListener("load",lpAddMonitorTag,false);

//Dynamic Buttons Array
if(typeof(lpMTagConfig.dynButton)=="undefined") lpMTagConfig.dynButton=new Array();

//Static Behavior
//creating button object
lpMTagConfig.db1 = new Object();
//overriding busy action
lpMTagConfig.db1.busyAction = function (objName) {
      objRef = eval(objName);
      var chatWinURL = objRef.getActionURL("Busy");
      chatWinURL = chatWinURL.replace(/forceOffline/,"SESSIONVAR%21BusyClickOverride");
      window.open(chatWinURL,'Chat'+lpMTagConfig.lpNumber,'width=472,height=320,status=0,resizable=0,menubar=no,scrollbars=no,location=no');
};

//overriding offline action
lpMTagConfig.db1.offlineAction = function (objName) {
      objRef = eval(objName);
      var chatWinURL = objRef.getActionURL("Offline");
      window.open(chatWinURL,'Chat'+lpMTagConfig.lpNumber,'width=472,height=320,status=0,resizable=0,menubar=no,scrollbars=no,location=no');
};


lpMTagConfig.db1.dbStateChange = function (objName, status) {

    objRef = eval(objName);          

	  if (status == 'busy') {
		objRef.setCursorStyle(objRef.pointerStyle);
		if (typeof(objRef.ver)== 'undefined') { // version 8.0 or 8.1
			objRef.refImage.src = objRef.imageUrl + objRef.imgBusyName;
		}
		else {
			objRef.refImage.src = objRef.imgBusyName;
		}			
		
		objRef.refImage.alt = '';
				
		if (typeof(objRef.overwriteObj.busyAction)!='undefined') {
			objRef.refImage.onclick = function () {lpMTagConfig.db1.busyAction(objName); return false; };
		}
		else {
			objRef.refImage.onclick = null;
		}
		return false;
    }  
	if (status == 'offline') {
		objRef.setCursorStyle(objRef.pointerStyle);
		if (typeof(objRef.ver)== 'undefined') { // version 8.0 or 8.1
			objRef.refImage.src = objRef.imageUrl + objRef.imgOfflineName;
		}
		else {
			objRef.refImage.src = objRef.imgOfflineName;
		}			
		
		objRef.refImage.alt = '';
				
		if (typeof(objRef.overwriteObj.offlineAction)!='undefined') {
			objRef.refImage.onclick = function () {lpMTagConfig.db1.offlineAction(objName); return false; };
		}
		else {
			objRef.refImage.onclick = null;
		}
		return false;
    }
return true;
};

//Variables Arrays - By Scope
if (typeof(lpMTagConfig.pageVar)=='undefined') lpMTagConfig.pageVar = new Array();
if (typeof(lpMTagConfig.sessionVar)=='undefined') lpMTagConfig.sessionVar = new Array();
if (typeof(lpMTagConfig.visitorVar)=='undefined') lpMTagConfig.visitorVar = new Array();

// Function that sends variables to LP - By Scope
function lpAddVars(scope,name,value) 	{
	if (value != 0 && value != "")  //This is optional, depends if client wants to pass 0 or blank values
	{
	value=lpTrimSpaces(value.toString());
	switch (scope){
		case "page": 
			lpMTagConfig.pageVar[lpMTagConfig.pageVar.length] = escape(name)+"="+escape(value);
			break;
		case "session": 
			lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = escape(name)+"="+escape(value);
			break;
		case "visitor": 
			lpMTagConfig.visitorVar[lpMTagConfig.visitorVar.length] = escape(name)+"="+escape(value);
			break;
		}
	}
}

//Visitor activity indicator
//lpMTagConfig.enableActivityMon =<true/false>; //By default true
//lpMTagConfig.inactivityPeriod=<Inactivity Period in Sec>; //By default 120
//lpMTagConfig.actPollingInterval =<value in sec>; // By default 3 sec


//Prevent Invitation shown off page
lpMTagConfig.lpInvitePreventOffpage = true; // <true/false>  Can be change to false.

// Variables submission using lpGetVariables
/*
function lpGetVariables() {
var udes = new Array();
udes['<Scope:page/session/visitor>'] = new Array();
udes['<Scope:page/session/visitor>'][<counter>] = '<Variable Name>=<Variable Value>'; //First counter =0 
return udes;
}
*/

// Immediate Data submission function
function lpSendData(varscope,varname,varvalue){
if(typeof(lpMTag)!='undefined' && typeof(lpMTag.lpSendData)!='undefined')
  lpMTag.lpSendData(varscope.toUpperCase() +'VAR!'+ varname + '=' + varvalue, true);
}

//The Trim function returns a text value with the leading and trailing spaces removed
function lpTrimSpaces(stringToTrim) {
	return stringToTrim.replace(/^\s+|\s+$/g,"");
}

//Omit a specific cookie from the list of cookies that is being sent to LP with the monitor
lpMTagConfig.GetPageCookies = function () {
var cookies = document.cookie;
if ((typeof(cookies) == "undefined") || (cookies == null)) {
            cookies = "";
}
cookies = cookies.replace(/COOKIENAME=[a-zA-Z0-9\-!]*;?/,"");
return cookies;
};

// The unit variable purpose is to route the chat or call to the designated skill. <LOB> should be replaced with the skill name, i.e. : sales
try{								    
	if (typeof(lpUnit)=='undefined')	var lpUnit='us-tsg-tier-1';
	if(typeof(lpAddVars)!="undefined")	lpAddVars('page','unit',lpUnit);
	
	if (typeof(lpLanguage)=='undefined')	var lpLanguage='english';
	if(typeof(lpAddVars)!="undefined")	lpAddVars('session','language',lpLanguage);

	lpMTagConfig.defaultInvite = "chat-" + lpUnit+"-"+lpLanguage;
	}catch(e){}


if (typeof(lpMTagConfig.db1)=='undefined') {
    lpMTagConfig.db1 = new Object(); // needed if does not already exist
}
lpMTagConfig.dbStart = function (objName) {
	objRef = eval(objName);
	if (objRef==null) return true;	
	objRef.buttonName = objRef.origButtonName;
	objRef.roomName = objRef.origButtonName;
	return true;
}