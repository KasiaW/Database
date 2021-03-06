<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "domain.Point" %>
<%@ page import = "domain.Expedition"%>
<%@ page import = "domain.Plan"%>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Expeditions</title>
</head>
<body>

<%@ include file="menu.jsp"%>
<section>
<h2>My Expeditions 
<a href="create_expedition.jsp"><button>Add new</button></a>
<a href="create_plan.jsp"><button>Add new plan</button></a>
</h2>
<div class="post">
<p>You achieved: </p>
<table border=1>
<tr><td>POINT</td>
	<td>DATE</td>
	<td>POSTS</td>
</tr>
<% List <Expedition> l = Core.getDB().getExped("e.exped_result=true AND e.exped_login='"+session.getAttribute("currentSessionUser")+"'");
   for (Expedition e: l){%>
   <tr><td><a href="point.jsp?point_id=<%=e.getPoint()%>&" ><%=e.getPointName()%></a></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   	   <td><a href="create_post.jsp?exped_id=<%=e.getId()%>&"><button>Write post</button></a></td>
   </tr>
   <%} %>
</table>
</div>
<div class="post">
<p>You tried without success: </p>
<table border=1>
<tr><td>POINT</td>
	<td>DATE</td>
	<td>POSTS</td>
</tr>
<% List <Expedition> l2 = Core.getDB().getExped("e.exped_result=false AND e.exped_login='"+session.getAttribute("currentSessionUser")+"'");
   for (Expedition e: l){%>
   <tr><td><a href="point.jsp?point_id=<%=e.getPoint()%>&" ><%=e.getPointName()%></a></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   	   <td><a href="create_post.jsp?exped_id=<%=e.getId()%>&"><button>Write post</button></a></td>
   </tr>
   <%} %>
</table>


<p></p>

</div>
<div class="post">
<p>Your plans</p>
<table border=1>
<tr><td>POINT</td>
	<td>READINESS</td>
	<td>NOTES</td>
	
</tr>
<% List <Plan> l3 = Core.getDB().getPlan("plan.plan_login='"+session.getAttribute("currentSessionUser")+"'");
   for (Plan pl: l3){%>
   <tr><td><a href="point.jsp?point_id=<%=pl.getPoint()%>&" ><%=Core.getDB().getPoint(pl.getPoint()).getName()%></a></td>
   	   <td><%=pl.getReadiness() %></td>
   	   <td><%=pl.getDescription() %></td>
   	   
   </tr>
   <%} %>
</table>
<p></p>

</div>
</section>

</body>
</html>