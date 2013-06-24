<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "engine.Core" %>
<%@ page import = "domain.Member" %>
<%@ page import = "domain.Expedition" %>
<%@ page import = "domain.Point" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
</head>
<body>
<section>
<%

String login = request.getParameter("user_login");
Member m = Core.getDB().getMember(login); 
List <Expedition> list = Core.getDB().getSucExped(login);
%>

<h2><%=login %></h2>
<div class="post">						
					
					<table>
					<tr><td><b>Mail</b></td>
					<td><%out.print(m.getMail()); %></td>
					<tr><td><b>WWW</b></td>
					<td><%out.print(m.getWWW()); %></td></tr>
					<tr><td><b>Birthday Date</b></td>
					<td><%out.print(m.getBirthday()); %></td></tr>
					<tr><td><b>Joined Date</b></td>
					<td><%out.print(m.getJoined()); %></td></tr>
					<tr><td><b>Description</b></td>
					<td><%out.print(m.getDescription()); %></td></tr>
					</table>
					
					
					<b>SUCCEDED EXPEDTION</b>
					<table border="1">
					<tr><td><b>Time</b></td><td><b>Reached Point</b></td></tr>
					<tr>
					<% for (Expedition e : list){%>
						<tr><td><%  out.print(e.getStart()+" - " + e.getEnd()); %></td>
						<td>
						
						
						<% Point point = Core.getDB().getPoint(e.getPoint());
							String rPoint = point.getName();%>
							<a href="point.jsp?point_id=<%=point.getId()%>&" ><%=point.getName()%></a>
												
						<% 
					} %>
					
				</table>
					
					
</div>					
					
					
				

</section>
<%@ include file="menu.jsp"%>					
</body>
</html>