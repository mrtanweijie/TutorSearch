<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./js/jquery-2.0.3.js"></script>
	<script type="text/javascript" src="./js/jquery.validate.js" charset="gb2312"></script>
	<script type="text/javascript" src="./js/jquery.validate.messages_cn.js"></script>
<script type="text/javascript">
	$(function() {

	// 	$("#name").bind({
		// 			change : function() {
		// 			var name=$("#name").val();
		// 				$.ajax({
		// 				url:"user/checkname",
		// 				type:"post",
		// 				data:{name:name},
		// 				success:function(str){
		// 				if(str=="success"){
		// 				$("#s_name").show().html("该名字可以注册");
		// 				}
		// 				else{
		// 				$("#s_name").show().html("该用户已经存在");
		//alert("该用户已经存在");
		// 				$("#name").val("").focus();
		// 				}
		// 				}
		// 				});
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
	<form id="register" method="POST" action="<%=request.getContextPath()%>/user/create">
		<div id="tip"></div>
		<div>
			name:<input type="text" name="name" id="name"><span
				id="s_name"></span>
		</div>
		<div>
			email:<input type="text" name="email" id="email"><span id="s_email"></span>
		</div>
		<div>
			pwd:<input type="password" name="password" id="password"><span></span>
		</div>
		<div>
			s_pwd:<input type="password" name="s_password" id="s_password"><span></span>
		</div>
		<div>
			<input id="bt_register" type="submit" value="OK">
		</div>
	</form>
</body>
</html>
