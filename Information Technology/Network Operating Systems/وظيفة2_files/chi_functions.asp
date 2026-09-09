
var PreCartData  = "";

var SKUTotal     = "";
var s_products   = "";
var s_events     = "scView,event15";
var aProductData;
var aProductLine;
var nRowCount;
var nColCount;


function ajaxManager()
{
	var x		 = "";
	var args	 = ajaxManager.arguments;
	var sURL	 = "";
	var nQuantity	 = "";
	var nNewQuantity = 1;
	aProductData = new Array();
	aProductLine = new Array();
	var sPageData	 = "";
	var el		 = window.parent.document.getElementById(args[1]);
	var sTemp	 = "";

	if (args.length > 7)
	{
		var sSKU	 = args[2];
		var sName	 = args[3];
		var dPrice	 = args[4];
		var sState	 = args[5];

		var sCart	 = args[6];

		var sJumpID	 = args[7];
		var sCrossSell	 = args[8];
		var nRGID	 = args[9];
		nRowCount	 = 0;
		nColCount	 = 0;
		var bSucess	 = 0;
		var nSubTotal	 = 0;
		var sCookieData	= GetCookieData('hp_cart');
		var MAX = 4004;

		if (sState == "Cart")
		{
			if (sCart != '-1')
			{
				PreCartData  = sCart;

				if (sCookieData.length > 1)
				{
					aProductData = sCookieData.split("~");
				}
			}
		}

		if (sState == "Add")
		{
			if ((sSKU != "-1" || sSKU != "") && dPrice != "-1" && IsNumeric(dPrice) )
			{
				if (sCookieData == null || sCookieData == "")
				{
					nQuantity = nNewQuantity;
					sCookieData = sSKU + "|" + sName + "|" + dPrice + "|" + nQuantity + "|" + sJumpID + "|" + sCrossSell + "|" + nRGID + "~";
				}
				else
				{
					//Check for existance of SKU
					//Add data to list
					aProductData = sCookieData.split("~");
					if (isArray(aProductData))
					{
						sCookieData = "";
						nRowCount = aProductData.length;

						bSuccess = 0;
						for (i = 0; i < (nRowCount-1); i++)
						{
							aProductLine = aProductData[i].split("|");


							if (InStr(aProductLine[0], sSKU) > 0)
							{
								//Found SKU Add one to quanity and save
								nQuantity = aProductLine[3];
								if (IsNumeric(nQuantity) )
								{
									nQuantity = ((1*nQuantity) + 1);
								}
								else
								{
									nQuantity = 1;
								}
								sCookieData = sCookieData + aProductLine[0] + "|" + aProductLine[1] + "|" + aProductLine[2] + "|" + nQuantity + "|" + aProductLine[4] + "|" + aProductLine[5] + "|" + aProductLine[6] + "~";
								bSuccess = 1;
							}
							else
							{
								sCookieData = sCookieData + aProductLine[0] + "|" + aProductLine[1] + "|" + aProductLine[2] + "|" + aProductLine[3] + "|" + aProductLine[4] + "|" + aProductLine[5] + "|" + aProductLine[6] + "~";
							}
						}

						if (!bSuccess)
						{
							sCookieData = sCookieData + sSKU + "|" + sName + "|" + dPrice + "|1|" + sJumpID + "|" + sCrossSell + "|" + nRGID + "~";
						}
					}
				}

				//Set Cookie
				ClearCookieData('hp_cart');
				if (sCookieData.length  > MAX)
				{
					alert("You have reached the limited of items allowed in the shopping list.\n Please Click on the 'View Cart & Checkout' button to add your list to your cart.\nThen you can click on the 'Continue Shopping' button.");
				}
				else
					AddCookieData('hp_cart',sCookieData,60);

if (sCrossSell != "")
{

	var re = /^http(s){0,1}:\/\/[a-z0-9-]+(\.[a-z0-9-]+)*\.hp\.com([/?].*)?/;
	if (sCrossSell.search(re)== -1)
	{
		window.parent.document.location = "http://h10010.www1.hp.com/" + sCrossSell;
	}
	else
	{
		window.parent.document.location = sCrossSell;
	}
}
				//Add data to list
				aProductData = sCookieData.split("~");
			}
			else
			{
				if (sCookieData == null || sCookieData == "")
				{
					aProductData = "";

				}
				else
				{
					//Have cookie data but no new data
					//Add data to list
					aProductData = sCookieData.split("~");
				}
			}
		}// end of Add

		if (sState == "Del")
		{
			if (sSKU != "" && sSKU != "-1")
			{
				if (sCookieData == null || sCookieData == "")
				{
					//Nothing to remove from
				}
				else
				{
					//Remove SKU from CookieData
					//Add data to list
					aProductData = sCookieData.split("~");
					nRowCount = aProductData.length;
					sCookieData = "";
					for (i = 0; i < (nRowCount-1); i++)
					{
						aProductLine = aProductData[i].split("|");

						if (InStr(aProductLine[0], sSKU) > 0)
						{
							nQuantity = aProductLine[3];
							if (IsNumeric(nQuantity) )
							{
								nQuantity = ((1*nQuantity) - 1);
							}
							else
							{
								nQuantity = 0;
							}

							//Found SKU -- do not save check Quantity
							if (nQuantity > 0)
							{
								sCookieData = sCookieData + aProductLine[0] + "|" + aProductLine[1] + "|" + aProductLine[2] + "|" + nQuantity + "|" + aProductLine[4] + "|" + aProductLine[5] + "|" + aProductLine[6]  + "~";

							}
						}
						else
						{
							sCookieData = sCookieData + aProductLine[0] + "|" + aProductLine[1] + "|" + aProductLine[2] + "|" + aProductLine[3] + "|" + aProductLine[4] + "|" + aProductLine[5] + "|" + aProductLine[6]  + "~";
						}
					}
					//Set Cookie
					ClearCookieData('hp_cart');
					AddCookieData('hp_cart',sCookieData,60);

					sCookieData  = GetCookieData('hp_cart');
					aProductData = sCookieData.split("~");

				}
			}
			else
			{
				if (sCookieData == null || sCookieData == "")
				{
					aProductData = "";

				}
				else
				{
					//Have cookie data but no new data
					//Get data to list
					aProductData = sCookieData.split("~");
				}
			}
		} // end of Del

		sPageData = "<style>" + String.fromCharCode(10);
		sPageData = sPageData + ".rl_small {font-size: 10px;font-family: Verdana, Tahoma, Helvetica, Arial, Geneva, Sans-Serif;}" + String.fromCharCode(10);
		sPageData = sPageData + ".rl_body {font-size: 12px;font-family: Helvetica, Arial, Geneva, Sans-serif;font-weight: normal;}" + String.fromCharCode(10);
		sPageData = sPageData + ".rl_bodybold {font-size: 12px;font-family: Helvetica, Arial, Geneva, Sans-serif;font-weight: bold;}" + String.fromCharCode(10);
		sPageData = sPageData + ".rl_linkbodybold {font-size: 12px;font-family: Helvetica, Arial, Geneva, Sans-serif;font-weight: bold;text-decoration: underline;}" + String.fromCharCode(10);
		sPageData = sPageData + ".rl_subtitle {text-decoration: none;font-family: Helvetica, Arial, Geneva, Sans-serif;font-size: 14px;font-weight: bold;color: rgb(0,0,0);}" + String.fromCharCode(10);
		sPageData = sPageData + "</style>" + String.fromCharCode(10);

		sPageData = sPageData + "<table border='0' cellpadding='0' cellspacing='0' width='165' Sumary='Cart List Table'>" + String.fromCharCode(10);

		sPageData = sPageData + "<tr><td class='small' colspan='2' height='5' width='165' bgcolor='#F0F0F0'><img src='http://h30218.www3.hp.com/images/blank.gif' width='165' height='5'></td></tr>" + String.fromCharCode(10);
		sPageData = sPageData + "<tr><td class='small' rowspan='6' width='2' bgcolor='#F0F0F0'><img src='http://h30218.www3.hp.com/images/blank.gif' width='2'></td><td width='163' bgcolor='#F0F0F0'><table border='0' cellpadding='0' cellspacing='0' width='163' name ='Cart List' ID='Cart List'>" + String.fromCharCode(10);

		sPageData = sPageData + "<tr><td class='small' colspan='2' bgcolor='#F0F0F0' width='163' Summary='Cart List Title' valign='middle' align='left'><a href='#' onClick='BuyNow();return false;' border='0'><img src='http://h71016.www7.hp.com/images/snf25_blue_icon_cart.gif' width='20' height='13' border='0' valign='middle'></a>&nbsp;<a title='Shopping cart' target='_top' class='udrline' href='#' onClick='BuyNow();return false';>Shopping cart</a></td></tr>" + String.fromCharCode(10);
		sPageData = sPageData + "<tr><td class='small' colspan='2' bgcolor='#F0F0F0'><img src='http://h30218.www3.hp.com/images/blank.gif' width='163' height='3'></td></tr>" + String.fromCharCode(10);
		sPageData = sPageData + "<tr><td class='small' colspan='2' bgcolor='#F0F0F0' width='100%'><table border='0' cellpadding='0' cellspacing='0' width='163' Summary='SubTotal Header'>" + String.fromCharCode(10);

		if (aProductData.length > 0)
		{
			sPageData = sPageData + "<tr><td class='small' valign='middle' align='left' width='96'><b>Item/Qty</b></td><td valign='middle' align='left' width='55'><b>Price&nbsp;</b></td><td valign='middle' align='center' width='12'></td></tr>" + String.fromCharCode(10);
			sPageData = sPageData + "<tr><td class='small' colspan='4' bgcolor='#000000' align='center'><img src='http://h30218.www3.hp.com/images/blank.gif' width='163' height='1'></td></tr>" + String.fromCharCode(10);
		}
		else
		{
			sPageData = sPageData + "<tr><td class='small' valign='middle' align='left' width='100%' colspan='4'></td></tr>" + String.fromCharCode(10);
			sPageData = sPageData + "<tr><td class='small' colspan='4' bgcolor='#000000' align='center'></td></tr>" + String.fromCharCode(10);
		}

		if (PreCartData != "")
		{

			//We have pre cart data
			var aTemp = PreCartData.split("|");
			if (isArray(aTemp))
			{
				if (aTemp.length > 0)
				{
					nSubTotal = nSubTotal + (parseFloat(aTemp[1].replace(",","")) * 1);
					sPageData = sPageData + "<tr><td class='small' colspan='3' valign='middle' align='left'>Items previously added to cart</td></tr>" + String.fromCharCode(10);
					sPageData = sPageData + "<tr><td class='small' valign='middle' align='center' 96>" + aTemp[0] + "</td><td valign='middle' align='left' width='55'>" + String.fromCharCode(10);
					sPageData = sPageData + formatCurrency(aTemp[1]) + "&nbsp;</td>" + String.fromCharCode(10);
					sPageData = sPageData + "<td width='12' height='14' align='center'><img src='http://h30218.www3.hp.com/images/blank.gif' width='12' height='1'></td></tr>" + String.fromCharCode(10);
				}
			}
		}

		if (isArray(aProductData))
		{


			nRowCount = aProductData.length;
			SKUTotal = "";

			for (i = 0; i < (nRowCount-1); i++)
			{
				aProductLine = aProductData[i].split("|");
				if (isArray(aProductLine))
				{
					sPageData = sPageData + "<tr><td class='small' colspan='3' valign='middle' align='left'>" + aProductLine[1] + "</td></tr>" + String.fromCharCode(10);
					sPageData = sPageData + "<tr><td class='small' valign='middle' align='center'>" + aProductLine[3] + "</td>" + String.fromCharCode(10);
					sPageData = sPageData + "<td class='small' valign='middle' align='left'>" + formatCurrency(aProductLine[2]) + "&nbsp;</td>" + String.fromCharCode(10);

					sTemp = "cii_RemoveProductData(" + String.fromCharCode(34) + aProductLine[0] + String.fromCharCode(34) + "," + String.fromCharCode(34) + String.fromCharCode(34) + "," + String.fromCharCode(34)  + String.fromCharCode(34) + ");";

					//sPageData = sPageData + "<td class='small' width='16' height='16' align='center'><img src='http://h30218.www3.hp.com/oemsites/7240393/cart/delete_trash_trans.gif' title='Delete'; alt='Delete'; width='16' height='16' onClick='cii_RemoveProductData(" + aProductLine[0] + ","","");' style='cursor:hand';></td></tr>" + String.fromCharCode(10);
					sPageData = sPageData + "<td class='small' width='16' height='16' align='center'><img src='http://h30218.www3.hp.com/oemsites/7240393/cart/delete_trash_trans.gif' title='Delete'; alt='Delete'; width='16' height='16' onClick='" + sTemp + "' style='cursor:hand';></td></tr>" + String.fromCharCode(10);
					sTemp	 = "";
					nSubTotal = nSubTotal + (aProductLine[2] * aProductLine[3]);

					SKUTotal = SKUTotal + ";" + aProductLine[0] + ";;;event15=" + (aProductLine[2] * aProductLine[3]) + ",";
					aProductLine = "";
				}
			}
			SKUTotal = SKUTotal + ";";
		}

		// Generate Omniture data
		s_products = SKUTotal;

		sPageData = sPageData + "</tr><tr><td class='small' colspan='3' bgcolor='#000000' align='center'><img src='http://h30218.www3.hp.com/images/blank.gif' width='165' height='1'></td></tr>" + String.fromCharCode(10);
		if (nSubTotal > 0)
		{
			sPageData = sPageData + "<tr><td class='small' bgcolor='#F0F0F0' valign='middle' align='left' id='total' name='total' width='96'><b>Total:</b></td><td colspan='2' bgcolor='#F0F0F0' width='67' valign='middle' align='left' id='total value' name='total value'>" + formatCurrency(nSubTotal) + "</td></tr></table></td></tr></table></td></tr>" + String.fromCharCode(10);
		}
		else
		{
			sPageData = sPageData + "<tr><td class='small' bgcolor='#F0F0F0' valign='middle' align='left' id='total' name='total' width='96' colspan='3'><b>Your cart is empty</b></td></tr></table></td></tr></table></td></tr>" + String.fromCharCode(10);
		}

		sPageData = sPageData + "<tr><td class='small' bgcolor='#F0F0F0' width='165'><img src='http://h30218.www3.hp.com/images/blank.gif' width='100%' height='5'></td></tr>" + String.fromCharCode(10);
		if (nSubTotal > 0)
		{
			sPageData = sPageData + "<tr><td class='small' bgcolor='#F0F0F0' width='165' align='center'><a href='#' onClick='BuyNow();return false;' border='0'><img src='http://www.hp.com/sbso/images/oov/common/oov_viewcart_checkout_btn.gif' title='View Cart & Checkout' alt='View Cart & Checkout' width='131' height='20' border='0' style='cursor:hand';></a></td></tr>" + String.fromCharCode(10);
		}
		else
		{
			sPageData = sPageData + "<tr><td class='small' bgcolor='#F0F0F0' width='165' align='left'></td></tr>" + String.fromCharCode(10);
		}
		sPageData = sPageData + "<tr><td class='small' height='10' width='165' bgcolor='#F0F0F0'><img src='http://h30218.www3.hp.com/images/blank.gif' width='100%' height='10'></td></tr></table>" + String.fromCharCode(10);


		el.innerHTML = sPageData;

	}
}
/* */


var BrowserDetect = {
	init: function ()
	{
		this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
		this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
		this.OS = this.searchString(this.dataOS) || "an unknown OS";
	},
	searchString: function (data)
	{
		for (var i=0;i<data.length;i++)	{
			var dataString = data[i].string;
			var dataProp = data[i].prop;
			this.versionSearchString = data[i].versionSearch || data[i].identity;
			if (dataString) {
				if (dataString.indexOf(data[i].subString) != -1)
					return data[i].identity;
			}
			else if (dataProp)
				return data[i].identity;
		}
	},
	searchVersion: function (dataString)
	{
		var index = dataString.indexOf(this.versionSearchString);
		if (index == -1) return;
		return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
	},
	dataBrowser: [
		{ 	string: navigator.userAgent,
			subString: "OmniWeb",
			versionSearch: "OmniWeb/",
			identity: "OmniWeb"
		},
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.vendor,
			subString: "iCab",
			identity: "iCab"
		},
		{
			string: navigator.vendor,
			subString: "KDE",
			identity: "Konqueror"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{
			string: navigator.vendor,
			subString: "Camino",
			identity: "Camino"
		},
		{		// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 		// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
	dataOS : [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

};

BrowserDetect.init();

function cii_StartCart(rsJumpId, rsOMData)
{


	var segment_cookie = getCookie("hp_cust_seg_sel");
	if ( segment_cookie=="GHE"){
		document.getElementById('divcart').innerHTML = "";
		return;
	}

	if (document.getElementById('divcart'))
	{
			if (InStr(BrowserDetect.browser, "Explorer") > -1)
			{
		
				GetCartIE(rsJumpId, rsOMData);
			}
			else
			{
		
				GetCartFF(rsJumpId, rsOMData);
			}
	}
}

function GetCartIE(rsJumpId, rsOMData)
{
	
	var segment_cookie = getCookie("hp_cust_seg_sel");
	if ( segment_cookie=="GHE"){
		document.getElementById('divcart').innerHTML = "";
		return;
	}

		var data    = "";
		var data1   = "";
		var aData   = "";
		var table   = document.getElementById('minicart');
		var tbodies = "";
		var trs     = "";
		var tds     = "";
		var oDiv = document.getElementById('divcart');
		
		data1 = oDiv.innerHTML;
		//data1 = data1.replace(String.fromCharCode(13), "");
		//data1 = data1.replace(String.fromCharCode(10), "");


		if (isNaN(table))
		{
			//Have table check for data type.
			if (InStr(data1, "Your cart is empty") < 0)
			{
				if(table.getElementsByTagName("tbody") )
				{
					tbodies = table.getElementsByTagName("tbody");
					if (isNaN(tbodies[0].getElementsByTagName("tr")) )
					{
						trs = tbodies[0].getElementsByTagName("tr");
						if (isNaN(trs[0].getElementsByTagName("td")) )
						{
							tds  = trs[3].getElementsByTagName("td");
//document.codeform.sStatus.value = tds[1].innerHTML;
							data = tds[1].innerHTML;

							aData = data.split("</TABLE>");
							data  = aData[0];
							aData = data.split("</TR>");
							data  = aData[0];
							data1 = aData[1];

							aData = data.split("</TD>");
							data  = aData[0];
							aData = data.split("Items: ");
							data  = aData[1];

							aData = data1.split("</TD>");
							data1 = aData[2];
							aData = data1.split("$");
							data1 = aData[1];
							data1 = data1.replace("/", "");
							data1 = data1.replace("&gt;", "");
							data1 = data1.replace('"', '');
							
							data = data.replace("/", "");
							data = data.replace("&gt;", "");
							data = data.replace('"', '');
							data = data + "|" + data1;
						}
					}
				}
			}
			else
			{
				data = "";
			}

oDiv.innerHTML = "";

			var ajax = "ajaxManager('cartlist.asp', 'divcart', -1, '', -1, 'Cart', '" + data + "', '" + rsJumpId + "', '" + rsOMData  + "', '-1')";

			eval(ajax);
		}

}

function GetCartFF(rsJumpId, rsOMData)
{
	try
	{
	var segment_cookie = getCookie("hp_cust_seg_sel");
	if ( segment_cookie=="GHE"){
		document.getElementById('divcart').innerHTML = "";
		return;
	}

		var table   = document.getElementById('minicart');
		var tbodies = "";	//table.getElementsByTagName("tbody");
		var trs     = "";	//tbodies[0].getElementsByTagName("tr");
		var tds     = "";	//trs[3].getElementsByTagName("td");
		var data    = "";
		var data1   = "";
		var oDiv    = document.getElementById('divcart');
		data1 = oDiv.innerHTML;

		if (isNaN(table))
		{
			//Have table check for data type.
			if (InStr(data1, "Your cart is empty") < 0)
			{
				if (isNaN(document.getElementById('Table1')) ) //MC 1.3
				{
					table   = document.getElementById('Table1');
					if (isNaN(table.getElementsByTagName("tbody")) )
					{
						tbodies = table.getElementsByTagName("tbody");
						if (isNaN(tbodies[0].getElementsByTagName("tr")) )
						{
							trs = tbodies[0].getElementsByTagName("tr");
							if (isNaN(trs[0].getElementsByTagName("td")) )
							{
								tds  = trs[0].getElementsByTagName("td");
								if (isNaN(tds[0]) )
								{
									data = tds[0].innerHTML;
									if (isNaN(trs[1]) )
									{
										tds  = trs[1].getElementsByTagName("td");
										if (isNaN(tds[2]) )
										{
											data = data + tds[2].innerHTML;
											data = data.replace(" ", "");
											data = data.replace("Items:", "");
											data = data.replace("$","|");

											data = data.replace("/", "");
											data = data.replace("&gt;", "");
											data = data.replace('"', '');

										}
									}
								}
							}
						}
					}
					oDiv.innerHTML = "";
				}
			}
			var ajax = "ajaxManager('cartlist.asp', 'divcart', -1, '', -1, 'Cart', '" + data + "', '" + rsJumpId + "', '" + rsOMData + "', '-1')";

			eval(ajax);
		}
	} // end of try
	catch(err)
	{
		var txt="FF-Error(" + err.number + "):" + err.name + "\n";
		txt+="Description: " + err.description + "\n";
		txt+="Message: " + err.message + "\n\n";
		alert(txt);
	} // End of catch
}

function cii_receipt_List_Add(rsSKU, rsName, rdPrice, rsJumpID, rsCrossSell, rnRGID)
{
	var segment_cookie = getCookie("hp_cust_seg_sel");
	if ( segment_cookie=="GHE"){
		document.getElementById('divcart').innerHTML = "";
		return;
	}

	//	rsSKU	: Required, String
	//	rsName	: Required, String
	//	rsPrice	: Required, Double
	//	rsJumpID : Required, String
	//	rsCrossSell : Required, String
	//	rnRGID : Required, String
	
	var oDiv = "";
	oDiv = document.getElementById('divcart');
	oDiv.innerHTML = "";

	ajaxManager('cartlist.asp', 'divcart', rsSKU, unescape(rsName), rdPrice, 'Add',-1 ,rsJumpID, rsCrossSell, rnRGID);
}
function getCookie(c_name)
{
if (document.cookie.length>0)
  {
  c_start=document.cookie.indexOf(c_name + "=");
  if (c_start!=-1)
    {
    c_start=c_start + c_name.length+1;
    c_end=document.cookie.indexOf(";",c_start);
    if (c_end==-1) c_end=document.cookie.length;
    return unescape(document.cookie.substring(c_start,c_end));
    }
  }
return "";
}
function cii_RemoveProductData(sSKU, rsJumpID, rsOMData)
{
	//	rsSKU	:  Required, String
	//	rsJumpID : Required, String
	//	rsOMData : Required, String
	var segment_cookie = getCookie("hp_cust_seg_sel");
	if ( segment_cookie=="GHE"){
		document.getElementById('divcart').innerHTML = "";
		return;
	}

	var oDiv = "";
	oDiv = document.getElementById('divcart');
	oDiv.innerHTML = "";

	ajaxManager('cartlist.asp', 'divcart',sSKU, '', 0, 'Del',-1 , rsJumpID, rsOMData, -1);
}

function InStr(strSearch, charSearchFor)
{
	var i = strSearch.match(charSearchFor);

	if (i == null)
	{
		return -1;
	}
	return i.length;
}

function IsNumeric(sText)
{
	var ValidChars = "0123456789.";
	var IsNumber=true;
	var Char;

	for (var i = 0; i < sText.length && IsNumber == true; i++) 
	{ 
		Char = sText.charAt(i); 
		if (ValidChars.indexOf(Char) == -1) 
		{
			IsNumber = false;
		}
	}
	return IsNumber;
}

function isArray(obj)
{
	if (obj == null || obj == "")
		return false;
	if (obj.constructor.toString().indexOf("Array") == -1)
		return false;
	else
		return true;
}

function AddCookieData(c_name,value,expiredays)
{
	var exdate = new Date();
	var path   = "/";
	var domain = "hp.com";
	//var secure = 0;
	
	exdate.setDate(exdate.getDate() + expiredays);

	var curCookie = c_name + "=" + escape(value) +
		((exdate) ? "; expires=" + exdate.toGMTString() : "") +
		((path) ? "; path=" + path : "") +
		((domain) ? "; domain=" + domain : ""); // +
	//	((secure) ? "; secure" : "");
	

	document.cookie = curCookie;
	//document.cookie=c_name+ "=" + escape(value) + ((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
}

function GetCookieData(c_name)
{
	if (document.cookie.length > 0)
	{
		c_start = document.cookie.indexOf(c_name + "=");
		if (c_start != -1)
		{
			c_start = c_start + c_name.length + 1;
			c_end   = document.cookie.indexOf(";",c_start);
			if (c_end == -1)
			{
				c_end = document.cookie.length;
			}
			return unescape(document.cookie.substring(c_start,c_end));
		}
	}
	return "";
}

function ClearCookieData(c_name)
{
	AddCookieData(c_name,"",-1000);
}

function formatCurrency(num)
{
	if (num != null && num != "")
	{
		num = num.toString().replace(/\$|\,/g,'');
		if(isNaN(num))
			num = "0";

		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num*100+0.50000000001);
		cents = num%100;
		num = Math.floor(num/100).toString();
		if(cents<10)
			cents = "0" + cents;

		for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)

		num = num.substring(0,num.length-(4*i+3))+','+
		num.substring(num.length-(4*i+3));

		return (((sign)?'':'-') + '$' + num + '.' + cents);
	}
	else
	{
		return ('$0.00');
	}
}

function BuyNow()
{
	var segment_cookie = getCookie("hp_cust_seg_sel");
	if ( segment_cookie=="GHE"){
		document.getElementById('divcart').innerHTML = "";
		return;
	}

	var lsURL        = "";
	var nRGID        = "";
	var sSKU         = "";
	var sPrice       = "";
	var sJumpID      = "";
	var HP_CrossSell = "";
	var oWin         = "";
	var sCookieData	 = GetCookieData('hp_cart');
	var aProductData = "";
	var aProductLine = "";
	var nRowCount    = -1;

	//s_sendCustomLinkEvent_PSC('','Pre Release - Testing');

	// Loop through cookie data
	aProductData = sCookieData.split("~");
	if (isArray(aProductData))
	{
		nRowCount = aProductData.length;

		for (i = 0; i < (nRowCount-1); i++) 
		{
			aProductLine = aProductData[i].split("|");
			if (i == 0)
			{
				sJumpID      = aProductLine[4];
				HP_CrossSell = ''; //aProductLine[5];
				nRGID        = aProductLine[6];
			}

			//check for mulitple skus
			for (j = 0; j<= (aProductLine[3]-1); j++)
			{
				if (sSKU != "")
				{
					sSKU = sSKU + "," + aProductLine[0];
				}
				else
				{
					sSKU = aProductLine[0];
				}
			}
		}
		ClearCookieData('hp_cart');
		lsURL = 'http://h30218.www3.hp.com/oemsites/7240393/cii_cart_service_api.asp?1=1&nRGID=' + nRGID + '&sJumpID=' + sJumpID + '&HP_CrossSell=' + HP_CrossSell + '&sSKU=' + sSKU;
	
		oWin = document.location = lsURL;
	}
	else
	{
		lsURL = 'http://h71016.www7.hp.com/dstore/dcart/cart.asp?HeaderAction=ViewCart&jumpid=re_r295_store/left/all/viewcart';
	
		oWin = document.location = lsURL;
	}	
}

function CrossSellLoad(sCrossSell)
{
	var lsURL        = "";

	lsURL = 'http://' + sCrossSell;

	oWin = document.location = lsURL;
}

/* */
