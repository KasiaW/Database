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
<h2>My mailbox</h2>	
<div class="post">			
					<table border="1">
					
					<tr>
						<td ><b>Sender</b></td>
					
					<td>
								<% 		Class.forName("org.postgresql.Driver");

										Connection connection = DriverManager.getConnection(
												"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
												"Phie5pia");

										String user = (session.getAttribute("currentSessionUser"))
												.toString();
										String sender = "";
										String date = "";
										String title = "";
										String message = "";
										Statement stmt = connection.createStatement();

										ResultSet rs = stmt.executeQuery("SELECT * FROM private_messagge where msg_id ='"
														+ request.getParameter("title") +"'");

										while (rs.next()) {
										
											sender = rs.getString("sender");
											date = rs.getString("msg_date");
											title = rs.getString("msg_title");
											message = rs.getString("msg_content");
											
											
											out.print(sender); } %>
											
											
											
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
					</div>
					<a href="messages.jsp"><button>All messages</button></a>
					</section>
</body>
</html>