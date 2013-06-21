<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "engine.Core" %>
<%@ page import = "domain.Point" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="My.css">

</head>
<body>


<div style="float:right">
 <%if (session.getAttribute("currentSessionUser")!=null) {%>
 <% out.print(session.getAttribute("currentSessionUser")); %>
 <a href="Logout"><button>Logout</button></a>
 <%}else{ %>
 <a href="index.jsp"><button>LogIn</button></a>
 <a href="register.jsp"><button>SignIn</button></a>
 <%} %>
 
 </div>
 <h1>Europe's Highpoints</h1>
<header>

</header>
<nav>
<ul>
	
	<li><a href="pointsList.jsp">Main page</a></li>


</ul>
</nav>

<nav>
<ul>
	<li><a href="profile.jsp?user_login=<%=session.getAttribute("currentSessionUser")%>&">My profile</a></li>
	<li><a href="expedition.jsp">My expeditions</a></li>
	<li><a href="messages.jsp">Messages</a></li>
	<li><a href="settings.jsp">Settings</a></li>
</ul>
</nav>

<%String id = request.getParameter("point_id");
 if (id!= null){%>
 <nav><%=Core.getDB().getPoint(Integer.parseInt(id)).getName() %>
<ul>
	<li><a href="point.jsp?point_id=<%=id%>&">Overview</a></li>
	<li><a href="posts.jsp?type=tip&point_id=<%=id%>&">Tips</a></li>
	<li><a href="posts.jsp?type=report&point_id=<%=id%>&">Reports</a></li>
	<li><a href="society.jsp?point_id=<%=id%>&">Society</a></li>
</ul>
</nav>
 <%} %>





</body>
</html>