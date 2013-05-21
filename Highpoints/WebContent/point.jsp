<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "domain.Point" %>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html >
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


<section>
<h2><%=p.getName()%></h2>
<table>
	<tr>
		<td>Location:</td>
		<td><%List<String> l = Core.getDB().getLocation(a);
			for (String loc: l){%>
			<%=loc%>
			<%} %>
		</td>
	</tr>
	<tr>
		<td>Elevation:</td>
		<td></td>
	</tr>
	<tr>
		<td>Difficulty:</td>
		<td><%=p.getDifficulty() %></td>
	</tr>
</table>
<h3>Overview</h3>
<p><%=p.getDescription() %></p>
<h3>Description of routes</h3>
<p><%=p.getRoutes() %></p>
<h3>How to get there</h3>
<p><%=p.getPointAccess() %></p>

</section>

<%@ include file="menu.jsp"%> 



</body>
</html>