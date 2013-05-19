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
						<td>The account <%
								out.print(session.getAttribute("currentSessionUser"));
							%> has been correctly deleted.</td>
					</tr>
					
					<% Class.forName("org.postgresql.Driver");

					Connection connection = DriverManager.getConnection(
							"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
							"Phie5pia");

					String userName = (session.getAttribute("currentSessionUser")).toString();
					
					Statement stmt = connection.createStatement();
				

					stmt.executeUpdate("DELETE FROM member WHERE login='"+userName+"';");
					%>
					
				<tr><td>
				<a href=index.jsp> Go to the login page!</a>
				</td>
				</tr>
	</table>
</body>
</html>