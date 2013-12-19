<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>管理导航区域</title>
<script type="text/javascript">
	var preClassName = "man_nav_1";
	function list_sub_nav(Id, sortname) {
		if (preClassName != "") {
			getObject(preClassName).className = "bg_image";
		}
		if (getObject(Id).className == "bg_image") {
			getObject(Id).className = "bg_image_onclick";
			preClassName = Id;
			showInnerText(Id);
			window.top.frames['leftFrame'].outlookbar.getbytitle(sortname);
			window.top.frames['leftFrame'].outlookbar.getdefaultnav(sortname);
		}
	}

	function showInnerText(Id) {
		var switchId = parseInt(Id.substring(8));
		var showText = "对不起没有信息！";
		switch (switchId) {
		case 1:
			showText = "后台管理系统!";
			break;
		case 2:
			showText = "用户管理";
			break;
		case 3:
			showText = "教员管理";
			break;
		case 4:
			showText = "家教管理";
			break;
		case 5:
			showText = "日志管理";
			break;
		}
		getObject('show_text').innerHTML = showText;
	}
	//获取对象属性兼容方法
	function getObject(objectId) {
		if (document.getElementById && document.getElementById(objectId)) {
			// W3C DOM
			return document.getElementById(objectId);
		} else if (document.all && document.all(objectId)) {
			// MSIE 4 DOM
			return document.all(objectId);
		} else if (document.layers && document.layers[objectId]) {
			// NN 4 DOM.. note: this won't find nested layers
			return document.layers[objectId];
		} else {
			return false;
		}
	}
</script>
</head>

<body>
	<div id="nav">
		<ul>
			<li id="man_nav_1" onclick="list_sub_nav(id,'管理首页')" class="bg_image_onclick">管理首页</li>
			<li id="man_nav_2" onclick="list_sub_nav(id,'用户管理')" class="bg_image">用户管理</li>
			<li id="man_nav_3" onclick="list_sub_nav(id,'教员管理')" class="bg_image">教员管理</li>
			<li id="man_nav_4" onclick="list_sub_nav(id,'家教管理')" class="bg_image">家教管理</li>
			<li id="man_nav_5" onclick="list_sub_nav(id,'日志管理')" class="bg_image">日志管理</li>
		</ul>
	</div>
	<div id="sub_info">
		&nbsp;&nbsp;<img src="images/hi.gif" />&nbsp;<span id="show_text">家教搜索网后台管理系统</span>
	</div>
</body>
</html>
