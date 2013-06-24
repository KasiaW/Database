<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Settings</title>
<%
 String a = request.getParameter("addressee");
 if (a == null)a="";

%>
</head>
<body>
<section>
<h2>New message</h2>
<div class="post">
	
					<form action="MessageServlet">
					<table border="1">
						
						
							
							<tr>
								<td><b>To*</b></td>
								<td><input type="text" name="addressee" size="55" value="<%=a%>" required></td>
								
							</tr>
							
							<tr>
								<td><b>Title*</b></td>
								<td><input type="text" name="title" size="55" required></td>
								
							</tr>
							
						
							<tr >
							
								<td ><b>Message*</b></td>
								<td><textarea  name="message" rows="15" cols="43" required></textarea></td>
								
							</tr>
						</table>
							All the * fields are compulsory
							<button>SEND</button>
							
							
							
								
							</form>


					

</div>
</section>
<%@ include file="menu.jsp"%>
</body>
</html>