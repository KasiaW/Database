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
<h2>Settings</h2>
<div class="post">			
						<table border="1">
							<tr>
								<td>Username</td>
								<td>
									<%
										out.print(session.getAttribute("currentSessionUser"));
									%>
								</td>
							</tr>
							<tr>
								<td>Mail</td>
								<td>
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
												.executeQuery("SELECT * FROM member where login = '"
														+ user + "'");

										while (rs.next()) {
											mail1 = rs.getString("mail");
										}

										out.println(mail1);
									%>
								</td>
							</tr>
							<tr>
								<td>www</td>
								<td>
									<%
										rs = stmt.executeQuery("SELECT * FROM member where login = '"
												+ user + "'");
										String www = "";
										while (rs.next()) {
											www = rs.getString("www");
										}
										out.println(www);
									%>
								</td>
							</tr>

							<tr>
								<td>Birthday Date</td>
								<td>
									<%
										rs = stmt.executeQuery("SELECT * FROM member where login ='"
												+ user + "'");
										String birthday = "";
										while (rs.next()) {
											birthday = rs.getString("birthday");
										}
										out.println(birthday);
									%>
								</td>
							</tr>

							<tr>
								<td>Description</td>
								<td>
									<%
										rs = stmt.executeQuery("SELECT * FROM member where login ='"
												+ user + "'");
										String description = "";
										while (rs.next()) {
											description = rs.getString("description");
										}
										out.println(description);
									%>
								</td>
							</tr>
						</table>
						<table>
						<tr>
						<td>
						<h1>      </h1>
						</tr>
					
						<tr>
						<td>
						
						<a href="updateInfo.jsp"><button>UPDATE/INSERT NEW VALUES</button></a>
						
						</tr>						
						<tr>						
						<td>
						<a href="changePassword.jsp"><button>CHANGE THE PASSWORD</button></a>						
						</td>
						</tr>
					
						
					
						
						
						</table>
			
</div>
</section>
	
</body>
</html>