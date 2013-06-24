<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "engine.Core" %>
<%@ page import = "domain.Point" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="My.css">
<script src="jquery-1.9.1.min.js"></script>

</head>
<body>

<header style="background-color:white">
<div style="float:right">
 <%if (session.getAttribute("currentSessionUser")!=null) {%>
 <strong><% out.print(session.getAttribute("currentSessionUser")); %></strong>
 <a href="Logout"><button>Logout</button></a>
 <%}else{ %>
 <a href="index.jsp"><button>LogIn</button></a>
 <a href="register.jsp"><button>SignIn</button></a>
 <%} %>
 
 </div>
 <h1>Europe's Highpoints</h1>


</header>


<div class="horizontalBar">
<%String id = request.getParameter("point_id");
 if (id!= null){
 Point point = Core.getDB().getPoint(Integer.parseInt(id));
 %>


<ul>
	<li><a href="point.jsp?point_id=<%=id%>&">Overview</a></li>
	<li><a href="posts.jsp?type=tip&point_id=<%=id%>&">Tips</a></li>
	<li><a href="posts.jsp?type=report&point_id=<%=id%>&">Reports</a></li>
	 <%if (session.getAttribute("currentSessionUser")!=null) {%>
	<li><a href="society.jsp?point_id=<%=id%>&">Society</a></li>
	<%} %>
</ul>
<div style="width:230px; height:100px; background-image: url('placard.png');  background-size:100%;background-repeat:no-repeat;
 		color:white;text-align:center;vertical-align:middle; font-family:Nyala;
 		float:left; position:relative; left:160px; top:-25px;">
<p> <%=point.getName() %> <br><%=point.getElevation() %>m</p></div>

 <%} %>
</div>


<nav>
<ul>
	
	<li><a href="pointsList.jsp">Main page</a></li>

</ul>
</nav>

 <%if (session.getAttribute("currentSessionUser")!=null) {%>
<nav >
<ul>
	<li><a href="profile.jsp?user_login=<%=session.getAttribute("currentSessionUser")%>">My profile</a></li>
	<li><a href="expedition.jsp">My expeditions</a></li>
	<li><a href="messages.jsp">Messages</a></li>
	<li><a href="settings.jsp">Settings</a></li>
</ul>
</nav>
<%} %>






</body>
</html>