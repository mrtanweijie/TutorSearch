<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/tour.css"/>
  <title>家教详细信息</title>
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
 
  <div style="border-top:#4f9fdf solid 3px; width:1345px; margin-top:1px; position:absolute; z-index:1px;"> 
  <div style="width:70%; margin-left:auto; margin-right:auto;">
  <!-- 搜索框-->
  <div style="border:#CCC thin solid; height:55px; margin-top:20px;background:#F7F7F7" >
  <form id="search" method="get" action="search">
    <div style="margin-left:10px; margin-top:5px">
<div style="float:left">
<input type="text" style="width:490px; height:40px" id="searchText" name="searchText" value="输入关键字，如：数学家教"></div>

<div style="float:left; margin-left:10px">
<input type="submit"  style="width:80px; height:45px; background:url(../images/st-1.png);no-repeat; border:none; " value=""></div>

</div></form>
    <br />
  </div>
  <!--详细信息-->
  <div style="border:#CCC thin solid;margin-top:20px">

  <div style="width:80%;margin-left:20px; margin-top:20px; height:600px">
  
  <div id="t_title" style=" float:left; width:100%;margin-top:5px;">
  <a href="#">
  <span style="font-size:20px; color:#333; font-weight:bold"> ${tutor.title}</span>
  </a>
  </div>
  <div style=" float:left; width:100%;margin-top:20px">
   <div id="t_url" style="float:left; width:15%">
  科目： ${tutor.subject}
  </div>
  
  <div id="t_url" style="float:left; width:15%">
  年级： ${tutor.grade}
  </div>
  
   <div id="t_url" style="float:left; width:30%">
  ${tutor.province}/ ${tutor.city}/<#if tutor.region??>${tutor.region} <#else>未填写</#if> 
  </div>
  

 
   <div id="t_url" style="float:left; width:20%">
 浏览： ${tutor.browse}次
  </div>
     <div id="t_url" style="float:left; width:20%">
 发布： ${tutor.date}
  </div>

  </div>
  <div id="t_content" style="float:left; width:100%;font-size:15px; color:#333;margin-top:15px">
  ${tutor.content}</div>
 <div style="float:left;; font-size:15px; border-top:#CCC thin solid;margin-top:15px; width:100%;">
  <div id="t_url" style="float:left; margin-top:5px; width:60%">
  家长： ${tutor.patriarch}
  </div>
  
  <div id="t_url" style="float:left;  margin-top:5px; width:80%">
  电话：${tutor.phone}</div>
  <div id="t_url" style="float:left;  margin-top:5px; width:60%">
  报酬：${tutor.pay}元/小时
  </div>
  <div id="t_url" style="float:left; margin-top:5px;  width:60%">
 有效时间：${tutor.end}
  </div>
</div>
  <div id="t_date" style="float:left;; font-size:15px; border-top:#CCC thin solid;margin-top:15px; width:100%;">
  <div id="t_date" style="float:left;  margin-top:5px; width:60%; ">
 专业要求：${tutor.req_major}
  </div>
   <div id="t_date" style="float:left;  margin-top:5px; width:60%; ">
  其他要求：${tutor.req_sex}
  </div>

  
  </div>
  
  <div id="t_date" style="float:left;; font-size:15px; border-top:#CCC thin solid;margin-top:15px; width:100%;">
  <div id="t_date" style="float:left;  margin-top:5px; width:60%; ">
其他说明：${tutor.others}
  </div>
  </div>
  <div style=" float:left;width:100%; height:200px; margin-top:10px;">
  <div style=" margin-left:5px;margin-top:10px; margin-bottom:10px; font-size:14px">留言评论：</div>
  <textarea name="" cols="103" rows="7"></textarea>
  <div style=" margin-left:5px;margin-top:10px; margin-bottom:10px; font-size:14px">
  <input  type="button" value="发布"/>
  </div>
  </div>
</div>
   </div>
  </div> 
  
   <div style="width:70%; margin-left:auto; margin-right:auto; margin-top:10px; height:200px; border-top:#4F9FDF 2px solid">
    <center>
  <div style="margin-top:30px">版权所有&copy;广西师范大学计信学院 2013年12月10日</div>
  </center>
   </div>
  </div>
  </div>

  </body>
  </html>
