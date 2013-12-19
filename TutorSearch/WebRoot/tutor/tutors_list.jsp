<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="../css/tour.css"/>
  <title>head</title>
  </head>
  <body>
  <div class="allbody">
  <div class="header">
  <ul>
  <li><a href="#">登陆</a></li>  <li>|</li>
  <li><a href="#">注册</a></li>  <li>|</li>
  <li><a href="#">帮助</a></li>  <li>|</li>
  <li><a href="#">收藏本站</a></li>
  </ul>
  </div>
  <!--导航 -->
  <div class="content">

 <!--logo-->
<div style="float:left; width:230px; margin-top:25px; margin-left:140px;">
<img src="../images/logo2.png" width="179" height="70" alt="logo" />
</div>
<div class="nav"> <ul>
<li><a href="../index-1.jsp">首页</a></li>
<li><a href="#">家教</a></li>
<li><a href="add_tutor.jsp">家教发布</a></li>
<li><a href="#">高级搜索</a></li>
<li><a href="#">兼职</a></li>
<li><a href="#">讨论区</a></li>
<li><a href="#">分享区</a></li></ul>
</div>
</div>
 
  <div style="border-top:#4f9fdf solid 2px; width:100%; margin-top:1px; height:600px; position:absolute; z-index:1px;"> 
  <div style="width:70%; margin-left:auto; margin-right:auto; height:100px;">
  <!-- 搜索框-->
  <div style="border:#CCC thin solid; height:55px; margin-top:20px;background:#F7F7F7" >
  
  <table id="__01" width="626" height="48" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2">
			<img src="../images/st_01.jpg" width="51" height="5" alt=""></td>
		<td colspan="2">
			<img src="../images/st_02.jpg" width="491" height="5" alt=""></td>
		<td rowspan="3">
        <input type="button" style="width:84px; height:48px; background:url(../images/st_03.jpg); no-repeat; border:none; " >
			</td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="../images/st_04.jpg" width="50" height="43" alt=""></td>
		<td colspan="2">
        <input type="text" style="width:491px; height:36px" >
			</td>
		<td rowspan="2">
			<img src="../images/st_06.jpg" width="1" height="43" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/st_07.jpg" width="1" height="7" alt=""></td>
		<td>
			<img src="../images/st_08.jpg" width="490" height="7" alt=""></td>
	</tr>
</table>
    <br />
  </div>
  <!--搜索结果-->
  <div style="border:#CCC thin solid;margin-top:20px">
  <div style="font-size:15px; color:#999; margin-left:20px;margin-top:10px">本次共12302条搜索结果，共耗时0.002秒</div>
  
  <div style="width:80%;margin-left:20px; margin-top:20px; height:120px">
  
  <div id="t_title" style=" float:left; width:100%;margin-top:5px;">
  <a href="#">
  <span style="font-size:20px; color:#333; font-weight:bold">寻找一名初三<span style="color:#36C">物理</span>家教</span>
  </a>
  </div>
  
  <div id="t_content" style="float:left; width:100%; height:60px;font-size:15px; color:#333;margin-top:10px">
  七星区物理家教，每天下午7点到9点，要求物理专业大三以上的学生;七星区物理家教，每天下午7点到9点，要求物理专业大三以上的学生;七星区物理家教，每天下午7点到9点，要求物理专业大三以上的学生;七星区物理家教，每天下午7点到9点，要求物理专业大三以上的学生</div>
  
  <div id="t_url" style="float:left; width:60%">
  <a href="#"><span style="color:#36C">http://localhost:8080/tutor/show/2</span></a>
  </div>
  <div id="t_date" style="float:left; width:30%; margin-left:15px">
  <span style="color:#36C">2013-09-19</span>
  </div>
</div>

<div style="width:80%;margin-left:20px; margin-top:20px; height:120px">
  
  <div id="t_title" style=" float:left; width:100%;margin-top:5px;">
  <a href="#">
  <span style="font-size:20px; color:#333; font-weight:bold">寻找一名初三<span style="color:#36C">物理</span>家教</span>
  </a>
  </div>
  
  <div id="t_content" style="float:left; width:100%; height:60px;font-size:15px; color:#333;margin-top:10px">
  七星区物理家教，每天下午7点到9点，要求物理专业大三以上的学生;七星区物理家教，每天下午7点到9点，要求物理专业大三以上的学生;七星区物理家教，每天下午7点到9点，要求物理专业大三以上的学生;七星区物理家教，每天下午7点到9点，要求物理专业大三以上的学生</div>
  
  <div id="t_url" style="float:left; width:60%">
  <a href="#"><span style="color:#36C">http://localhost:8080/tutor/show/2</span></a>
  </div>
  <div id="t_date" style="float:left; width:30%; margin-left:15px">
  <span style="color:#36C">2013-09-19</span>
  </div>
</div>
  
  </div>
  </div> 
  </div>
  </div>

  </body>
</html>