<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "engine.Core" %>
<%@ page import="java.util.List"%>
<%@ page import = "domain.Point" %>
<%@ page import = "domain.Post" %>
<%@ page import = "domain.Comment" %>

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
<% 	
	String id = Integer.toString(post.getId()); 
	List <Comment> comment = Core.getDB().getComment(id);
%>

<p></p>
<details>
<summary>Comments</summary>

<!-- IMPLEMENT COMMENTS HERE -->

<table border = "1">
	<tr>
		<td width = "50px"><b>Date</b></td>
		<td width = "100px"><b>Author</b></td>
		<td width = "350px"><b>Content</b></td>
	</tr>
	<% for(Comment comments: comment){ %>
	<tr>
		<td><% out.print(comments.getDate()); %></td>
		<td><% out.print(comments.getAuthor()); %></td>
		<td><% out.print(comments.getContent()); %></td>
	</tr>
	<%} %>
	<tr height="25px">
		<form action="CommentServlet">
			<td width="215px"><input type="text" name="comment" ></td>
			<input type= "hidden" name="idPost" value="<%=post.getId()%>">
			<td> <input type="submit" name="SubmitComment" value="Submit Comment" style="width:150px;height:25px;"> </td>
		</form>
	</tr>
</table>

</details>
</div>
<%} %>

</section>
<%@ include file="menu.jsp"%>	

</body>
</html>