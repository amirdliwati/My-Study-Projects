function getRenderingHookId(){
	var rn = new String (Math.random());
	var rns = rn.substring (2, 11);
	return(rns);
}
function addRenderingHookEvent(id,func){
	if(id){
		document.write('<span id="'+id+'"></span>');
	}
	if(func){
		if(window.RenderingHookUse){
			var oldRenderingHook = window.RenderingHook;
			if (typeof window.RenderingHook != 'function'){
				window.RenderingHook = func;
			}else{
				window.RenderingHook = function(){
					oldRenderingHook();
					func();
				}
			}
		}else{
			func();
		}
	}
}
function RenderingHookCallBack(id,Html){
	if(window.RenderingHookUse && id && Html){
		var all_id=id.split(';'),l=all_id.length;
		for (var i = 0; i < l; i++){
			if(window.RenderingHookUse){
				if(document.getElementById(all_id[i])){
					if(typeof Html != 'function'){
						document.getElementById(all_id[i]).innerHTML=Html;
					}else{
						document.getElementById(all_id[i]).innerHTML=Html();
					}
				}
			}
		}
	}else{
		if(Html){
			if(typeof Html != 'function'){
				document.write(Html);
			}else{
				document.write(Html());
			}
		}
		
	}
}
var RenderingHookUse=true;