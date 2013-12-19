<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户列表</title>
    <link rel="stylesheet" href="css/common.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../Admin/css/admin.css"/>
    <link href="../css/Pager.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$("#pager").pager({
			pagenumber : 1,
			pagecount : $("#mypage").val(),
			buttonClickCallback : PageClick
		});
		
		$.ajax({
					url : "/TutorSearch/Admin/show/" + 
							0 + "/5",
					type : "get",
					success : function(r_str) {
						if (r_str == "nodate") {
							$("#result").show().html("无数据");
						} else {
							$("#result").empty();
							var j = eval(r_str);
							$(j).each(function() {
							var iden="普通用户";
							if(this.identity==1){iden="管理员";}
												$("#result").append("<div style=\"margin-left:20px;height:30px\">登录名："+this.name+"|邮箱："+this.email+"|身份："+iden+"|<a href=\"/TutorSearch/Admin/"+this.id+"\">查看详细信息</a>|<a href=\"#\">修改</a>|<a href=\"/TutorSearch/Admin/delete/"+this.id+"\">删除</a></div><br>");
											});
						}
					}
				});
		
	});

	PageClick = function(pageclickednumber) {
		$("#pager").pager({
			pagenumber : pageclickednumber,
			pagecount : $("#mypage").val(),
			buttonClickCallback : PageClick
		});
		$.ajax({
					url : "/TutorSearch/Admin/show/" + (pageclickednumber - 1)
							* 5 + "/5",
					type : "get",
					success : function(r_str) {
						if (r_str == "nodate") {
							$("#result").show().html("无数据");
						} else {
							$("#result").empty();
							var j = eval(r_str);
							$(j).each(function() {
												$("#result").append("<div style=\"margin-left:20px;\">登录名："+this.name+"|邮箱"+this.email+"|<a href=\"/TutorSearch/admin/"+this.id+"\">查看详细信息</a>|<a href=\"#\">修改</a>|<a href=\"#\">删除</a></div><br>");
											});
						}
					}
				});

	}
</script>
</head>
<body>
<div id="man_zone">
<div id="header" class="header">
			<div style="margin-left:">用户列表</div>
		</div>
<input type="hidden" id="mypage" name="mypage" value="<%=session.getAttribute("pageNum")%>"/>
<div id="result" style="height:200px">result:</div>
<div id="pager" style="margin-left:20px;"></div>
</div>
</body>

</html>
