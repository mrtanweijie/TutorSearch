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
<base href="<%=basePath%>">

<title>发布家教</title>
<link rel="stylesheet" type="text/css" href="./css/tour.css" />
<script type="text/javascript" src="../js/jquery-2.0.3.js"></script>
<style type="text/css">
.mytitle {
	margin-left: 10px;
	width: 90%;
	height: 30px;
	border: #666 thin solid;
}

.myinput {
	margin-left: 10px;
	width: 200px;
	height: 30px;
	border: #666 thin solid;
}

.myselect {
	margin-left: 10px;
	width: 142px;
	height: 30px;
	border: #666 thin solid;
}

.myinputtf {
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 10px;
	width: 90%;
	height: 100px;
	border: #666 thin solid;
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

<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/jquery.DatePicker.min.js"></script>
<!-- 代码高亮 -->
<script type="text/javascript" src="js/ds.in.js"></script>
<script type="text/javascript" src="js/ds.lighter.js"></script>
<script type="text/javascript" src="js/51_min.js"></script>
<script type="text/javascript" src="js/province_city.js" charset="gbk"></script>
<script language=javascript>
	var s = [ "province", "city" ];
	var opt0 = [ "请选择", "请选择" ];
	function setup() {
		for (i = 0; i < s.length - 1; i++)
			document.getElementById(s[i]).onchange = new Function("change("
					+ (i + 1) + ")");
		change(0);
	}
//##联动菜单结束-->

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
	$("#myinfo").append("<a>个人中心</a>");
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
				<img src="./images/logo2.png" width="179" height="70" alt="logo" />
			</div>
			<div class="nav">
				<ul>
					<li><a href="index.jsp">首页</a></li>
					<li><a href="#">家教</a></li>
					<li><a href="tutor/addtutor1.jsp">家教发布</a></li>
					<li><a href="tutor/search.jsp">高级搜索</a></li>
					<li><a href="user/search.jsp">教员库</a></li>
					<li><a href="user/addmyinfo.jsp">成为教员</a></li>
					<li id="myinfo"><a
						href="User/showmyinfo/<%=session.getAttribute("id")%>">个人中心</a></li>
				</ul>
			</div>
		</div>

		<div
			style="border-top:#4f9fdf solid 2px; width:100%; margin-top:1px; position:absolute; z-index:1px;">
			<div
				style="width:70%; margin-left:auto; margin-right:auto; height:100px;">
				<!-- 搜索框-->
				<div
					style="border:#CCC thin solid; height:55px; margin-top:20px;background:#F7F7F7">
					<form id="search" method="get"
						action="<%=request.getContextPath()%>/tutor/search">
						<div style="margin-left:10px; margin-top:5px">
							<div style="float:left">
								<input type="text" style="width:490px; height:45px"
									id="searchText" name="searchText" value="输入关键字，如：数学家教">
							</div>

							<div style="float:left; margin-left:10px">
								<input type="submit"
									style="width:80px; height:45px; background:url(images/st-1.png);no-repeat; border:none;"
									value="">
							</div>

						</div>
					</form>
					<br />
				</div>

				<div style="border:#CCC thin solid;margin-top:20px">
					<div
						style="font-size:15px; color:#999; margin-left:20px;margin-top:10px"></div>



					<div style=" height:auto;margin-left:20px;margin-top:10px">
						<form method="post"
							action="<%=request.getContextPath()%>/tutor/create">
							<table style="BORDER-COLLAPSE: collapse;margin-bottom:10px;"
								borderColor=#ccc cellSpacing=0 width=90% bgColor=#ffffff
								border=1" >
								<tr>
									<td width="100" height="40" class="mytdc">标题：</td>
									<td colspan="3"><input type="text" id="title" name="title"
										class="mytitle"></td>
								</tr>
								<tr>
									<td class="mytdc">辅导科目：</td>
									<td width="200"><select id="subject" name="subject"
										class="myinput">
											<option>选择辅导科目</option>
											<option>英语</option>
											<option>语文</option>
											<option>数学</option>
											<option>物理</option>
											<option>化学</option>
											<option>生物</option>
											<option>地理</option>
											<option>政治</option>
											<option>其他</option>
									</select></td>
									<td width="150" class="mytdc">学生年级：</td>
									<td width="250"><select id="grade" name="grade"
										class="myinput">
											<option>选择年级</option>
											<option>六年级</option>
											<option>初三</option>
											<option>高三</option>
											<option>其他</option>
									</select></td>
								</tr>
								<tr>
									<td class="mytdc">要求教员专业：</td>
									<td><input type="text" id="req_major" name="req_major"
										class="myinput">
									</td>
									<td class="mytdc">要求教员性別：</td>
									<td><input type="text" id="req_sex" name="req_sex"
										class="myinput">
									</td>
								</tr>
								<tr>
									<td class="mytdc">家长称呼</td>
									<td><input type="text" id="patriarch" name="patriarch"
										class="myinput">
									</td>
									<td class="mytdc">家长联系方式</td>
									<td><input type="text" id="phone" name="phone"
										class="myinput"></td>
								</tr>
								<tr>
									<td class="mytdc">家教报酬：</td>
									<td><input type="text" id="pay" name="pay" class="myinput">
									</td>
									<td class="mytdc">结束时间</td>
									<td><input type="text" id="end" name="end" class="myinput">
										<script type="text/javascript">
											;
											(function(global, document, $,
													undefined) {
												$('#end').datePicker({
													followOffset : [ 0, 24 ]
												});
												window.p1 = $('#end').data(
														'DatePicker');
											})(this, document, jQuery);
										</script></td>
								</tr>
								<tr>
									<td class="mytdc">地址：</td>
									<td colspan="3">省<select id="province" name="province"
										class="myselect"><option></option>
									</select> 城市<select id="city" name="city" class="myselect"><option></option>
									</select> <script language="javascript">
										setup();
									</script>区<input type="text" id="region" name="region" class="myselect">
									</td>
								</tr>
								<tr>
									<td colspan="4" class="mytdc">内容：</td>
								</tr>
								<tr>
									<td colspan="4" class="mytdc"><textarea name="content"
											id="content" cols="45" rows="5" class="myinputtf"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="mytdc">其他说明：</td>
								</tr>
								<tr>
									<td colspan="4" class="mytdc"><textarea name="others"
											id="others" cols="45" rows="5" class="myinputtf"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="mytdc"><input type="submit"
										value="添加" class="mybutton"></td>
								</tr>
							</table>
						</form>
					</div>



				</div>

				<div
					style="border-top:#4F9FDF 2px solid;margin-top:10px; width:100%; height:200px">
					<center>
						<div style="margin-top:30px">版权所有&copy;广西师范大学计信学院  2013年12月10日</div>
					</center>
				</div>

			</div>

		</div>

	</div>

</body>
</html>