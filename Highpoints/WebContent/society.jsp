<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "domain.Point" %>
<%@ page import = "domain.Expedition" %>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
 int a = Integer.parseInt(request.getParameter("point_id"));
 Point p = Core.getDB().getPoint(a);
%>
</head>
<body>

<section><h2>Society</h2>

<p>Members who reached <%=p.getName() %></p>
<table border=1>
<tr><td>LOGIN</td>
	<td>DATE</td>
</tr>
<% List <Expedition> l = Core.getDB().getExped("expedition.exped_aim="+a+"AND expedition.exped_result=true");
   for (Expedition e: l){%>
   <tr><td><%=e.getLogin() %></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   </tr>
   <%} %>
</table>

<p>Members who failed <%=p.getName() %></p>
<table border=1>
<tr><td>LOGIN</td>
	<td>DATE</td>
</tr>
<% List <Expedition> l2 = Core.getDB().getExped("expedition.exped_aim="+a+"AND expedition.exped_result=false");
   for (Expedition e: l2){%>
   <tr><td><%=e.getLogin() %></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   </tr>
   <%} %>
</table>


</section>
<%@ include file="menu.jsp"%>	
</body>
</html>