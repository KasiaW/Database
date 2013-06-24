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
<%@ include file="menu.jsp"%>
<section>
<h2>Change your password</h2>	
			
					<form action="PasswordServlet">
						<table border="1">
							<tr>
								<td> <b>Inser your current password:</b></td>
								<td>
									<input type="password" name="de" required>
								</td>
							</tr> 
							<tr>
							<td> Inser your new password:</td>
								<td>
									<input type="password" name="new" required>
								</td></tr>
							
							<tr><td> Confirm your new password: </td>
								<td>
									<input type="password" name="new1" required>
								</td></tr>
							<tr></tr></table>
							<button>CHANGE</button>

			</form>

</section>
</body>
</html>