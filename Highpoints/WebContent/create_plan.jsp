<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "domain.Point" %>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>   
<% List <Point> points = Core.getDB().getPointsList();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New plan</title>
<%String pointId = request.getParameter("point"); %>
</head>
<body>
<section>
<h2>Create new plan</h2>
<div class="post">
<form method="post" action="PlanServlet">
<p>
Where do you want to go?
</p>
<ul>
	<%for (Point p :points){
		List <String> loc = Core.getDB().getLocation(p.getId());
		 String location = "";
		 if (!loc.isEmpty()) {location= "("+loc.get(0);
		 for (int i=1; i<loc.size(); i++)
			 location += "/"+loc.get(i);
		 location+=")";
		 }
		 %>
		 
		<li> <input name="point" type="radio" id = "<%=p.getId()%>" value="<%=p.getId()%>" required><%=p.getName()%> <%=location %></li>
		
	<%} %>
</ul>
<p>	
Readiness	
	<select name="readiness">
		<option value="no">no</option>
		<option value="companions_need">I'm looking for companions</option>
		<option value="prepared">Everything prepared</option>
		</select>
		</p>
	
Notes

<p><textarea rows="4"cols="40" name="notes">
</textarea></p>
<input type="hidden" name="login" value="<%=session.getAttribute("currentSessionUser") %>">
<button>Save</button>
</form>
</div></section>
<%@ include file="menu.jsp"%>
<script>
$("#<%=pointId%>").prop('checked', true);
</script>
</body>
</html>