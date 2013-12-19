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

<title>个人资料</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/common.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="admin/css/admin.css"/>
</head>

<body>
<div id="man_zone">
	<div id="body" class="mybody">
		<div id="header" class="header">
			<div style="margin-left:">个人资料</div>
		</div>

		<div class="myform">
<table style="BORDER-COLLAPSE: collapse" borderColor=#ccc cellSpacing=0 width=600 bgColor=#ffffff border=1 font-size:12" >
  <tr >
    <td width="80" class="mytd">登录名：</td>
    <td width="200">&nbsp;</td>
    <td width="80" class="mytd">邮箱：</td>
    <td width="222">&nbsp;</td>
  </tr>
  <tr>
    <td class="mytd">真实姓名：</td>
    <td>&nbsp;</td>
    <td class="mytd">电话：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="mytd">年龄：</td>
    <td>&nbsp;</td>
    <td class="mytd">性别：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="mytd">大学：</td>
    <td>&nbsp;</td>
    <td class="mytd">专业：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="mytd">学历：</td>
    <td>&nbsp;</td>
    <td class="mytd">就读年限：</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" class="mytd">个人介绍：</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd">其他说明：</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="4" class="mytd"><a href="#">修改资料</a></td>
    </tr>
</table>

		</div>

	</div>
	<div id="footer"></div>
	</div>
	
</body>
</html>
