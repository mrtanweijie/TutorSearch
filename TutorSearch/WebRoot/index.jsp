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
<link rel="stylesheet" type="text/css" href="./css/tour.css" />
<link href="./css/zzsc.css" rel="stylesheet" type="text/css" />
<title>首页   | 教搜网</title>
<style type="text/css">
a:link {
	text-decoration: none;
	color: #000000;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
	color: #FF6600;
}

a:active {
	text-decoration: none;
}
</style>
<script type="text/javascript" src="../js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/jquery.DatePicker.min.js"
	charset="utf-8"></script>
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
</script>
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
			top.location = "User/logout";
			return true;
		}else
			return false;
	}

	//根據城市 返回数据
	function getdatabycity(city,i) {
	var t_data="#t_data_"+i;
	
	//alert(city);
	//alert(t_data);
		$.ajax({
		url : "/tutor/s_city2",
		type : "post",
		data : {
		city : city
		},
		success : function(r_str) {
		if (r_str == "nodata") {
		$(t_data).show().html("无数据");
		} else {
		$(t_data).empty();
		var j = eval(r_str);
		$(j).each(function() {
		$(t_data)
		.append(
		"<div style=\"height:25px; float:left;\">"
		+ "<div style=\"float:left;width:90px;\"><a href=\"/tutor\/"+this.id+"\">"
		+ this.date
		+ "</a></div>"
		+ "<div style=\"float:left;width:170px\"><a href=\"/tutor\/"+this.id+"\">"
		+ this.title
		+ "</a></div>"
		+ "<div style=\"float:left;width:70px\">"
		+ this.region
		+ "</div>"+ "</div>");
		});
		}
		}
		});
	}


$(document).ready(function(city){
t_data();
});

function t_data(city){
for(i=0;i<5;i++){
var t_city="#t_data_"+i;
$(t_city).before("<div style=\"width:700px; height:25px;\"><div style=\"height:25px; float:left; \"><div style=\"float:left;width:80px;\">时间</div><div style=\"float:left;width:180px\">标题</div><div style=\"float:left;width:70px\">地区</div></div><div style=\"height:25px; float:left; \"><div style=\"float:left;width:80px;\">时间</div><div style=\"float:left;width:180px\">标题</div><div style=\"float:left;width:70px\">地区</div></div></div>");
}
}

	$(document)
	.ready(
	function() {
	jQuery.jqtab = function(tabtit, tab_conbox, shijian) {
	$(tab_conbox).find("li").hide();
	$(tabtit).find("li:first").addClass("thistab")
	.show();
	$(tab_conbox)
	.find("li:first")
	.show()
	.bind(	
	$.ajax({
	url : "/tutor/s_city2",
	type : "post",
	data : {
	city : "南宁市"
	},
	success : function(r_str) {
	//alert("南宁");
	//alert(r_str);
	
	if ($.trim(r_str)==$.trim("nodata")) {
	//alert("南宁n");
	$("#t_data_0").append("<div style=\"height:25px; float:left;\">"
	+ "<div style=\"float:left;width:90px;\">无数据...</div></div>");
	} 
	else {
	//alert("南宁y");
	var j = eval(r_str);
	//alert(j);
	$(j).each(function() {
	//alert("南宁y2");
	$("#t_data_0").append("<div style=\"height:25px; float:left;\">"
	+ "<div style=\"float:left;width:90px;\"><a href=\"/tutor\/"+this.id+"\">"+ this.date
	+ "</a></div>"
	+ "<div style=\"float:left;width:170px\"><a href=\"/tutor\/"+this.id+"\">"
	+ this.title
	+ "</a></div>"
	+ "<div style=\"float:left;width:70px\">"
	+ this.region
	+ "</div>"
	+ "</div>");
	});
	}
	}
	}));
	$(tabtit).find("li").bind(shijian,function() {
										$(this).addClass("thistab").siblings(
												"li").removeClass("thistab");
										var activeindex = $(tabtit).find("li")
												.index(this);
										$(tab_conbox).children()
												.eq(activeindex).show()
												.siblings().hide();
										return false;
									});

						};
						/*调用方法如下：*/
						$.jqtab("#tabs", "#tab_conbox", "click");

						//$.jqtab("#tabs2", "#tab_conbox2", "mouseenter");

					});

    //加载指定城市数据
	$(function() {
	$("#nanning").click(function() {
			getdatabycity("南宁市",0);
		});
	$("#guilin").click(function() {
			getdatabycity("桂林市",1);
		});
	$("#liuzhou").click(function() {
			getdatabycity("柳州市",2);
		});
	$("#qinzhou").click(function() {
			getdatabycity("钦州市",3);
		});
	$("#beihai").click(function() {
			getdatabycity("北海市",4);
		});	
	});

	
$(function(){
//alert("get!");
$.ajax({
	url : "/instructor/getlast",
	type : "post",
	data:{userinfo:"userinfo"},
	success:function(r_str){
	if(r_str=="ondata"){
	$("#i_data").append("无数据。。。");
	}
	else{
	//alert("success"+r_str);
	var j = eval(r_str);
	//alert(j);
	$(j).each(function() {
	$("#i_data").append("<ul><li style=\"margin-top:10px;font-size:small\"><a href=\"#\">"+this.university+" "+this.grade+" "+this.major+" "+this.realname+"</a></li></ul>");
	});
	}
	}	
});	});
</script>
<script>
function setTab(name, cursel, n) {
		for (i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById("con_" + name + "_" + i);
			menu.className = i == cursel ? "hover" : "";
			con.style.display = i == cursel ? "block" : "none";
		}
	}
</script>
<script type="text/javascript">
	function clearInput(input) {
		$(input).bind({
			focus : function() {
				$(input).attr("value", "");
			}
		});
	}

	$(function() {
		clearInput("#searchText");
		clearInput("#begin");
		clearInput("#end");
	});
	$(function() {
		$("#searchText").validate({
			rules : {
				searchText : {
					required : true
				}
			},
			messages : {
				searchText : {
					required : "请出入搜索关键字"
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
				<img src="images/logo2.png" width="179" height="70" alt="logo" />
			</div>
			<div class="nav">
				<ul>
					<li><a href="#">首页</a></li>
					<li><a href="tutor/search.jsp">家教</a></li>
					<li><a href="tutor/addtutor1.jsp">家教发布</a></li>
					<li><a href="tutor/search.jsp">高级搜索</a></li>
					<li><a href="user/search.jsp">教员库</a></li>
					<li><a href="user/addmyinfo.jsp">成为教员</a></li>
					<li id="myinfo"><a
						href="User/showmyinfo/<%=session.getAttribute("id")%>">个人中心</a></li>
				</ul>
			</div>
		</div>
		<!--头部搜索框 -->
		<div class="banner">
			<div class="ban">
				<div id="lib_Tab1_sx" class="lib_tabborder_sx">
					<div class="lib_Menubox_sx ">
						<ul>
							<li id="one1" onclick="setTab('one',1,5)" class="hover">搜家教</li>
							<li id="one2" onclick="setTab('one',2,5)">搜教员</li>

						</ul>
					</div>
					<div class="lib_Contentbox_sx ">
						<!--家教-->
						<div id="con_one_1">
							<h2 style="margin:-3px 50px">家教搜索</h2>
							<div class="frist">
								<div>
									<form id="search" method="post"
										action="<%=request.getContextPath()%>/tutor/search">
										家教：<input type="text" id="searchText" name="searchText"
											value="关键字"
											style=" width:176px; height:30px;margin:10px 0px 0px 6px" />
										<input id="bt_search" type="submit" value="搜索"
											style="height:30px;width:50px;border:#CCC thin solid;" />
									</form>
								</div>
								<div class="select">
									<form id="s_date" method="post"
										action="<%=request.getContextPath()%>/tutor/s_multi">
										地区： <select id="province" name="province"
											style=" width:180px; height:30px;margin:14px 0px;border:#CCC thin solid;"><option></option>
										</select> <select id="city" name="city"
											style=" width:180px; height:30px;margin:14px 0px;border:#CCC thin solid;x"><option></option>
										</select>
										<script language="javascript">
											setup();
										</script>
										<div class="select">
											时间：<input id="date" name="date" value="选择开始时间"
												class="SerachTxBd" type="text"
												style="width:176px; height:30px;margin:0px 0px 0px 6px;">
												<script type="text/javascript">
												;
												(function(global, document, $,
														undefined) {
													$('#date')
															.datePicker(
																	{
																		followOffset : [
																				0,
																				24 ]
																	});
													window.p1 = $('#date')
															.data('DatePicker');
												})(this, document, jQuery);
											</script> <input id="end" name="end" class="SerachTxBd" value="选择结束时间"
												type="text" style="width:176px; height:30px;"> <script
														type="text/javascript">
												;
												(function(global, document, $,
														undefined) {
													$('#end')
															.datePicker(
																	{
																		followOffset : [
																				0,
																				24 ]
																	});
													window.p1 = $('#end').data(
															'DatePicker');
												})(this, document, jQuery);
											</script> <input input id="bt_search_date" type="submit" value="搜索"
													style="height:30px;width:50px;border:#CCC thin solid;" />
										</div>
									</form>

								</div>

							</div>
							<div class="li">
								<h4 style="margin:5px 50px">
									输入您的关键字或者选择地区时间<br>获取最新周边家教信息 
								</h4>
							</div>

						</div>

						<!--教员-->
						<div id="con_one_2" style="display:none">
							<h2 style="margin:-3px 50px">教员搜索</h2>
							<div class="frist">
								<div class="select">
									<form id="usersearch" method="get"
										action="<%=request.getContextPath()%>/instructor/search">
										教员：<input id="searchText" name="searchText" class="SerachTxBd"
											value="教员关键字，如：英语教员" type="text"
											style=" width:176px; height:25px;margin:10px 0px 0px 6px">
											<input id="bt_search" type="submit" value="搜索"
											style="height:30px;width:50px;border:#CCC thin solid;" />
									</form>
								</div>
							</div>
							<div class="li">
								<h4 style="margin:-5px 50px">
									输入教员关键字<br>获取最新最全面的教员信息 
								</h4>
							</div>
						</div>

					</div>
				</div>
				<!--搜索框右侧图片-->
				<div class="tu"
					style="background:#000; width:300px; height:250px; float:right; margin:-281px 10px">
					<a href="#"><img src="./images/ban.jpg" width="300"
						height="250" /> </a>
				</div>

				<!--搜索框结束-->

				<!--首页内容-->
				<div style="width:1000px; height:900px;">
					<!--左侧-->
					<div id="main_left" style="float:left; width:680px; height:100%">
						<!--首页家教-->
						<div id="tabbox">
							<h3 style=" margin:15px 0px 0px 20px ">
								热门地区<span
									style=" font-size:10px; margin-left:10px; margin-top:10px; font:">最新家教</span>
							</h3>
							<ul class="tabs" id="tabs">
								<li><a id="nanning" href="#">南宁</a></li>
								<li><a id="guilin" href="#">桂林</a></li>
								<li><a id="liuzhou" href="#">柳州</a></li>
								<li><a id="qinzhou" href="#">钦州</a></li>
								<li><a id="beihai" href="#">北海</a></li>
							</ul>
							<!-- 数据显示 -->
							<ul class="tab_conbox" id="tab_conbox">
								<li class="tab_con">
									<div id="t_data_0" style="width:700px; height:230px; ">南宁</div>
								</li>
								<li class="tab_con">
									<div id="t_data_1" style="width:700px; height:230px; ">桂林</div>
								</li>
								<li class="tab_con">
									<div id="t_data_2" style="width:700px; height:230px; ">柳州</div>
								</li>
								<li class="tab_con">
									<div id="t_data_3" style="width:700px; height:230px; ">钦州</div>
								</li>
								<li class="tab_con">
									<div id="t_data_4" style="width:700px; height:230px; ">北海</div>
								</li>
							</ul>
						</div>

						<!--可在下面继续添加模块-->
						<!--教员-->
						<div
							style="width:680px; height:300px;margin-left:0px; margin-top:10px;">
							<!--教员导航-->
							<div
								style="width:100%; height:40px; border-bottom:thin  #999 solid;">
								<div
									style=" float:left;margin-top:15px; margin-left:20px; font-size:15px; font-weight:bold">
									<span>教员信息</span><span style="margin-left:10px; font-size:10px">最佳教员</span>
									<span style=" margin-left:420px; font-weight:normal">more>></span>
								</div>
							</div>
							<!--教员内容-->
							<div style="width:680px; height:260px;">
								<div
									style="float:left; width:350px; height:100%;margin-top:10px;">
									<img src="./images/banner.jpg" style="width:350px; height:90%" />
								</div>
								<!--特别推荐内容-->
								<div
									style="float:left; width:320px ;margin-top:10px; margin-left:10px">
									<div
										style="float:left; margin-left:10px; font-size:15px; font-weight:bold">特别推荐</div>

                                    <!-- 首页教员信息 -->
									<div id="i_data"
										style="float:left; width:100%; margin-left:10px;">

									</div>
								</div>
							</div>
						</div>

						<!--高校信息-->
						<div
							style="width:100%; height:300px;margin-left:0px; margin-top:10px; background:#39F">
							<!--招聘导航-->
							<div
								style="width:100%; height:40px; border-bottom:thin #999 solid; background:#FFF">
								<div
									style=" float:left;margin-top:15px; margin-left:20px; font-size:15px; font-weight:bold">
									<span>高校家教</span><span style="margin-left:10px; font-size:10px">一览无余</span>
									<span style=" margin-left:420px; font-weight:normal">more>></span>
								</div>
							</div>

							<!--招聘内容-->
							<div style="width:100%; height:260px; background:#FFF"></div>

						</div>
					</div>
					<!-- 右侧 -->
					<div id="main_right" style="float:left; width:310px; height:100%;">
						<!--大家都在搜索-->
						<div
							style="width:95%; height:300px; margin:0px 10px;border:thin  #CCC solid;">
							<div
								style="float:left; width:100%;margin-top:15px; border-bottom:thin  #CCC solid;">
								<div
									style=" float:left;margin-left:10px; margin-bottom:10px; font-size:15px; font-weight:bold;">
									<span>大家都在搜索</span>
								</div>
							</div>
							<div id="tagscloud">
								<a href="tutor/search?searchText=英语家教" class="tagc1">英语家教</a>
								<a href="tutor/search?searchText=数学家教"
									class="tagc2">数学家教</a> <a
									href="tutor/search?searchText=语文家教" class="tagc5">语文家教</a>
								<a href="tutor/search?searchText=英语" class="tagc2">英语<a>
										<a href="tutor/search?searchText=物理家教"
										class="tagc2">物理家教</a> <a
										href="tutor/search?searchText=化学" class="tagc1">化学</a>
										<a href="tutor/search?searchText=英语教员"
										class="tagc2">英语教员</a> <a
										href="tutor/search?searchText=数学专业" class="tagc5">数学专业</a>
										<a href="tutor/search?searchText=英语辅导"
										class="tagc2">英语辅导</a> <a
										href="tutor/search?searchText=数学" class="tagc2">数学</a>
										<a href="tutor/search?searchText=英语"
										class="tagc5">英语家教</a> <a
										href="tutor/search?searchText=英语" class="tagc2">英语</a>
										<a href="tutor/search?searchText=英语"
										class="tagc1">英语家教</a> <a
										href="tutor/search?searchText=英语" class="tagc2">地理
									</a> <a href="tutor/search?searchText=英语"
										class="tagc5">语文</a> <a
										href="tutor/search?searchText=英语" class="tagc2">英语家教<a>
												<a href="tutor/search?searchText=英语"
												class="tagc2">英语</a> <a
												href="tutor/search?searchText=英语" class="tagc1">英语家教</a>
												<a href="tutor/search?searchText=英语"
												class="tagc2">英语家教</a> <a
												href="tutor/search?searchText=英语" class="tagc5">英语辅导</a>
												<a href="tutor/search?searchText=英语"
												class="tagc2">英语专业</a> <a
												href="tutor/search?searchText=英语" class="tagc2">英语</a>
												<a href="tutor/search?searchText=英语"
												class="tagc5">英语家教</a> <a
												href="tutor/search?searchText=英语" class="tagc2">英语</a>
							</div>

							<script src='./js/zzsc.js' type="text/javascript"></script>
						</div>

						<div
							style="width:95%; height:300px; margin:10px 10px;border:thin  #CCC solid;">
							<div
								style="float:left; width:100%;margin-top:15px; border-bottom:thin  #CCC solid;">
								<div
									style=" float:left;margin-left:10px; margin-bottom:10px; font-size:15px; font-weight:bold;">
									<span>热门信息</span>
								</div>
							</div>
						</div>

					</div>
					<!-- 页脚 -->
					<div
						style="float:left;border-top:#4F9FDF 2px solid;margin-top:40px; width:100%; height:200px">
						<center>
							<div style="margin-top:30px">版权所有&copy;广西师范大学计信学院  2013年12月10日</div>
						</center>
					</div>
					<!--首页内容结束-->

				</div>
			</div>
		</div>
	</div>

	<!--页脚-->
	<!-- <div
		style="width:100%; height:150px;border-top:thin #999 solid;font-size:14px; color:#999;">
		<center style="margin-top:20px">
			<div>
				京ICP证1234567 <span>广西师范大学计算机科学与信息工程学院</span>
			</div>
		</center>
		<center style="margin-top:30px">
			<span>版权所有 &copy;2010计本二班 Mr_Tank_ </span>
		</center>
	</div> -->
	<!--页脚结束-->


</body>
</html>