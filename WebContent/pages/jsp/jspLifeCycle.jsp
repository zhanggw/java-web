<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page autoFlush="true" buffer="1094kb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html, utf-8">
<title>life.jsp</title>
</head>

<body>
	<%!
		private int initVar = 0;
		private int serviceVar=0;
		private int destroyVar=0;
	%>
	
	<%!
		public void jspInit() {
			initVar++;
			System.out.println("jspInit(): JSP被初始化了"+initVar+"次");
		}
		public void jspDestory() {
			destroyVar++;
			System.out.println("jspDestroy(): JSP被销毁了"+destroyVar+"次");
		}
	%>
	
	<%
		serviceVar++;
		System.out.println("_jspService(): JSP共响应了"+serviceVar+"次请求");
		String content1="初始化次数 : "+initVar;
		String content2="响应客户请求次数 : "+serviceVar;
		String content3="销毁次数 : "+destroyVar;
	%>
	
	<h1>菜鸟教程 JSP 测试实例</h1>
	<p><%= content1 %></p>
	<p><%= content2 %></p>
	<p><%= content3 %></p>
	
	<%-- if else block --%> <%-- jsp comment, not be sent to web brower --%>	
	<!-- if else block -->  <%-- html comment, will be sent to web brower --%>
	<% if(initVar == 1) { %>
		<p> one </p>
	<% } else { %>
		<p> other </p>
	<% } %>
	
	<%-- include action --%>
	<h2>include 动作</h2>
	<jsp:include page="date.jsp" flush="true"></jsp:include>
	
	<%-- useBean action --%>
	<h2>jsp 使用 javabean</h2>
	<jsp:useBean id="people" class="org.zhanggw.jsp.People">
		<jsp:setProperty name="people" property="name" value="张国卫" />
	</jsp:useBean>
	<p>people is: <jsp:getProperty property="name" name="people"/> </p>
	
	<%-- xml element action --%>
	<h2>xml 动作</h2>
	<jsp:element name="employee">
		<jsp:attribute name="employeeAttr">
			companyAttribute
		</jsp:attribute>
		<jsp:body>
			tairan
		</jsp:body>
	</jsp:element>
</body>
</html>