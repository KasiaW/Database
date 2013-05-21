<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="My.css">



</head>
<body>

<h1>Europe's Highpoints</h1>


<nav>
<ul>
	<li>Logged as  <% out.print(session.getAttribute("currentSessionUser")); %>  </li>
	<li><a href="index.jsp">Logout!</a></li>
	<li><a href="pointsList.jsp">Main page</a></li>


</ul>
</nav>

<nav>
<ul>
	<li><a href="profile.jsp">My profile</a></li>
	<li><a href="expedition.jsp">My expeditions</a></li>
	<li><a href="messages.jsp">Messages</a></li>
	<li><a href="settings.jsp">Settings</a></li>
</ul>
</nav>

<%String id = request.getParameter("point_id");
 if (id!= null){%>
 <nav>
<ul>
	<li><a href="point.jsp?point_id=<%=id%>&">Overview</a></li>
	<li><a href="tips.jsp?point_id=<%=id%>&">Tips</a></li>
	<li><a href="reports.jsp?point_id=<%=id%>&">Reports</a></li>
	<li><a href="society.jsp?point_id=<%=id%>&">Society</a></li>
</ul>
</nav>
 <%} %>





</body>
</html>