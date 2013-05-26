<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<%@ page import = "domain.Point" %>
<%@ page import = "domain.Post" %>
<!DOCTYPE html >
<%
 Integer p = Integer.parseInt(request.getParameter("point_id"));
 String type = request.getParameter("type");
List <Post> posts = Core.getDB().getPostsList("post.category = '"+type+"' AND expedition.exped_aim = "+p);
 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Posts</title>
</head>
<body>
<section><h2><%=type %>s</h2>
<%for (Post post: posts) {%>
<div class="post">
<%=post.getContent() %>
<p></p>
<details>
<summary>Comments</summary>
<!-- IMPLEMENT COMMENTS HERE -->

</details>
</div>
<%} %>

</section>
<%@ include file="menu.jsp"%>	

</body>
</html>