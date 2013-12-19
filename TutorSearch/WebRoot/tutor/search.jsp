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
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/script.js"></script>
<title>高级搜索</title>
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
			var subject = $("#selectA").text();
			var major = $("#selectB").text();
			var grade = $("#selectC").text();
			var date = $("#selectD").text();
			ad_search(subject,major,grade,date);
		});

	});
	
	function ad_search(subject,major,grade,date){
	//alert("ad_search");
	//alert(subject + major + grade + date);
	$("#t_data").show().html("正在搜索。。。");
			$.ajax({
				url : "ad_search",
				type : "post",
				data : {
					subject : subject,
					major:major,
					grade:grade,
					date:date,
				},
				success : function(r_str) {
				
		if (r_str == "nodata") {
		$("#t_data").show().html("无数据");
		} else {
		$("#t_data").empty();
		$("#t_data").append("<div style=\" margin-left:10px;margin-top:10px;font-size:large;font-weight: bold;line-height:60px;border-bottom:#CCC thin solid; width:98%; height:50px;\">搜索结果</div>");
		var j = eval(r_str);
		
	$(j).each(function() {$("#t_data").append("<div style=\"width:80%;margin-left:20px; margin-top:20px; height:120px\"><div id=\"t_title\" style=\" float:left; width:100%;margin-top:5px;\"><a href=\"/tutor/"+this.id+"\"><span style=\"font-size:20px; color:#333; font-weight:bold\">"
																		+ this.title
																		+ "</a></div><div id=\"t_content\" style=\"float:left; width:100%; height:60px;font-size:15px; color:#333;margin-top:10px\">"
																		+ this.content
																		+ "</div><div id=\"t_url\" style=\"float:left; width:60%\"><a href=\"/tutor/"+this.id+"\"><span style=\"color:#36C\">http://tutor.sturgeon.mopaas.com/tutor/"+this.id+"</span></a></div><div id=\"t_date\" style=\"float:left; width:30%; margin-left:15px\"><span style=\"color:#36C\">"
																		+ this.date
																		+ "</span></div></div>");
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
					<li><a href="../index.jsp">首页</a></li>
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
				style="width:70%; margin-left:auto; margin-right:auto; height:100px; font:'微软雅黑'">
				<div
					style="border:#CCC thin solid; height:auto; margin-top:20px;background:#ffffff">
					<div style="height:auto">
						<div
							style=" margin-left:10px;margin-top:10px;font-size:large;font-weight: bold;line-height:60px;border-bottom:#CCC thin solid; width:98%; height:50px;">高级搜索</div>
						<div style="height:auto;margin-left:20px;margin-top:20px;">
							<div>
								<ul class="select">
									<li class="select-list">
										<dl id="select1">
											<dt>家教科目：</dt>
											<dd class="select-all selected">
												<a href="#">全部</a>
											</dd>
											<dd>
												<a href="#">语文</a>
											</dd>
											<dd>
												<a href="#">数学</a>
											</dd>
											<dd>
												<a href="#">英语</a>
											</dd>
											<dd>
												<a href="#">物理</a>
											</dd>
											<dd>
												<a href="#">化学</a>
											</dd>
											<dd>
												<a href="#">生物</a>
											</dd>
											<dd>
												<a href="#">地理</a>
											</dd>
											<dd>
												<a href="#">政治</a>
											</dd>
											<dd>
												<a href="#">历史</a>
											</dd>
										</dl></li>
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
										</dl></li>
									<li class="select-list">
										<dl id="select3">
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
										</dl></li>

									<li class="select-list">
										<dl id="select4">
											<dt>发布日期：</dt>
											<dd class="select-all selected">
												<a href="#">全部</a>
											</dd>
											<dd>
												<a href="#">最近三天</a>
											</dd>
											<dd>
												<a href="#">最近一周</a>
											</dd>
											<dd>
												<a href="#">最近一个月</a>
											</dd>
											<dd>
												<a href="#">最近三个月</a>
											</dd>
										</dl></li>

									<li class="select-result">
										<dl>
											<dt>已选条件：</dt>
											<dd class="select-no">暂时没有选择过滤条件</dd>
										</dl></li>
								</ul>
							</div>
							<input id="bt_search" type="button" value="搜索"
								style="height:30px;width:50px;border:#CCC thin solid;" />
							<div id="t_data" style="margin-top:20px;margin-bottom:20px;height:auto;width:77%;border:#CCC thin solid;"></div>
						</div>
					</div>
				</div>

				<div
					style="border-top:#4F9FDF 2px solid;margin-top:10px; width:100%; height:100px">
					<center>
						<div style="margin-top:30px">版权所有&copy;广西师范大学计信学院  2013年12月10日</div>
					</center>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

