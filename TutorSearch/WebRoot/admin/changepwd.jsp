<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link rel="stylesheet" href="css/common.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../admin/css/admin.css"/>

<script type="text/javascript" src="../js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"
	charset="gb2312"></script>
<script type="text/javascript" src="../js/jquery.validate.messages_cn.js"></script>
</head>
<body>
<div id="man_zone">
<div id="body" class="mybody">
<div id="header" class="header"><div style="margin-left:">修改密码</div></div>
<form id="register" method="post" action="<%=request.getContextPath()%>/user/create">
<div class="myform">
<table style="BORDER-COLLAPSE: collapse" borderColor=#ccc cellSpacing=0 width=600 bgColor=#ffffff border=1">

						<tr>
							<td width="15%" height="50">旧密码：</td>
							<td width="85%"><input type="password" name="old_password"
								id="old_password" class="myinput"/></td>
						</tr>
				
						<tr>
							<td height="50">新密码：</td>
							<td><input type="password"
								name="new_password" id="new_password"
								class="myinput" />
							</td>
						</tr>
						<tr>
							<td height="50">确认密码：</td>
							<td><input type="password" name="sure_password"
								id="sure_password" class="myinput"/></td>
						</tr>
						<tr>
							<td height="50"></td>
							<td><input type="submit" name="bt_ok"
								id="bt_ok" value="修改"  class="mybutton"/></td>
						</tr>
					</table>
</div>
</form>
</div>
<div id="footer"></div>
</div>
</div>
</body>
</html>