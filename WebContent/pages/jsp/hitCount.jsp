<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Integer hitCount = (Integer)application.getAttribute("hitCounter");
	if(hitCount == null || hitCount == 0) {
		out.println("欢迎访问菜鸟教程!");
		hitCount = 1;
	} else {
		out.println("欢迎再次访问菜鸟教程!");
		hitCount++;
	}
	application.setAttribute("hitCounter", hitCount);
%>

<p>页面访问量：<%= hitCount %></p>
</body>
</html>