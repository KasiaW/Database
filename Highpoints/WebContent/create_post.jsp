<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "domain.Expedition"%>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<%
List <Expedition> l = Core.getDB().getExped("e.exped_login = '"+session.getAttribute("currentSessionUser")+"'");
String exped = request.getParameter("exped_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New post</title>
</head>
<body>
<section>
<h2>Create new post</h2>
<div class="post">
<form method="post" action="PostServlet">

<p>Choose expedition</p>
<ul>
<%for (Expedition e: l){ %>
	
	<li><input name="point" type="checkbox" id = "<%=e.getId()%>" value="<%=e.getId()%>" ><%=e.getPointName()%>
	 <em>(<%=e.getStart() %> - <%=e.getEnd() %>) </em></li>
	

<%} %>
</ul>

Category
		<select name="category">
		<option value="tip">tip</option>
		<option value="report">report</option>
		</select>
<p>
<textarea name="content" cols="80" rows="10"></textarea>
</p>
<input type="hidden" name="login" value="<%=session.getAttribute("currentSessionUser") %>">
<p id="war" style="color:red"></p>
<button>Save</button>

</form>
</div>
</section>

<%@ include file="menu.jsp"%>

<script>
<%if (l.isEmpty()){%>
$("#war").text("You have to first add some expedtions")
<%}else{ if (exped!=null){%>
$("#<%=exped%>").prop('checked', true);
<%}else{%>
$("#<%=l.get(0).getId()%>").prop('checked', true);
<%}}%>
</script>

</body>
</html>