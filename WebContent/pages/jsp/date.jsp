<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<p>
	<%
		response.setHeader("refresh", "1");
	%>
	今天的日期是: 
	<% out.println(new java.util.Date().toLocaleString()); %>
</p>
