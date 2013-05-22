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
				
					<table border="1">
					
					<tr>
						<td ><b>Addressee</b></td>
					
					<td>
								<% 		Class.forName("org.postgresql.Driver");

										Connection connection = DriverManager.getConnection(
												"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
												"Phie5pia");

										String user = (session.getAttribute("currentSessionUser"))
												.toString();
										String addressee = "";
										String date = "";
										String title = "";
										String message = "";
										Statement stmt = connection.createStatement();

										ResultSet rs = stmt.executeQuery("SELECT * FROM private_messagge where msg_id ='"
														+ request.getParameter("title") +"'");

										while (rs.next()) {
										
											addressee = rs.getString("addressee");
											date = rs.getString("msg_date");
											title = rs.getString("msg_title");
											message = rs.getString("msg_content");
											
											
											out.print(addressee); } %>
											
											
											
											</td></tr>
											
										<tr>		
										
										<td ><b>Date</b></td>
										
										<td>
									<% 
										out.println(date);
			
										%>
			
										</td>		
										</tr>
										
										<tr>
										<td ><b>Title</b></td>
										<td>
										<% 	
										out.println(title);
											
										%>
										
										</td></tr>
										
										<tr>
										<td ><b>Message</b></td>
										<td>
										<% 	
											out.println(message);
											
										%>
										
										
										
										
										</td></tr>
											
											
							
							</table>
							</table>
							</table>
							
			
	</table>
</body>
</html>