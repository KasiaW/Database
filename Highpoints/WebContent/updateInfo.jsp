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
	<h2>Update/insert information about you</h2>
				<form action="UpdateInfoServlet">
				<table >
					<tr>
						<td> <b>Username</b></td>
								<td>
									<%
										out.print(session.getAttribute("currentSessionUser"));
									%>
								</td>
							</tr>
							<tr>
								<td><b>Mail</b></td>
								<td>
									<input type="text" name="mail1" value=
									
									<%
										Class.forName("org.postgresql.Driver");

										Connection connection = DriverManager.getConnection(
												"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
												"Phie5pia");

										String user = (session.getAttribute("currentSessionUser"))
												.toString();
										String mail1 = "";
										Statement stmt = connection.createStatement();

										ResultSet rs = stmt
												.executeQuery("SELECT * FROM member where login ='"
														+ user + "'");

										while (rs.next()) {
											mail1 = rs.getString("mail");
										}

										out.println(mail1);
									%>>
								</td>
							</tr>
							<tr>
								<td><b>www</b></td>
								<td>
								<input type="text" name="www1" value=
									<%
										rs = stmt.executeQuery("SELECT * FROM member where login like '"
												+ user + "'");
										String www = "";
										while (rs.next()) {
											www = rs.getString("www");
										}
										out.println(www);
									%>>
								</td>
							</tr>

							<tr>
								<td><b>Birthday Date</b></td>
								<td>
								<input type="text" name="bd1"  value=
									<%
										rs = stmt.executeQuery("SELECT * FROM member where login like '"
												+ user + "'");
										String birthday = "";
										while (rs.next()) {
											birthday = rs.getString("birthday");
										}
										out.println(birthday);
									%>>
								</td>
							</tr>

							<tr>
								<td><b>Description</b></td>
								<td>
								<input type="text" name="de" value=
									<%
										rs = stmt.executeQuery("SELECT * FROM member where login like '"
												+ user + "'");
										String description = "";
										while (rs.next()) {
											description = rs.getString("description");
										}
										out.println(description);
									%>>
								</td>
							</tr>
						
						</table>
					<button>Save changes</button>
						
						
						
				
				</form>
	
</section>	
</body>
</html>