<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration page</title>
</head>
<body background="prova.jpg" bgcolor="#FFFFFF">
	<TABLE align="center">
		<TR>
			<h3>Insert the required data in order to register to the site</h3>
		</TR>
		<TR>
			<h4>The values (*) are compulsory</h4>
		</TR>

		<form action="RegisterServlet">
			<table bgcolor="#FFFFFF" border="1">


				<TR>
					<td>
						<h5>Username*:</h5>
					</td>
					<td><input type="text" name="user"></td>
				</TR>

				<TR>
					<td><h5>Password*:</h5></td>
					<td><input type="password" name="pass"></td>
				</TR>

				<TR>
					<TD><h5>Email*:</h5></TD>
					<TD><input type="text" name="email"></TD>
				</TR>

				<TR>
					<TD><h5>www:</TD>
					</h5>
					<TD><input type="text" name="www"></TD>
				</TR>

				<TR>
					<TD><h5>Date of birth (YYYY-MM-DD):</h5></TD>
					<TD><input type="text" name="date"></TD>
				</TR>

				<TR>
					<TD><h5>Description:</h5></TD>
					<TD><input type="text" name="des"></TD>
				</TR>

			</table>


			<TR>
				<TD><input type="submit" name="Submit1" value="REGISTER!"
					style="width: 320px; height: 1950px">
			</TR>
			</TD>

		</form>

	</TABLE>

</body>
</html>