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
<script type="text/javascript" src="../js/jquery-2.0.3.js"></script>
<title>成为教员</title>
<style type="text/css">
.myform {
	margin: 10px 10px 10px 10px;
}

.myinput {
	margin-left: 10px;
	width: 200px;
	height: 30px;
	border: #666 thin solid;
}

.myinputtf {
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 10px;
	width: 730px;
	height: 100px;
	border: #666 thin solid;
}

.inputdiv {
	margin-top: 10px;
}

.mybutton {
	width: 50px;
	height: 30px;
	margin-left: 10px;
	margin-right: 20px;
	border: #CCC thin solid;
}

.mytd {
	font-size: 12px;
	color: #666;
	height: 30px;
	align: center;
}

.mytdc {
	font-size: 12px;
	color: #666;
	height: 50px;
	align: center;
}
</style>
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

</script>
</head>
<body>
	<div class="allbody">
		<div class="header">
			<ul>
				<li id="login"><a href="user/login-1.jsp">登陆</a></li>
				<li>|</li>
				<li id="register"><a href="user/register.jsp">注册</a></li>
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
			style="border-top:#4f9fdf solid 3px; width:100%; height:800px;margin-top:1px; position:absolute; z-index:1px;">
			<div
				style="width:70%; height:800px;margin-left:auto; margin-right:auto;  font:'微软雅黑'">
				<div
					style="border:#CCC thin solid; height:800px; margin-top:20px;background:#ffffff">
					<div style="height:450px">
						<div
							style=" margin-left:10px;margin-top:10px;font-size:large;font-weight: bold;line-height:60px;border-bottom:#CCC thin solid; width:98%; height:50px;">成为教员</div>
						<div class="myform">
							<form method="post"
								action="<%=request.getContextPath()%>/User/addmyinfo">
								<input type="hidden" name="u_id" id="u_id"
									value="<%=session.getAttribute("id")%>" />
								<div class="myform">
									<table style="BORDER-COLLAPSE: collapse;margin-left:40px;"
										borderColor=#ccc cellSpacing=0 width=90% bgColor=#ffffff
										border=1" >
										<tr>
											<td width="80" class="mytdc">真实姓名：</td>
											<td width="231"><input type="text" name="realname"
												id="realname" class="myinput" />
											</td>
											<td width="86" class="mytdc">电话：</td>
											<td width="230"><input type="text" name="phone"
												id="phone" class="myinput" />
											</td>
										</tr>
										<tr>
											<td class="mytdc">年龄：</td>
											<td><input type="text" name="age" id="age"
												class="myinput" />
											</td>
											<td class="mytdc">性别：</td>
											<td><input type="text" name="sex" id="sex"
												class="myinput" />
											</td>
										</tr>
										<tr>
											<td class="mytdc">大学：</td>
											<td><input type="text" name="university" id="university"
												class="myinput" />
											</td>
											<td class="mytdc">专业：</td>
											<td><input type="text" name="major" id="major"
												class="myinput" />
											</td>
										</tr>
										<tr>
											<td class="mytdc">学历：</td>
											<td><select name="academic" size="1" id="academic"
												class="myinput">
													<option>研究生</option>
													<option>本科</option>
													<option>大专</option>
											</select></td>
											<td class="mytdc">年级：</td>
											<td><select name="grade" size="1" id="grade"
												class="myinput">
													<option>大一</option>
													<option>大二</option>
													<option>大三</option>
													<option>大四</option>
													<option>研一</option>
													<option>研二</option>
											</select></td>
										</tr>
										<tr>
											<td colspan="4" class="mytdc">个人介绍：</td>
										</tr>
										<tr>
											<td colspan="4" class="mytdc"><textarea
													name="intriduction" class="myinputtf" id="intriduction"></textarea>

											</td>
										</tr>
										<tr>
											<td colspan="4" class="mytdc">其他说明：</td>
										</tr>
										<tr>
											<td colspan="4" class="mytdc"><textarea name="other"
													class="myinputtf" id="other"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="4" class="mytdc"><input type="submit"
												name="bt_ok" id="bt_ok" value="修改" class="mybutton" />
											</td>
										</tr>
									</table>

								</div>
							</form>

						</div>
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
