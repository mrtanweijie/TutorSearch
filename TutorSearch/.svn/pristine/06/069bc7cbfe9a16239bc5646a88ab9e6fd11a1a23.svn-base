/*
author : laoshu133
create : 2011.09.01
description : 51统计代码
homepage : www.laoshu133.com
*/
;(function(window){var
doc=window.document,getInt=function(n){return parseInt(n,10)||0;},cookie=function(name,val){var re,str='',type=typeof val;if(val!==void 0){if(type==='object'){str=name+'='+val.value+'; path=';str+=(val.path?val.path:'/')+'; ';str+=val.expires?'expires='+val.expires:'';}
else{str=name+'='+val;}
doc.cookie=str;}
else{re=new RegExp('(?:^| )'+name+'=([^;]*)(?:;|$)');str=re.test(doc.cookie)?RegExp.$1:'';return str;}},url='http://web1.51.la:82/go.asp?svid=8',addParm=function(name,val){url+='&'+name+'='+val;},dt=new Date(),zone=-dt.getTimezoneOffset()/60,pageStr='AJSTAT_ok_pages',timeStr='AJSTAT_ok_times',page=getInt(cookie(pageStr))+1,times=getInt(cookie(timeStr))||1,depth=screen.pixelDepth||screen.colorDepth,wh=screen.width+','+screen.height,vpage=window.location;dt.setTime(dt.getTime()+60*60*1000),referrer=doc.referrer;cookie(pageStr,{value:page,expires:dt.toGMTString()});times+=page===1?1:0;dt.setTime(dt.getTime()+365*24*60*60*1000);cookie(timeStr,{value:times,expires:dt.toGMTString()});try{referrer=window.parent.document.referrer}catch(_){};try{referrer=top.document.referrer}catch(_){};referrer=escape(referrer);try{vpage=window.parent.location;}catch(_){}
vpage=escape(vpage);var img=window['ls133_51_'+(new Date()).getTime()]=new Image(),names=['id','tpages','ttimes','tzone','tcolor','sSize','referrer','vpage'],vals=['5372017',page,times,zone,depth,wh,referrer,vpage],i=0,len=vals.length;for(;i<len;i++)addParm(names[i],vals[i]);img.src=url;})(this);