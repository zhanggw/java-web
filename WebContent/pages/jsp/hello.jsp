<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>
	<%
		out.println("IP: " + request.getRemoteAddr());
	%>
	
	<%-- forward action --%>
	<h1>jsp forward 实例</h1>
	<jsp:forward page="date.jsp"/>
</body>
</html>