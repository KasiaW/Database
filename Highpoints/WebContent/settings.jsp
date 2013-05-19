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
			<td><%@ include file="index21.jsp"%></td>
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
					<tr>
						<td>Those are the data stored in our systems about you</td>
					</tr>
					<tr>
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
												.executeQuery("SELECT * FROM member where login like '"
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
										rs = stmt.executeQuery("SELECT * FROM member where login like '"
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
										rs = stmt.executeQuery("SELECT * FROM member where login like '"
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
										rs = stmt.executeQuery("SELECT * FROM member where login like '"
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
						<form action="updateInfo.jsp">
						<td>
							<input type="submit" name="Submit1" value="UPDATE/INSERT NEW VALUES" style="width:350px;height:25px;">
						</td>
						</form>
						</tr>
						
						<tr>
						<form action="changePassword.jsp">
						<td>
							<input type="submit" name="Submit2" value="CHANGE THE PASSWORD" style="width:350px;height:25px;">
						</td>
						
						</form>
						
						</tr>
						
						<tr>
						<form action="delete.jsp">
						<td>
							<input type="submit" name="Submit3" value="DELETE YOUR ACCOUNT" style="width:350px;height:25px;">
						</td>
						</form>
						</tr>
						
						
						</table>
						
				</table>
		</tr>


		</td>
	</table>
</body>
</html>