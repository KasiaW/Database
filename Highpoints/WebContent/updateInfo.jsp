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
	<TABLE cellspacing="30">
		<TR>
			<td><%@ include file="index21.jsp"%></td>
			<td>
				<table width="500">
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
						<td><b>UPDATE/INSERT INFORMATION ABOUT YOU</b></td>
					</tr>
					<tr>
						<form action="UpdateInfoServlet">
						<table border="1">
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
												.executeQuery("SELECT * FROM member where login like '"
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
						<tr><td></td>
						<td>
							<input type="submit" name="Submit1" value="SAVE CHANGES" style="width:350px;height:50px;">
						</td>
						
						</tr>
						
				</table>
				</form>
		</tr>


		</td>
	</table>
</body>
</html>