<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "engine.Core" %>
<%@ page import = "domain.Member" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
</head>
<body>
<section>

				<table>
					<tr>
						<td>
							<h3>
								At the moment you are logged as:
								<%
								String login = request.getParameter("user_login");
								Member m = Core.getDB().getMember(login);
							
								
							%>
							</h3>
						</td>
						</tr>
				
</table>
</section>
<%@ include file="menu.jsp"%>					
</body>
</html>