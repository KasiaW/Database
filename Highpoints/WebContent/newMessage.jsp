<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Settings</title>
<%
 String a = request.getParameter("addressee");
 if (a == null)a="";

%>
</head>
<body>
<section>
	<TABLE cellspacing=10>
		<TR>
			
			<td>
				<table>
					<tr>
						<td>
							<b>
								At the moment you are logged as:
								<%
								out.print(session.getAttribute("currentSessionUser"));
							%></b>
							
						</td>
					</tr>
					
					<table border="1">
						
						<form action="MessageServlet">
							
							<tr>
								<td><b>To*</b></td>
								<td><input type="text" name="addressee" size="55" value="<%=a%>"></td>
								
							</tr>
							
							<tr>
								<td><b>Title*</b></td>
								<td><input type="text" name="title" size="55"></td>
								
							</tr>
							
						
							<tr >
							
								<td ><b>Message*</b></td>
								<td><textarea  name="message" rows="15" cols="40"></textarea></td>
								
							</tr>
							<table>
							<tr>All the * fields are compulsory</tr>
							<tr> <td><input type="submit" value="SEND MESSAGE"
									style="width: 400px; height: 30px"></td>   </tr>
							
							</table>
								
							</form>


					</table>
</table>
</td>
</TR>
</TABLE>
</section>
<%@ include file="menu.jsp"%>
</body>
</html>