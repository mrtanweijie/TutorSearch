
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="../css/tour.css"/>
  <title>搜索结果</title>
  </head>
  <body>
  <div class="allbody">
  <div class="header">
 <ul>
				<li id="login"><a href="/user/login-1.jsp">登陆</a></li>
				<li>|</li>
				<li id="register"><a href="/user/register.jsp">注册</a></li>
				<li>|</li>
				<li><a href="#">帮助</a></li>
				<li>|</li>
				<li><a href="#">收藏本站</a></li>
			</ul>
  </div>
  <!--导航 -->
  <div class="content">

 <!--logo-->
<div style="float:left; width:230px; margin-top:25px; margin-left:140px;">
<img src="../images/logo2.png" width="179" height="70" alt="logo" />
</div>
  <div class="nav"> 	<ul>
					<li><a href="../index.jsp">首页</a></li>
					<li><a href="#">家教</a></li>
					<li><a href="/tutor/addtutor1.jsp">家教发布</a></li>
					<li><a href="/tutor/search.jsp">高级搜索</a></li>
					<li><a href="/user/search.jsp">教员库</a></li>
					<li><a href="/user/addmyinfo.jsp">成为教员</a></li>
					<li id="myinfo"><a href="#">个人中心</a></li>
				</ul>
  </div>
  </div>
 
  <div style="border-top:#4f9fdf solid 3px; width:100%; margin-top:1px; position:absolute; z-index:1px;"> 
  <div style="width:70%; margin-left:auto; margin-right:auto; height:100px;">
  <!-- 搜索框-->
  <div style="border:#CCC thin solid; height:60px; margin-top:20px;background:#F7F7F7" >
  <form id="search" method="get" action="search">
  <div style="margin-left:10px; margin-top:5px">
<div style="float:left">
<input type="text" style="width:490px; height:40px" id="searchText" name="searchText" value="输入关键字，如：数学家教"></div>

<div style="float:left; margin-left:10px">
<input type="submit"  style="width:80px; height:45px; background:url(../images/st-1.png);no-repeat; border:none; " value=""></div>

</div></form>
    <br />
  </div>
  <!--搜索结果-->
  <div style="border:#CCC thin solid;margin-top:20px">
  <div style="font-size:15px; color:#999; margin-left:20px;margin-top:10px">本次共${num}条搜索结果，共耗时${totalTime}豪秒</div>
  
 <#list tutors as tutor>  
<div style="width:80%;margin-left:20px; margin-top:35px; height:80px">
  <div id="t_title" style=" float:left; width:100%">
  <a href="/tutor/${tutor.id}">
  <span style="font-size:20px; color:#333; font-weight:bold">${tutor.title}</span>
  </a>
  </div>
  
  <div id="t_content" style="float:left; width:100%; height:auto;font-size:15px; color:#333;margin-top:10px">
${tutor.content}</div>
  
  <div id="t_url" style="float:left; width:60%;margin-top:10px">
  <a href="/TutorSearch/tutor/${tutor.id}"><span style="color:#36C">http://tutor.sturgeon.mopaas.com/tutor/show/${tutor.id}</span></a>
  </div>
  <div id="t_date" style="float:left; width:30%; margin-left:15px;margin-top:10px">
  <span style="color:#36C">${tutor.date}</span>
  </div>
</div>
  </#list>
 
 <div style="height:35px;margin-left:20px;margin-top:10px">
 <span style=" font-size:20px; font-weight:bold;color:#333;">相关搜索</span>
 </div>
 
 <div style="height:35px;margin-left:20px;">
 <#list rws_list as list>
 <a href="/TutorSearch/tutor/search?searchText=${list}">
 <span style=" font-size:15px;color:#333; margin-right:15px"> ${list}</span></a>
 </#list>
 </div>

  </div>
   <div style="border-top:#4F9FDF 2px solid;margin-top:10px; width:100%; height:100px">
    <center>
  <div style="margin-top:30px">版权所有&copy;广西师范大学计信学院 2013年12月10日</div>
  </center>
   </div>
  </div> 
  </div>
  </div>

  </body>
  </html>

