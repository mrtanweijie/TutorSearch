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
		$(document).ready(function(){
	var name = "<%=session.getAttribute("name")%>";
	var id = "<%=session.getAttribute("id")%>";
	checkLogin(name,id);
	});
	
	
	function checkLogin(name,id){
	//alert(name+id);
	if (name != "null"&&id!="null") {
	//alert("add:"+name+id);
	$("#login").empty();
	$("#login").append("<a href=\"/User/showmyinfo/"+id+"\">欢迎您，" + name+"</a>");
	
	$("#register").empty();
	$("#register").append("<a onClick=\"logout();\">退出登陆</a>");
	}
	else{
	$("#myinfo").empty();
	$("#myinfo").append("<a href=\"#\">个人中心</a>");
	}
	}
	
	function logout() {
		if (confirm("您确定要退出吗？")){
			top.location = "/User/logout";
			return true;
		}else
			return false;
	}
	
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
				}
// 				check : {
// 					required : true,
// 				},
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
 				}
// 				check : {
// 					required : "请填写验证码",
// 				}
			}
		});
	});
</script>
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
			<div
				style="float:left; width:230px; margin-top:25px; margin-left:140px;">
				<img src="../images/logo2.png" width="179" height="70" alt="logo" />
			</div>
			<div class="nav">
				<ul>
					<li><a href="../index.jsp">首页</a></li>
						<li><a href="/tutor/search.jsp">家教</a></li>
					<li><a href="/tutor/addtutor1.jsp">家教发布</a></li>
					<li><a href="/tutor/search.jsp">高级搜索</a></li>
					<li><a href="/user/search.jsp">教员库</a></li>
					<li><a href="/user/addmyinfo.jsp">成为教员</a></li>
					<li id="myinfo"><a href="User/showmyinfo/<%=session.getAttribute("id")%>">个人中心</a></li>
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
							style=" margin-left:10px;margin-top:10px;font-size:large;font-weight: bold;line-height:60px;border-bottom:#CCC thin solid; width:98%; height:50px;">用户注册</div>
						<form id="register" method="POST"
							action="<%=request.getContextPath()%>/User/register">
							<div style=" margin-left:50px;margin-top:50px;">
								<div style="margin-top:20px;">
									用户名<input type="text" name="name" id="name"
										style="border:#CCC thin solid; width:250px; height:30px;margin-left:20px;margin-right:20px" /><span
										id="s_name">用户名有2~20个字符组成</span>
								</div>
								<div style="margin-top:20px;">
									邮箱<input type="text" name="email" id="email"
										style="border:#CCC thin solid; width:250px; height:30px; margin-left:32px;margin-right:20px" /><span
										id="s_email">请填写常用邮箱</span>
								</div>
								<div style="margin-top:20px;">
									密码<input type="password" name="password" id="password"
										style="border:#CCC thin solid; width:250px; height:30px; margin-left:32px;margin-right:20px" />
									<!-- <span -->
									<!-- id="sp_password">密码长度不能小于6个字符</span> -->
								</div>
								<div style="margin-top:20px;">
									确认密码<input type="password" name="s_password" id="s_password"
										style="border:#CCC thin solid; width:250px; height:30px; margin-left:8px;margin-right:15px" />
									<!-- <span -->
									<!-- id="sp_s_password">请保持两次输入的密码一致</span> -->
								</div>
								<div style="margin-top:20px;">
									<input type="hidden" name="check" id="check"
										style="border:#CCC thin solid; width:250px; height:30px; margin-left:20px;margin-right:20px" />
								</div>
								<div
									style=" margin-left:55px; margin-top:20px; margin-bottom:30px">
									<input id="bt_register" type="submit"
										style="border:#CCC thin solid; width:50px; height:30px"
										value="注册" />
								</div>
							</div>
						</form>
					</div>
				</div>

				<div
					style="border-top:#4F9FDF 2px solid;margin-top:10px; width:100%; height:100px">
					<center>
						<div style="margin-top:30px">版权所有&copy;广西师范大学计信学院
							2013年12月10日</div>
					</center>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
