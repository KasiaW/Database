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

<title>New expedition</title>
<%
 String a = request.getParameter("aim_id");
%>


</head>
<body>



<section>

<h2>Add new expedition</h2>
<div class="post">
<form method="post" action="ExpeditionServlet">


	<p>Where were you?</p>
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
		 <li>
		 <input name="point" type="radio" id = "<%=p.getId()%>" value="<%=p.getId()%>" required><%=p.getName()%> <%=location %>
		 </li>
	<%} %>
	</ul>	
	
<table>
<tr>
	<td>
	Start<input type="date"  name="start" required placeholder="yyyy-mm-dd">
</td></tr>
<tr><td>
	End <input type="date"  name="end"required>
	</td>
</tr>
<tr>
	<td>Result
	
		<select name="result">
		<option value="true">true</option>
		<option value="false">false</option>
		</select>
	</td>
</tr>

</table>

<input type ="hidden" name="login" value="<%=session.getAttribute("currentSessionUser") %>">
<input type="submit" value="Submit" >
</form>

<script>
if (<%=a%> != null){
$('#<%=a%>').attr('checked', true);
}
</script>
</div>
</section>
<%@ include file="menu.jsp"%>	
</body>
</html>