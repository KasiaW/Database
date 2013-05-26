<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "domain.Expedition"%>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<%
List <Expedition> l = Core.getDB().getExped("e.exped_login = '"+session.getAttribute("currentSessionUser")+"'");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New post</title>
</head>
<body>
<section>

<form method="post" action="PostServlet">
<table>
<tr><td>
<ul>
<%for (Expedition e: l){ %>
	
	<li><input name="point" type="checkbox" id = "<%=e.getId()%>" value="<%=e.getId()%>" ><%=e.getPointName()%>
	 <em>(<%=e.getStart() %> - <%=e.getEnd() %>) </em></li>
	

<%} %>
</ul></td></tr>

<tr><td>Category
		<select name="category">
		<option value="tip">tip</option>
		<option value="report">report</option>
		</select>

</td></tr>
<tr>
	<td><textarea name="content"></textarea></td>
</tr>

<tr><td>
<input type="hidden" name="login" value="<%=session.getAttribute("currentSessionUser") %>"></td></tr>
<tr><td><input type="submit" value="Submit"></td></tr>
</table>
</form>

</section>
<%@ include file="menu.jsp"%>

</body>
</html>