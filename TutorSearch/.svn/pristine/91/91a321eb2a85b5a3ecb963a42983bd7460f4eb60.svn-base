<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/tour.css" />
<title>用户注册</title>
<script type="text/javascript" src="../js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"
	charset="gb2312"></script>
<script type="text/javascript"
	src="../js/jquery.validate.messages_cn.js"></script>
<script type="text/javascript">
	$(function() {

		$("#name").bind({
			change : function() {
				$("#s_name").empty();
			}
		});
		$("#email").bind({
			change : function() {
				$("#s_email").empty();
			}
		});

		// 		$("#password").bind({
		// 			change : function() {
		// 				$("#sp_password").empty();
		// 			}
		// 		});
		// 		$("#s_password").bind({
		// 			change : function() {
		// 				$("#sp_s_password").empty();
		// 			}
		// 		});

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
				check : {
					required : true,
				},
			},
			messages : {
				name : {
					required : "请填写用户名",
					minlength : "用户名长度不能小于2个字符",
					maxlength : "用户名长度不能大于10个字符"
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
				},
				check : {
					required : "请填写验证码",
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="allbody">
		<div class="header">
			<ul>
				<li><a href="#">登陆</a></li>
				<li>|</li>
				<li><a href="#">注册</a></li>
				<li>|</li>
				<li><a href="#">帮助</a></li>
				<li>|</li>
				<li><a href="#">收藏本站</a></li>
			</ul>
		</div>
		<!--导航 -->
		<div class="content">

			<!--logo-->
			<div
				style="float:left; width:230px; margin-top:25px; margin-left:140px;">
				<img src="../images/logo2.png" width="179" height="70" alt="logo" />
			</div>
			<div class="nav">
				<ul>
					<li><a href="../index-1.jsp">首页</a></li>
					<li><a href="#">家教</a></li>
					<li><a href="add_tutor.jsp">家教发布</a></li>
					<li><a href="#">高级搜索</a></li>
					<li><a href="#">教员库</a></li>
					<li><a href="#">讨论区</a></li>
					<li><a href="#">分享区</a></li>
				</ul>
			</div>
		</div>

		<div
			style="border-top:#4f9fdf solid 3px; width:100%; margin-top:1px; position:absolute; z-index:1px;">
			<div
				style="width:70%; margin-left:auto; margin-right:auto; height:100px; font:'微软雅黑'">
				<div
					style="border:#CCC thin solid; height:auto; margin-top:20px;background:#ffffff">
					<div style="height:450px">
						<div
							style=" margin-left:10px;margin-top:10px;font-size:large;font-weight: bold;line-height:60px;border-bottom:#CCC thin solid; width:98%; height:50px;">个人资料</div>
						<table style="BORDER-COLLAPSE: collapse" borderColor=#ccc cellSpacing=0 width=600 bgColor=#ffffff border=1 font-size:12" >
  <tr >
    <td width="80" class="mytd">登录名：</td>
    <td width="200">&nbsp;</td>
    <td width="80" class="mytd">邮箱：</td>
    <td width="222">&nbsp;</td>
  </tr>
  <tr>
    <td class="mytd">真实姓名：</td>
    <td>&nbsp;</td>
    <td class="mytd">电话：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="mytd">年龄：</td>
    <td>&nbsp;</td>
    <td class="mytd">性别：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="mytd">大学：</td>
    <td>&nbsp;</td>
    <td class="mytd">专业：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="mytd">学历：</td>
    <td>&nbsp;</td>
    <td class="mytd">就读年限：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" class="mytd">个人介绍：</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd">其他说明：</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd"><a href="#">修改资料</a></td>
    </tr>
</table>
						
					</div>
				</div>

				<div
					style="border-top:#4F9FDF 2px solid;margin-top:10px; width:100%; height:100px">
					<center>
						<div style="margin-top:30px">版权所有&copy;广西师范大学计信学院
							2013年10月16日</div>
					</center>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
