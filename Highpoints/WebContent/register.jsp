<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="jquery-ui.min.css" />
<script src="jquery-1.9.1.min.js"></script>
<script src="jquery-ui.js"></script>
<link rel="stylesheet" href="My.css" />

<script>
$(function() {
$( "#date" ).datepicker();
}); 

</script>

<title>Registration page</title>
</head>
<body background="prova.jpg" bgcolor="#FFFFFF">
	<div style="margin:auto; width:50%" >
		<h3>Insert the required data in order to register to the site</h3>
		
			<h4>The values (*) are compulsory</h4>
		<form action="RegisterServlet">
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
					<TD width="215px"><input type="text" name="date" id="date"></TD>
				</TR>

				<TR height="25px">
					<TD width="235px"><b>Description:</b></TD>
					<TD width="215px"><input type="text" name="des"></TD>
				</TR>

			


			<TR>
				<TD colspan="2"><button>REGISTER</button>
			</TR>
			
			
			
		
			

		
	
		</table></form>
	
	<a href="index.jsp"><button style="width: 450px; height: 25px">RETURN TO THE LOGIN PAGE</button></a>
	</div>





</body>
</html>