<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Settings</title>
</head>
<body>
	<TABLE cellspacing="40">
		<TR>
			<td><%@ include file="menu.jsp"%></td>
			<td>
				<table>
					<tr>
						<td>
							<h3>
								At the moment you are logged as:
								<%
								out.print(session.getAttribute("currentSessionUser"));
							%>
							</h3>
						</td>
					</tr>
					<table border="1">
						
							<tr>
								<td><b>To</b></td>
								<td><input type="text" name="addressee" size="55"></td>
								
							</tr>
							
							<tr>
								<td><b>Title</b></td>
								<td><input type="text" name="title" size="55"></td>
								
							</tr>
							
						
							<tr >
							
								<td ><b>Message</b></td>
								<td><textarea  name="message" rows="15" cols="40"></textarea></td>
								
							</tr>
					
							
								
					


					</table>
</body>
</html>