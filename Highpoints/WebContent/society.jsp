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
<p>Members who reached <%=p.getName() %>:</p>
<%List <Expedition> l = Core.getDB().getExped("e.exped_aim="+a+"AND e.exped_result=true"); %>
<%if (l.isEmpty()) {%><strong>no</strong><%} else{%>
<table >
<tr><td>LOGIN</td>
	<td>DATE</td>
</tr>
<% 
   for (Expedition e: l){%>
   <tr><td><a href="profile.jsp?user_login=<%=e.getLogin()%>&" ><%=e.getLogin()%></a></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   </tr>
   <%} %>
</table>
<%} %>
</div>

<div class="post">
<p>Members who tried to reach <%=p.getName() %> without success:</p>
<%List <Expedition> l2 = Core.getDB().getExped("e.exped_aim="+a+"AND e.exped_result=false"); %>
<%if (l2.isEmpty()) {%><strong>no</strong><%} else{%>
<table >
<tr><td>LOGIN</td>
	<td>DATE</td>
</tr>
<% 
   for (Expedition e: l2){%>
   <tr><td><a href="profile.jsp?user_login=<%=e.getLogin()%>&" ><%=e.getLogin()%></a></td>
   	   <td><%=e.getStart() %> - <%=e.getEnd() %></td>	
   </tr>
   <%} %>
</table>
<%} %>
</div>
<div class="post">
<p>Members who want to go to <%=p.getName() %>:</p>
<%List <Plan> l3 = Core.getDB().getPlan("plan.plan_point="+a); %>
<%if (l3.isEmpty()) {%><strong>no</strong><%} else{%>
<table>
<tr><td>LOGIN</td>
	<td>READINESS</td>
	<td>NOTES</td>
	<td>SEND THE MSG</td>
</tr>
<% 
   for (Plan pl: l3){%>
   <tr><td><a href="profile.jsp?user_login=<%=pl.getLogin()%>&" ><%=pl.getLogin()%></a></td>
   	   <td><%if (pl.getReadiness() != null){%><%=pl.getReadiness() %><%} %></td>
   	   <td><%if (pl.getDescription() != null)%><%=pl.getDescription() %></td>
   	   <td><a href="newMessage.jsp?addressee=<%=pl.getLogin()%>&" ><button>MSG</button></a></td>
   </tr>
   <%} %>
</table>
<%} %>
</div>
<div class="post">
<p>You:</p>
<table>
<% List <Expedition> l4 = Core.getDB().getExped("e.exped_aim="+a+" AND e.exped_login='"+
										session.getAttribute("currentSessionUser")+"'");
									
	for (Expedition e: l4){%>
		<tr><td>You was there from <%=e.getStart() %> to <%=e.getEnd() %>
		<a href="create_post.jsp?exped_id=<%=e.getId()%>&"><button>Write post</button></a>
		</td></tr>
	
	<%} %>
</table>							
<a href="create_expedition.jsp?aim_id=<%=p.getId()%>"><button>I was there!</button></a>
<button>I wanna climb there!</button>
</div>
</section>
<%@ include file="menu.jsp"%>	
</body>
</html>