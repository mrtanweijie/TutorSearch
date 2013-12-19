<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>后台管理系统首页</title>
</head>
<frameset rows="65,530,*" cols="*" frameborder="no" border="0"
	framespacing="0">
	<frame src="admin/topframe.jsp" name="topFrame" noresize="noresize" id="topFrame" title="topFrame" />
	<frameset  id="myFrame" cols="199,7,*" frameborder="no" border="0"
		framespacing="0">
		<frame src="admin/leftframe.jsp" name="leftFrame" noresize="noresize" id="leftFrame" title="leftFrame" scrolling="no" />
		<frame src="admin/switchframe.jsp" name="midFrame" noresize="noresize" id="midFrame" title="midFrame" />
		<frameset rows="59,*" cols="*" frameborder="no" border="0"framespacing="0">
			<frame src="admin/mainframe.jsp" name="mainFrame" noresize="noresize" id="mainFrame" title="mainFrame" />
			<frame src="admin/manframe.jsp" name="manFrame" id="manFrame" title="manFrame" />
		</frameset>
	</frameset>
	<frame src="admin/bottomframe.jsp" name="bottomFrame" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes>
</html>

