<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>个人资料</title>  
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">  
    <link rel="stylesheet" href="css/common.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../admin/css/admin.css"/>
  </head>    
  <body>
     <div id="man_zone">
	<div id="body" class="mybody">
		<div id="header" class="header">
			<div style="margin-left:">个人资料</div>
		</div>

		<div class="myform">
<table style="BORDER-COLLAPSE: collapse" borderColor=#ccc cellSpacing=0 width=600 bgColor=#ffffff border=1 font-size:12" >
  <tr >
    <td width="80" class="mytd">登录名：</td>
    <td width="200">${user.name}</td>
    <td width="80" class="mytd">邮箱：</td>
    <td width="222">${user.email}</td>
  </tr>
  <tr>
    <td class="mytd">真实姓名：</td>
    <td><#if (userinfo.realname)??>${userinfo.realname}<#else>尚未填写</#if></td>
    <td class="mytd">电话：</td>
    <td><#if (userinfo.phone)??>${userinfo.phone}<#else>尚未填写</#if></td>
  </tr>
  <tr>
    <td class="mytd">年龄：</td>
    <td><#if (userinfo.age)??>${userinfo.age}<#else>尚未填写</#if></td>
    <td class="mytd">性别：</td>
    <td><#if (userinfo.sex)??>${userinfo.sex}<#else>尚未填写</#if></td>
  </tr>
  <tr>
    <td class="mytd">大学：</td>
    <td><#if (userinfo.university)??>${userinfo.university}<#else>尚未填写</#if></td>
    <td class="mytd">专业：</td>
    <td><#if (userinfo.major)??>${userinfo.major}<#else>尚未填写</#if></td>
  </tr>
  <tr>
    <td class="mytd">学历：</td>
    <td><#if (userinfo.academic)??>${userinfo.academic}<#else>尚未填写</#if></td>
    <td class="mytd">年级：</td>
    <td><#if (userinfo.grade)??>${userinfo.grade}<#else>尚未填写</#if></td>
  </tr>
  <tr>
    <td colspan="4" class="mytd">个人介绍：</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd"><#if (userinfo.intriduction)??>${userinfo.intriduction}<#else>尚未填写</#if></td>
    </tr>
  <tr>
    <td colspan="4" class="mytd">其他说明：</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd"><#if (userinfo.other)??>${userinfo.other}<#else>尚未填写</#if></td>
    </tr>
  <tr>
    <td colspan="4" class="mytd"></td>
    </tr>
</table>

		</div>

	</div>
	<div id="footer"></div>
	</div>
	
</body>
</html> 