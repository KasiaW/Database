<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<%@ page import = "domain.Point" %>
<%@ page import = "domain.Post" %>
<!DOCTYPE html >
<%
 Integer p = Integer.parseInt(request.getParameter("point_id"));
 List <Post> posts = Core.getDB().getPostsList("post.category = 'report' AND expedition.exped_aim = "+p);

 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reports</title>
</head>
<body>
<section><h2>Reports</h2>
<%for (Post post: posts) {%>
<%=post.getContent() %>

<%} %>

</section>
<%@ include file="menu.jsp"%>	

</body>
</html>