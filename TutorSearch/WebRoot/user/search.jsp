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
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/script.js"></script>
<title>高级搜索</title>
<style type="text/css">
.info {
	margin: 10px 10px 10px;
	border: #999 thin solid;
	width: 230px;
	height: 150px;
	float: left;
}

.u_content {
	margin: 10px 10px 10px;
}

.leftdiv {
	width: 50px;
	height: 120px;
	float: left;
}

.rightdiv {
	width: 155px;
	height: 130px;
	border-left: #999 thin solid;
	float: left;
	font: '微软雅黑';
	font-size: small;
}

.u_info {
	margin-left: 5px;
	margin-bottom: 5px;
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
	$(function() {
		$("#bt_search").click(function() {
			var university = $("#selectA").text();
			var major = $("#selectB").text();
			var academic = $("#selectC").text();
			var grade = $("#selectD").text();

			ad_search(university, major, grade, academic);
		});

	});

	function ad_search(university, major, grade, academic) {
		$("#t_data").show().html("正在搜索。。。");
		$
				.ajax({
					url : "/instructor/multi_search",
					type : "post",
					data : {
						university : university,
						major : major,
						academic : academic,
						grade : grade,
					},
					success : function(r_str) {

						if (r_str == "nodata") {
							$("#t_data").show().html("无数据");
						} else {
							$("#t_data").empty();
							$("#t_data")
									.append(
											"<div style=\"float:left;margin-left:10px;margin-top:10px;font-size:large;font-weight: bold;line-height:60px;border-bottom:#CCC thin solid; width:98%; height:50px;\">搜索结果</div>");
							var j = eval(r_str);

							$(j)
									.each(
											function() {

												$("#t_data")
														.append(
																"<div class=\"info\"><div class=\"u_content\"><div id=\"left\" class=\"leftdiv\"><img src=\"../images/Astudent.png\" width=\"48\" height=\"48\" alt=\"头像\" /></div><div id=\"right\" class=\"rightdiv\"><div class=\"u_info\">姓名："
																		+ this.realname
																		+ "</div><div class=\"u_info\">学校："
																		+ this.university
																		+ "</div><div class=\"u_info\">性别："
																		+ this.sex
																		+ " 年龄："
																		+ this.age
																		+ "</div><div class=\"u_info\">专业："
																		+ this.major
																		+ "</div><div class=\"u_info\">学历："
																		+ this.academic
																		+ " 年级："
																		+ this.grade
																		+ "</div><div class=\"u_info\"><a href=\"#\">更多信息</a></div></div></div></div>");

											});
						}
					}
				});
	}
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
					<li><a href="../index.jsp">首页</a>
					</li>
						<li><a href="#">家教</a></li>
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
				style=";width:70%; margin-left:auto; margin-right:auto;">
				<div
					style="float:left;border:#CCC thin solid; height:auto; margin-top:20px;background:#ffffff">
					<div style="float:left;width:100%">
						<div
							style=" margin-left:10px;margin-top:10px;font-size:large;font-weight: bold;line-height:60px;border-bottom:#CCC thin solid; width:98%; height:50px;">教员搜索</div>
						<div style="height:auto;margin-left:20px;margin-top:20px;">
							<div>
								<ul class="select">
									<li class="select-list">
										<dl id="select1">
											<dt>大学：</dt>
											<dd class="select-all selected">
												<a href="#">全部</a>
											</dd>

											<dd>
												<a href="#">广西师范大学</a>
											</dd>
											<dd>
												<a href="#">桂林电子科技大学</a>
											</dd>
											<dd>
												<a href="#">桂林理工大学</a>
											</dd>
										</dl>
									</li>
									<li class="select-list">
										<dl id="select2">
											<dt>专业要求：</dt>
											<dd class="select-all selected">
												<a href="#">不限专业</a>
											</dd>
											<dd>
												<a href="#">汉语专业</a>
											</dd>
											<dd>
												<a href="#">数学专业</a>
											</dd>
											<dd>
												<a href="#">英语专业</a>
											</dd>
											<dd>
												<a href="#">物理专业</a>
											</dd>
											<dd>
												<a href="#">化学专业</a>
											</dd>
										</dl>
									</li>

									<li class="select-list">
										<dl id="select3">
											<dt>教员学历：</dt>
											<dd class="select-all selected">
												<a href="#">不限</a>
											</dd>
											<dd>
												<a href="#">硕士</a>
											</dd>
											<dd>
												<a href="#">本科</a>
											</dd>
											<dd>
												<a href="#">专科</a>
											</dd>
										</dl>
									</li>

									<li class="select-list">
										<dl id="select4">
											<dt>教员年级：</dt>
											<dd class="select-all selected">
												<a href="#">不限年级</a>
											</dd>
											<dd>
												<a href="#">大一</a>
											</dd>
											<dd>
												<a href="#">大二</a>
											</dd>
											<dd>
												<a href="#">大三</a>
											</dd>
											<dd>
												<a href="#">大四</a>
											</dd>
											<dd>
												<a href="#">研究生</a>
											</dd>
										</dl>
									</li>



									<li class="select-result">
										<dl>
											<dt>已选条件：</dt>
											<dd class="select-no">暂时没有选择过滤条件</dd>
										</dl>
									</li>
								</ul>
							</div>
							<div style="float:left; width:100%">
							<input id="bt_search" type="button" value="搜索"
								style="height:30px;width:50px;border:#CCC thin solid;" />
							</div>	
							<div id="t_data"
								style="float:left;margin-top:20px;margin-bottom:20px;width:85%;border:#CCC thin solid;"></div>
						</div>
					</div>
				</div>

				<div
					style="float:left;border-top:#4F9FDF 2px solid;margin-top:10px; width:100%; height:100px">
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