<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员-添加用户</title>
<link rel="stylesheet" href="css/common.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../admin/css/admin.css"/>

<script type="text/javascript" src="../js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"
	charset="gb2312"></script>
<script type="text/javascript" src="../js/jquery.validate.messages_cn.js"></script>
<script type="text/javascript">
	$(function() {
		$("#register").validate({
			rules : {
				name : {
					required : true,
					minlength : 2,
					maxlength : 10
				},
				email : {
					required : true,
					email : true
				},
				password : {
					required : true,
					minlength : 6
				},
				s_password : {
					required : true,
					equalTo : "#password"
				},
			},
			messages : {
				name : {
					required : "请填写姓名",
					minlength : "姓名长度不能小于2个字符",
					maxlength : "姓名长度不能大于10个字符"
				},
				email : {
					required : "请填写邮箱",
					email : "邮箱格式不正确"
				},
				password : {
					required : "请填写密码",
					minlength : "密码长度不能小于6个字符"
				},
				s_password : {
					required : "请再次填写密码",
					equalTo : "密码不一致"
				}
			}
		});
	});
</script>

</head>
<body>
<div id="man_zone">
<div id="body" class="mybody">
<div id="header" class="header"><div style="margin-left:">添加用户</div></div>
<form id="register" method="post" action="<%=request.getContextPath()%>/Admin/create">
<div class="myform">
<table style="BORDER-COLLAPSE: collapse" borderColor=#ccc cellSpacing=0 width=600 bgColor=#ffffff border=1">

						<tr>
							<td width="15%" height="50">用户名：</td>
							<td width="85%"><input type="text" name="name"
								id="name" class="myinput"/></td>
						</tr>
						<tr>
							<td height="50">身份：</td>
							<td><select name="identity" size="1"
								id="identity" class="myinput">
									<option value="1">管理员</option>
									<option value="2">学生教员</option>
							</select>
							</td>
						</tr>
						<tr>
							<td height="50">邮箱：</td>
							<td><input type="text" name="email"
								id="email"class="myinput"/></td>
						</tr>
						<tr>
							<td height="50">密码：</td>
							<td><input type="password"
								name="password" id="password"
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
								id="bt_ok" value="添加"  class="mybutton"/></td>
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