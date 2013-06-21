<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "domain.Point" %>
<%@ page import = "domain.Expedition"%>
<%@ page import = "domain.Plan"%>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Society</title>
<%
 int a = Integer.parseInt(request.getParameter("point_id"));
 Point p = Core.getDB().getPoint(a);
%>
</head>
<body>

<section><h2>Society</h2>

<div class="post">
<p>Members who reached <%=p.getName() %></p>
<table >
<tr><td>LOGIN</td>
	<td>DATE</td>
</tr>
<% List <Expedition> l = Core.getDB().getExped("e.exped_aim="+a+"AND e.exped_result=true");
   for (Expedition e: l){%>
   <tr><td><a href="profile.jsp?user_login=<%=e.getLogin()%>&" ><%=e.getLogin()%></a></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   </tr>
   <%} %>
</table>
</div>

<div class="post">
<p>Members who failed <%=p.getName() %></p>
<table >
<tr><td>LOGIN</td>
	<td>DATE</td>
</tr>
<% List <Expedition> l2 = Core.getDB().getExped("e.exped_aim="+a+"AND e.exped_result=false");
   for (Expedition e: l2){%>
   <tr><td><a href="profile.jsp?user_login=<%=e.getLogin()%>&" ><%=e.getLogin()%></a></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   </tr>
   <%} %>
</table>
</div>
<div class="post">
<p>Members who want to go to <%=p.getName() %></p>
<table>
<tr><td>LOGIN</td>
	<td>READINESS</td>
	<td>NOTES</td>
	<td>SEND THE MSG</td>
</tr>
<% List <Plan> l3 = Core.getDB().getPlan("plan.plan_point="+a);
   for (Plan pl: l3){%>
   <tr><td><a href="profile.jsp?user_login=<%=pl.getLogin()%>&" ><%=pl.getLogin()%></a></td>
   	   <td><%=pl.getReadiness() %></td>
   	   <td><%=pl.getDescription() %></td>
   	   <td><a href="newMessage.jsp?addressee=<%=pl.getLogin()%>&" ><button>MSG</button></a></td>
   </tr>
   <%} %>
</table>
</div>
<div class="post">
<p>You</p>
<a href="create_expedition.jsp?aim_id=<%=p.getId()%>"><button>I was there!</button></a>
<button>I wanna climb there!</button>
</div>
</section>
<%@ include file="menu.jsp"%>	
</body>
</html>