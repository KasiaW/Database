<%@ page import="java.sql.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Informazioni utente salvate su file</title>
</head>
<body>
<h1>DATABASE PROJECT</h1>

<p>This are the information extracted from our database</p>

<table border="1">
<tr>
<th>ID</th>
<th>NAME</th>
<th>HIGH</th>
<th>DIFFICULTY</th>
</tr>

 <%  

Class.forName("org.postgresql.Driver"); 
  
	Connection connection = DriverManager.getConnection(
			"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
			"Phie5pia");
	
	
	Statement stmt = connection.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM point");
    

    while ( rs.next() ) {
        String point_id = rs.getString("point_id");
        String point_name = rs.getString("point_name");
        String elevation = rs.getString("elevation");
        String difficulty = rs.getString("difficulty");
        %>
        <tr>
<td><%=point_id%></td>
<td><%=point_name%></td>
<td><%=elevation%></td>
<td><%=difficulty%></td>
</tr>

 <%        
     }

    %>
  
    
 
  
  
  </table> 
  
  
<p>To insert some data click here.</p>

<form action="index.html" method="post">
  <input type="submit" value="Nuovo Inserimento" />
</form>

</body>
</html> 