<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript" type="text/javascript">
	var request;
	function createRequest() {
		if (window.ActiveXobject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");//判断浏览器是否是IE并且是否支持XMLHttpRequest对象
		} else if (window.XMLHttpRequest) { //判断浏览器是否支持XMLHttpRequest对象
			request = new XMLHttpRequest();

		}

	}

	function login() {
		createRequest();
		var name = document.getElementById("name").value;
		var password= document.getElementById("password").value;
		var check=document.getElementById("check").value;
		var url = "user/login?name="+name+"&password="+password+"&check="+check;
		request.open("POST", url, true);
		request.onreadystatechange = handleStateChange;
		request.send(null);
	}

	function handleStateChange() {
		if (request.readyState == 4) {
			if (request.status = 200) {
				//alert("OK!");
				var result = request.responseText;
				//alert(result);
				if(result=="success"){window.location.href="index.jsp";}
				else{
					var div = document.getElementById("result");
					div.innerHTML = "<b>失败</b>";
				}
				
				
			}
		}
	}
</script>
  </head>
  
  <body>
  <br><div id="result"></div>
  <form   action="#">
   Login: 
   name:<input type="text" name="name" id="name">
   pwd:<input type="password" name="password" id="password">
   check<input type="text" name="check" id="check">
 <input type="button"  value="Login" onclick="login();"> 
   </form>
  </body>
</html>
