<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration page</title>
</head>
<body background="prova.jpg" bgcolor="#FFFFFF">
	<TABLE align="center"  width="450 px" height="25px">
		<tr align="left">
			<td><h3>Insert the required data in order to register to the site</h3></td>
		</tr>
		<TR align="Left">
			<td><h4>The values (*) are compulsory</h4></td>
		</TR>

		<tr><td><form action="RegisterServlet">
			<table bgcolor="#FFFFFF" border="1" width="450px" height="25px">


				<TR height="25px">
					<td width="235px"><b>Username*:</b></td>
					<td width="215px"><input type="text" name="user" required></td>
				</TR>

				<TR height="25px">
					<td width="235px"><b>Password*:</b></td>
					<td width="215px"><input type="password" name="pass" required></td>
				</TR>

				<TR height="25px">
					<TD width="235px"><b>Email*:</b></TD>
					<TD width="215px"><input type="text" name="email" required></TD>
				</TR>

				<TR height="25px">
					<TD width="235px"><b>www:</b></TD>
					<TD width="215px"><input type="text" name="www"></TD>
				</TR>

				<TR height="25px">
					<TD width="235px"><b>Date of birth (YYYY-MM-DD):</b></TD>
					<TD width="215px"><input type="text" name="date"></TD>
				</TR>

				<TR height="25px">
					<TD width="235px"><b>Description:</b></TD>
					<TD width="215px"><input type="text" name="des"></TD>
				</TR>

			


			<TR>
				<TD><input type="submit" name="Submit1" value="REGISTER!"style="width: 450px; height: 25px">
			</TR>
			

		</table></form></tr></td>

	</TABLE>

</body>
</html>