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

<title>Insert title here</title>
</head>
<body>

<%@ include file="menu.jsp"%>
<section>
<h2>My Expeditions</h2>


<p>You achieved: </p>
<table border=1>
<tr><td>POINT</td>
	<td>DATE</td>
</tr>
<% List <Expedition> l = Core.getDB().getExped("expedition.exped_result=true AND expedition.exped_login='"+session.getAttribute("currentSessionUser")+"'");
   for (Expedition e: l){%>
   <tr><td><a href="point.jsp?point_id=<%=e.getPoint()%>&" ><%=Core.getDB().getPoint(e.getPoint()).getName()%></a></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   </tr>
   <%} %>
</table>

<p>You tried without success: </p>
<table border=1>
<tr><td>POINT</td>
	<td>DATE</td>
</tr>
<% List <Expedition> l2 = Core.getDB().getExped("expedition.exped_result=false AND expedition.exped_login='"+session.getAttribute("currentSessionUser")+"'");
   for (Expedition e: l){%>
   <tr><td><a href="point.jsp?point_id=<%=e.getPoint()%>&" ><%=Core.getDB().getPoint(e.getPoint()).getName()%></a></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   </tr>
   <%} %>
</table>


<p></p>
<a href="create_expedition.jsp"><button>Add new</button></a>

<p>Your plans</p>
<table border=1>
<tr><td>POINT</td>
	<td>READINESS</td>
	<td>NOTES</td>
	<td>EDIT</td>
</tr>
<% List <Plan> l3 = Core.getDB().getPlan("plan.plan_login='"+session.getAttribute("currentSessionUser")+"'");
   for (Plan pl: l3){%>
   <tr><td><a href="point.jsp?point_id=<%=pl.getPoint()%>&" ><%=Core.getDB().getPoint(pl.getPoint()).getName()%></a></td>
   	   <td><%=pl.getReadiness() %></td>
   	   <td><%=pl.getDescription() %></td>
   	   <td><a href="create_plan.jsp?plan_id=<%=pl.getId()%>&" ><button>edit</button></a></td>
   </tr>
   <%} %>
</table>
<p></p>
<a href="create_plan.jsp"><button>Add new plan</button></a>

</section>

</body>
</html>