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

<div>Author: <strong><%=post.getAuthor() %></strong></div>
<%=post.getContent() %>
<% 	
	String id = Integer.toString(post.getId()); 
	List <Comment> comment = Core.getDB().getComment(id);
%>
<p></p>

<details style="position:relative; left:20px;">
<summary style="position:relative; left:-20px;">Comments (<%=comment.size() %>)</summary>

<!-- COMMENTS -->
	<% for(Comment comments: comment){ %>
	<p>
	<strong><%=comments.getAuthor()%></strong>, date: <%=comments.getDate() %>
	<br><%=comments.getContent()%>
	</p>

	<%} %>
	
		<form action="CommentServlet" onsubmit="return validateForm('a<%=post.getId()%>','w<%=post.getId()%>' )" class="new_com">
		<strong>Your comment:</strong><br>
			<textarea name="comment" id="a<%=post.getId()%>" rows="3" cols="50"></textarea>
			<input type= "hidden" name="idPost" value="<%=post.getId()%>">
			<input type= "hidden" name="url" value="posts.jsp?point_id=<%=Integer.toString(p) %>&type=<%=type %>&">
			<p id="w<%=post.getId()%>" style="color:red"></p>
			<button>Add comment</button>
		
		</form>
	


</details>
</div>
<%} %>

</section>
<%@ include file="menu.jsp"%>	

</body>

<script>
//check if comment is longer than 3 char
function validateForm(area, war){
	if ($("#"+area).val().length < 3){
	 $("#"+war).text("Comment must contain more than 3 characters!");
	 return false;
	}
}

//only members can add comments
<%if (session.getAttribute("currentSessionUser")==null){%>
$(".new_com").prop("hidden",true);
<%}%>

</script>
</html>