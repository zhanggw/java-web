<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp_study</title>
</head>
<body>
<%-- 
	<h1>使用GET获取表单数据</h1>
	<ul>
		<li>
			<p>站点名: <%= request.getParameter("name") %></p>
		</li>
		<li>
			<p>网址: <%= request.getParameter("url") %></p>
		</li>
	</ul>
--%>

<%-- 
	<h1>使用POST从文本框中获取表单数据</h1>
	<ul>
		<li><p>站点名:
			<%
				String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
			%>
			<%= name %> </p>
		</li>
		<li>
			<p>网址: <%= request.getParameter("url") %></p>
		</li>
	</ul>
 --%>	
	
	<h1>从复选框中读取数据</h1>
	<ul>
		<li>
			<p>Google:</p>
			<%= request.getParameter("google") %>
		</li>
		<li>
			<p>Runoob:</p>
			<%= request.getParameter("runoob") %>
		</li>
		<li>
			<p>Taobao:</p>
			<%= request.getParameter("taobao") %>
		</li>
	</ul>
	
	<table width="100%" border="1" align="center">
		<tr>
			<th>name</th>
			<th>value</th>
		</tr>
		<%
			Enumeration params = request.getParameterNames();
			while(params.hasMoreElements()) {
				out.print("<tr>");
				String name = (String)params.nextElement();
				String value = request.getParameter(name);
				out.print("<td>" + name + "</td>");
				out.print("<td>" + value + "</td>");
				out.print("</tr>");
			}
		%>
	</table>
</body>
</html>