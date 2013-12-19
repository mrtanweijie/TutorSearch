<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加家教</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/common.css">

<link rel="stylesheet" type="text/css" href="../admin/css/admin.css"/>	


<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/jquery.DatePicker.min.js"></script>
<!-- 代码高亮 -->
<script type="text/javascript" src="js/ds.in.js"></script>
<script type="text/javascript" src="js/ds.lighter.js"></script>
<script type="text/javascript" src="js/51_min.js"></script>
<script type="text/javascript" src="js/province_city.js" charset="gbk"></script>
<script language=javascript>
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
 <div id="man_zone">
	<div id="body" class="mybody">
		<div id="header" class="header">
			<div style="margin-left:">添加家教</div>
		</div>

		<div class="myform">
		<form method="post" action="<%=request.getContextPath() %>/tutor/create">
			<table style="BORDER-COLLAPSE: collapse" borderColor=#ccc
				cellSpacing=0 width=700 bgColor=#ffffff border=1" >
				<tr>
					<td width="180" height="40" class="mytdc">标题：</td>
					<td colspan="3"><input type="text" id="title" name="title" class="myinput"></td>
				</tr>
				<tr>
					<td class="mytdc">辅导科目：</td>
					<td width="200"><select id="subject" name="subject" class="myinput">
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
					<td width="150">学生年级：</td>
					<td width="250"><select id="grade" name="grade" class="myinput">
							<option>选择年级</option>
							<option>六年级</option>
							<option>初三</option>
							<option>高三</option>
							<option>其他</option>
					</select></td>
				</tr>
				<tr>
					<td class="mytdc">要求教员专业：</td>
					<td><input type="text" id="req_major" name="req_major" class="myinput">
					</td>
					<td>要求教员性別：</td>
					<td><input type="text" id="req_sex" name="req_sex" class="myinput">
					</td>
				</tr>
				<tr>
					<td class="mytdc">家长称呼</td>
					<td><input type="text" id="patriarch" name="patriarch" class="myinput">
					</td>
					<td>家长联系方式</td>
					<td><input type="text" id="phone" name="phone" class="myinput"></td>
				</tr>
				<tr>
					<td class="mytdc">家教报酬：</td>
					<td><input type="text" id="pay" name="pay" class="myinput">
					</td>
					<td>结束时间</td>
					<td><input type="text" id="end" name="end" class="myinput"> <script
							type="text/javascript">
	;(function(global, document, $, undefined) {
		$('#end').datePicker({
			followOffset : [ 0, 24 ]
		});
		window.p1 = $('#end').data('DatePicker');
	})(this, document, jQuery);
</script></td>
				</tr>
				<tr>
					<td class="mytdc">地址：</td>
					<td colspan="3">省<select id="province" name="province"
						class="myinput"><option></option>
					</select> 城市<select id="city" name="city" class="myinput"><option></option>
					</select> <script language="javascript">setup();</script></td>
				</tr>
				<tr>
					<td colspan="4" class="mytdc">内容：</td>
				</tr>
				<tr>
					<td colspan="4" class="mytdc"><textarea name="content" id="content" cols="45" rows="5" style="width:50%" class="myinputtf" ></textarea></td>
				</tr>
				<tr>
					<td colspan="4" class="mytdc">其他说明：</td>
				</tr>
				<tr>
					<td colspan="4" class="mytdc"><textarea name="others" id="others" cols="45" rows="5" style="width:50%" class="myinputtf" ></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="mytdc"><input type="submit" value="添加" class="mybutton"></td>
				</tr>
			</table>
</form>
		</div>

	</div>
	<div id="footer"></div>
	</div>
	</div>
</body>
</html>
