<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>完善个人资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/common.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="admin/css/admin.css"/>
  </head>
  
 <body>
 <div id="man_zone">
<div id="body" class="mybody">
<div id="header" class="header"><div style="margin-left:">完善/修改资料</div></div>
<form  method="post" action="<%=request.getContextPath()%>/Admin/com_info">
<input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("id")%>"/>
<div class="myform">
<table style="BORDER-COLLAPSE: collapse" borderColor=#ccc cellSpacing=0 width=645 bgColor=#ffffff border=1" >
  <tr>
    <td width="80" class="mytdc">真实姓名：</td>
    <td width="231"><input type="text" name="realname"
								id="realname" class="myinput"/></td>
    <td width="86"  class="mytdc">电话：</td>
    <td width="230"><input type="text" name="phone"
								id="phone" class="myinput"/></td>
  </tr>
  <tr>
    <td class="mytdc">年龄：</td>
    <td><input type="text" name="age"
								id="age" class="myinput"/></td>
    <td class="mytdc">性别：</td>
    <td><input type="text" name="sex"
								id="sex" class="myinput"/></td>
  </tr>
  <tr>
    <td class="mytdc">大学：</td>
    <td><input type="text" name="university"
								id="university" class="myinput"/></td>
    <td class="mytdc">专业：</td>
    <td><input type="text" name="major"
								id="major" class="myinput"/></td>
  </tr>
  <tr>
    <td class="mytdc">学历：</td>
    <td><select name="academic" size="1"
								id="academic" class="myinput">
									<option>研究生</option>
									<option>本科</option>
									<option>大专</option>
							</select>
   </td>
    <td class="mytdc">年级：</td>
    <td>
								<select name="grade" size="1"
								id="grade" class="myinput">
									<option>大一</option>
									<option>大二</option>
									<option>大三</option>
									<option>大四</option>
									<option>研一</option>
									<option>研二</option>
							</select>
								</td>
  </tr>
  <tr>
    <td colspan="4" class="mytdc">个人介绍：</td>
    </tr>
  <tr>
    <td colspan="4" class="mytdc"><textarea name="intriduction" class="myinputtf" id="intriduction"></textarea>
     
    </td>
    </tr>
  <tr>
    <td colspan="4" class="mytdc">其他说明：</td>
    </tr>
  <tr>
    <td colspan="4" class="mytdc"><textarea name="other" class="myinputtf" id="other"></textarea></td>
    </tr>
  <tr>
    <td colspan="4" class="mytdc"><input type="submit" name="bt_ok"id="bt_ok" value="修改"  class="mybutton"/></td>
    </tr>
</table>

</div></form>

</div>
<div id="footer"></div>
</body>
</html>
