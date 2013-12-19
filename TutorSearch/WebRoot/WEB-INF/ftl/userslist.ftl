<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>user</title>  
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">  
  </head>   
  <style type="text/css"> 
a:link,a:visited,a:hover,.current,#info{ 
    border:1px solid #DDD; 
    background:#F2F2F2; 
    display:inline-block; 
    margin:1px; 
    text-decoration:none; 
    font-size:12px; 
    width:15px; 
    height:15px; 
    text-align:center; 
    line-height:15px; 
    color:#AAA; 
    padding:1px 2px; 
} 
a:hover{ 
    border:1px solid #E5E5E5; 
    background:#F9F9F9; 
} 
.current{ 
    border:1px solid #83E7E4; 
    background:#DFF9F8; 
    margin:1px; 
    color:#27CBC7; 
} 
#info{ 
    width:auto; 
} 
</style>  
  <body>
      <table>  
        <tr>  
            <td>id</td>  
            <td>name</td> 
            <td>email</td>
             <td>show</td>   
            <td>edit</td>  
            <td>delete</td>  
        </tr>
          
        <#list users as user>  
        <tr>  
        <td>${user.id}</td> 
        <td>${user.name}</td> 
        <td>${user.email}</td>  
        <td><a href="/TutorSearch/user/show/${user.id}">show</a></td>
        <td><a href="/TutorSearch/user/user_list.jsp?id=${user.id}&name=${user.name}&email=${user.email}">edit</a></td>  
        <td><a href="/TutorSearch/user/delete/${user.id}">delete</a></td>       
        </tr>  
        </#list>   
    </table>
    <br> 分页userlist:
	<a href="/TutorSearch/user/show/0/5">1</a>
	<a href="/TutorSearch/user/show/5/5">2</a>
	<a href="/TutorSearch/user/show/10/5">3</a>
	<a href="/TutorSearch/user/show/15/5">4</a>
	<br>  
	
	<div id="setpage"></div> 
	<!--隐藏-->
	<input type="hidden" id="mypage" name="mypage" value="${pageNum}"/>
<div id="setpage"></div> 
<script type="text/javascript"> 

	function getuser(target) {
	window.location.href="/TutorSearch/user/show/"+5*(target-1)+"/5";
	}

<!-- 
var totalpage,pagesize,cpage,count,curcount,outstr; 
//初始化 
cpage = 1; 
pagesize = 10; 
outstr = ""; 

function getTotalPage(){
   var page =document.getElementById("mypage").value;  
   
   totalpage=page;
}
function gotopage(target) 
{     
    cpage = target;        //把页面计数定位到第几页 
    setpage(); 
    //reloadpage(target);    //调用显示页面函数显示第几页,这个功能是用在页面内容用ajax载入的情况 
    
    getuser(target);
} 
function setpage() 
{   
    getTotalPage();
    if(totalpage<=10){        //总页数小于十页 
        for (count=1;count<=totalpage;count++) 
        {    if(count!=cpage) 
            { 
                outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+")'>"+count+"</a>"; 
            }else{ 
                outstr = outstr + "<span class='current' >"+count+"</span>"; 
            } 
        } 
    } 
    if(totalpage>10){        //总页数大于十页 
        if(parseInt((cpage-1)/10) == 0) 
        {             
            for (count=1;count<=10;count++) 
            {    if(count!=cpage) 
                { 
                    outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+")'>"+count+"</a>"; 
                }else{ 
                    outstr = outstr + "<span class='current'>"+count+"</span>"; 
                } 
            } 
            outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+")'> next </a>"; 
        } 
        else if(parseInt((cpage-1)/10) == parseInt(totalpage/10)) 
        {     
            outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+(parseInt((cpage-1)/10)*10)+")'>previous</a>"; 
            for (count=parseInt(totalpage/10)*10+1;count<=totalpage;count++) 
            {    if(count!=cpage) 
                { 
                    outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+")'>"+count+"</a>"; 
                }else{ 
                    outstr = outstr + "<span class='current'>"+count+"</span>"; 
                } 
            } 
        } 
        else 
        {     
            outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+(parseInt((cpage-1)/10)*10)+")'>previous</a>"; 
            for (count=parseInt((cpage-1)/10)*10+1;count<=parseInt((cpage-1)/10)*10+10;count++) 
            {         
                if(count!=cpage) 
                { 
                    outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+")'>"+count+"</a>"; 
                }else{ 
                    outstr = outstr + "<span class='current'>"+count+"</span>"; 
                } 
            } 
            outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("+count+")'> next </a>"; 
        } 
    }     
    document.getElementById("setpage").innerHTML = "<div id='setpage'><span id='info'>共"+totalpage+"页|第"+cpage+"页<\/span>" + outstr + "<\/div>"; 
    outstr = ""; 
} 
setpage();    //调用分页 
//--> 



</script> 
	
  </body>  
</html> 