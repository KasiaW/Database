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
					<table>
						<b>RECEIVED MESSAGES</b>
						<table border="1">

							<tr>
								<td><b>Sender</b></td>
								<td><b>Date</b></td>
								<td><b>Title</b></td>

							</tr>

							<%
								Class.forName("org.postgresql.Driver");

								Connection connection = DriverManager.getConnection(
										"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
										"Phie5pia");

								String user = (session.getAttribute("currentSessionUser"))
										.toString();
								String sender = "";
								String date = "";
								String title = "";
								String mesId = "";
								Statement stmt = connection.createStatement();

								ResultSet rs = stmt
										.executeQuery("SELECT * FROM private_messagge where addressee ='"
												+ user + "'");

								while (rs.next()) {

									sender = rs.getString("sender");
									date = rs.getString("msg_date");
									title = rs.getString("msg_title");
									mesId = rs.getString("msg_id");

							%>
							<tr>
								<td>
									<%
										out.print(sender);
									%>
								</td>
								<td>
									<%
										out.print(date);
									%>
								</td>
								<td><a href="showMessage.jsp?title=<%out.print(mesId);%>&">
										<%
											out.print(title);
										%>
								</a></td>
							</tr>

							<%
								}
							%>
							</td>
							</tr>
						</table>
						<h1></h1>



						<table>
							<b>SENT MESSAGES</b>
							<table border="1">

								<tr>
									<td><b>Addresser</b></td>
									<td><b>Date</b></td>
									<td><b>Title</b></td>

								</tr>

								<%
									Class.forName("org.postgresql.Driver");

									String addresser = "";
									String date1 = "";
									String title1 = "";
									String msId = "";

									rs = stmt
											.executeQuery("SELECT * FROM private_messagge where sender = '"
													+ user + "'");

									while (rs.next()) {

										addresser = rs.getString("addressee");
										date1 = rs.getString("msg_date");
										title1 = rs.getString("msg_title");
										msId = rs.getString("msg_id");
								%>
								<tr>
									<td>
										<%
											out.print(addresser);
										%>
									</td>
									<td>
										<%
											out.print(date1);
										%>
									</td>
									<td>
										<a href="showMessage2.jsp?title=<%out.print(msId);%>&">
										<%
											out.print(title1);
										%></a>
									</td>
								</tr>

								<%
									}
								%>
								</td>
								</tr>
							</table>

							<form action="newMessage.jsp">
							<tr>
								<td></td>
								<td><input type="submit" value="SEND A NEW MESSAGE!"
									style="width: 250px; height: 20px"></td>

							</tr>
							
							
							</form>
						</table>


					</table>
</body>
</html>