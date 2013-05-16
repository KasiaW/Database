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
	<TABLE>
		<TR>
			<td><%@ include file="index21.jsp"%></td>
			<td>
				<table >
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
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
				
					<tr>
						<table border="1">
							<tr>
								<td> <b>Inser your current password:</b></td>
								<td>
									<input type="password" name="de">
								</td>
							</tr> <tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr>
							<td> Inser your new password:</td>
								<td>
									<input type="password" name="new">
								</td></tr>
							
							<tr><td> Confirm your new password: </td>
								<td>
									<input type="password" name="new1">
								</td></tr>
							<tr>
							<table>
							
						
							<input type="submit"  value="CHANGE YOUR PASSWORD" style="width:360px;height:170px"> 
							</tr>
							</table>

	
	</table>
</body>
</html>