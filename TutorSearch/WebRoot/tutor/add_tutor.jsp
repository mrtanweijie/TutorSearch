<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_tutor.jsp' starting page</title>
    
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
<!-- 代码高亮 --> 
<script type="text/javascript" src="js/ds.in.js"></script>
<script type="text/javascript" src="js/ds.lighter.js"></script>
<script type="text/javascript" src="js/51_min.js"></script>
<script type="text/javascript" src="js/province_city.js"  charset="gbk"></script>
<script language = javascript>
var s=["province","city"]; 
var opt0 = ["请选择","请选择"]; 
function setup() 
{ 
for(i=0;i<s.length-1;i++) 
document.getElementById(s[i]).onchange=new Function("change("+(i+1)+")"); 
change(0); 
} 
//##联动菜单结束--> 
</script>
</head>
  
  <body>
添加：
<form method="post" action="<%=request.getContextPath() %>/tutor/create">
    标题:<input type="text" id="title" name="title"> <br>
 <div>内容：</div>
 <textarea name="content" id="content" cols="45" rows="5" style="width:50%"></textarea><br>
科目：<select id="subject" name="subject">
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
				</select>
年级：<select id="grade" name="grade">
					<option>选择年级</option>
					<option>六年级</option>
					<option>初三</option>
					<option>高三</option>
					<option>其他</option>
				</select>
   教员专业:<input type="text" id="req_major" name="req_major"> <br>
  教员性别:<input type="text" id="req_sex" name="req_sex"><br>
   报酬:<input type="text" id="pay" name="pay">元/小时<br>
      家长称呼:<input type="text" id="patriarch" name="patriarch"> <br>
   联系电话:<input type="text" id="phone" name="phone"> <br>
   <!--  省：<input type="text" id="province" name="province">市：<input type="text" id="city" name="city">--><br>
   省<select id="province" name="province" style="width:10%; height:30px"><option></option></select> 
   城市<select id="city" name="city" style="width:10%; height:30px"><option></option></select> 
  <script language="javascript">setup();</script>
     区:<input type="text" id="region" name="region"> <br>
  结束时间:<input type="text" id="end" name="end"> <br>
  <script type="text/javascript">
	;(function(global, document, $, undefined) {
		$('#end').datePicker({
			followOffset : [ 0, 24 ]
		});
		window.p1 = $('#end').data('DatePicker');
	})(this, document, jQuery);
</script>
<div>其他说明</div>
<textarea name="others" id="others" cols="45" rows="5" style="width:50%"></textarea><br>
<input type="submit" value="OK">
</form>
  </body>
</html>
