package org.zhanggw.servlet.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DisplayHeaderServlet extends HttpServlet {

	private static final long serialVersionUID = -6242658923241445041L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		String title = "HTTP Header 请求实例 - 菜鸟教程实例";
		String docType = "<!DOCTYPE html>";
		out.println(
				docType + "\n" + 
				"<html>\n" + 
				"<head>\n" +
				"<meta charset=\"UTF-8\">\n" +
				"<title>" + title + "</title>\n" +
				"</head>\n" + 
				"<body bgcolor=\"#f0f0f0\">\n" + 
				"<h1 align=\"center\">" + title + "</h1>\n" + 
				"<table width=\"100%\" border=\"1\" align=\"center\">\n" + 
				"<tr bgcolor=\"#949494\">\n" +
				"<th>Header 名称</th><th>Header 值</th>\n" +
				"</tr>\n"
				);
		Enumeration headers = req.getHeaderNames();
		while(headers.hasMoreElements()) {
			String paramName = (String)headers.nextElement();
			String paramValue = req.getHeader(paramName);
			out.print("<tr><td>" + paramName + "</td>\n");
			out.println("<td> " + paramValue + "</td></tr>\n");
		}
		
		out.println("</table>\n</body></html>");
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		this.doGet(req, resp);
	} 
}
