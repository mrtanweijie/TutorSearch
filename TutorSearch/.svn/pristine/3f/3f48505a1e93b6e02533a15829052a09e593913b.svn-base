<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/tour.css" />
<title>管理员登录</title>
<script language="javascript" type="text/javascript">
	var request;
	function createRequest() {
		if (window.ActiveXobject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");//判断浏览器是否是IE并且是否支持XMLHttpRequest对象
		} else if (window.XMLHttpRequest) { //判断浏览器是否支持XMLHttpRequest对象
			request = new XMLHttpRequest();

		}

	}

	function login() {
		createRequest();
		var name = document.getElementById("name").value;
		var password= document.getElementById("password").value;
		var check=document.getElementById("check").value;
		var url = "/TutorSearch/Admin/adminlogin?name="+name+"&password="+password+"&check="+check;
		request.open("POST", url, true);
		request.onreadystatechange = handleStateChange;
		request.send(null);
	}

	function handleStateChange() {
		if (request.readyState == 4) {
			if (request.status = 200) {
				//alert("OK!");
				var result = request.responseText;
				//alert(result);
				if(result=="success"){window.location.href="../admin/index.jsp";}
				else{
					var div = document.getElementById("result");
					div.innerHTML = "<b>登录失败，请检查您的用户名和密码</b>";
				}
				
				
			}
		}
	}
</script>
</head>
<body>
	<div class="allbody">
		<div class="header">
			<ul>
				<li><a href="#">登陆</a>
				</li>
				<li>|</li>
				<li><a href="#">注册</a>
				</li>
				<li>|</li>
				<li><a href="#">帮助</a>
				</li>
				<li>|</li>
				<li><a href="#">收藏本站</a>
				</li>
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
					<li><a href="../index-1.jsp">首页</a>
					</li>
					<li><a href="#">家教</a>
					</li>
					<li><a href="add_tutor.jsp">家教发布</a>
					</li>
					<li><a href="#">高级搜索</a>
					</li>
					<li><a href="#">教员库</a>
					</li>
					<li><a href="#">讨论区</a>
					</li>
					<li><a href="#">分享区</a>
					</li>
				</ul>
			</div>
		</div>

		<div
			style="border-top:#4f9fdf solid 3px; width:100%; margin-top:1px; position:absolute; z-index:1px;">
			<div
				style="width:70%; margin-left:auto; margin-right:auto; height:100px; font:'微软雅黑'">
				<div
					style="border:#CCC thin solid; height:auto; margin-top:20px;background:#ffffff">
					<div style="height:350px">
						<div style=" margin-left:10px;margin-top:10px;font-size:large;font-weight: bold;line-height:60px;border-bottom:#CCC thin solid; width:98%; height:50px;">管理员登录</div>
						<div style=" margin-left:50px;margin-top:50px;">
						<div id="result"></div>
						  <form   action="#">
							<div style="margin-top:20px;">
								用户名<input type="text" name="name" id="name"
									style="border:#CCC thin solid; width:250px; height:30px;margin-left:10px" />
							</div>
							<div style="margin-top:20px;">
								密码<input type="password" name="password" id="password"
									style="border:#CCC thin solid; width:250px; height:30px; margin-left:22px" />
							</div>
							<div style="margin-top:20px;">
								验证码<input type="text" name="check" id="check"
									style="border:#CCC thin solid; width:250px; height:30px; margin-left:10px" />
							</div>
							<div
								style=" margin-left:45px; margin-top:20px; margin-bottom:30px">
								<input type="button"
									style="border:#CCC thin solid; width:50px; height:30px"
									value="登录" onclick="login();"/>
							</div></form>
						</div>
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

