<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'user_list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>

	<a href="/user/show/15">显示user 15</a>
	<br> 分页userlist:
	<a href="/user/show/0/5">1</a>
	<a href="/user/show/5/5">2</a>
	<a href="/user/show/10/5">3</a>
	<a href="/user/show/15/5">4</a>
	<br>
	<!-- 	<form method="post" -->
	<!-- 		action="<%=request.getContextPath()%>/user.do?method=getuserlist"> -->
	<!-- 		fromid:<input type="text" id="fromid" name="fromid">  -->
	<!-- 		told:<input type="text" id="told" name="told"> <input type="submit" -->
	<!-- 			value="OK"> -->
	<!-- 	</form> -->

	update:
	<form method="post" action="<%=request.getContextPath()%>/user/update">
		<input type="hidden" name="_method" value="put" /> <input
			type="hidden" name="id" value="<%=request.getParameter("id") %>" /> name:<input type="text"
			name="name" id="name" value="<%=request.getParameter("name") %>"> email:<input
			type="text" name="email" id="email" value="<%=request.getParameter("email") %>">
		<input type="submit" value="OK">
	</form>
</body>
</html>
