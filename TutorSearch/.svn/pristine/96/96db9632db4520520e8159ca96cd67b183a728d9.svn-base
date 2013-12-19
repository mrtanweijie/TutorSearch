<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_ptjob.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/jquery.DatePicker.min.js"></script>
<script type="text/javascript" src="js/ds.in.js"></script>
<script type="text/javascript" src="js/ds.lighter.js"></script>
<script type="text/javascript" src="js/51_min.js"></script>
  </head>
  
  <body>
   <h2>发布兼职</h2><br>
   <form method="post" action="<%=request.getContextPath() %>/ptjob/create">
     标题:<input type="text" id="title" name="title"> <br>
 <div>内容：</div>
 <textarea name="content" id="content" cols="45" rows="5" style="width:50%"></textarea><br>

招聘单位:<input type="text" id="company" name="company"> <br>
联系人:<input type="text" id="linkman" name="linkman"><br>
  联系电话:<input type="text" id="phone" name="phone"><br>

 
   工作地点：<input type="text" id="address" name="address"><br>

  结束时间:<input type="text" id="date" name="date"> <br>
  <script type="text/javascript">
	;(function(global, document, $, undefined) {
		$('#date').datePicker({
			followOffset : [ 0, 24 ]
		});
		window.p1 = $('#end').data('DatePicker');
	})(this, document, jQuery);
</script>
<input type="submit" value="OK">
   </form>
  </body>
</html>
