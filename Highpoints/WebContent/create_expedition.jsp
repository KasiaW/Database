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
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<title>Insert title here</title>
<%
 String a = request.getParameter("aim_id");
%>


</head>
<body>



<section>
<h2>Add new expedition</h2>
<form method="post" action="ExpeditionServlet">
<table>
<tr>
	<td>Where were you?</td>
	
	<%for (Point p :points){
		List <String> loc = Core.getDB().getLocation(p.getId());
		 String location = "";
		 if (!loc.isEmpty()) {location= "("+loc.get(0);
		 for (int i=1; i<loc.size(); i++)
			 location += "/"+loc.get(i);
		 location+=")";
		 }
		 %>
		 <tr><td>
		 <input name="point" type="radio" id = "<%=p.getId()%>" value="<%=p.getId()%>" required><%=p.getName()%> <%=location %>
		 </td></tr>
	<%} %>
		
	

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
</section>
<%@ include file="menu.jsp"%>	
</body>
</html>