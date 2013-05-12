<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="My.css">
<title>PeakList</title>
</head>
<body>



<section>	

Points list <br><br>
<table border="1">
<tr>
<th>COUNTRY</th>
<th>POINT</th>

</tr>

 <%  

Class.forName("org.postgresql.Driver"); 
  
	Connection connection = DriverManager.getConnection(
			"jdbc:postgresql://localhost:5432/TheHighestPoints", "postgres",
			"glupiehaslo");
	
	
	Statement stmt = connection.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT state.state_name, point.point_name" +
	" FROM public.point,  public.state, public.proper_point" +
    " WHERE state.state_id = proper_point.p_state_id AND proper_point.p_point_id = point.point_id;"
    );
    

    while ( rs.next() ) {
        String point_name = rs.getString("state_name");
        String state_name = rs.getString("point_name");

        %>
        <tr>
<td><%=point_name%></td>
<td><%=state_name%></td>

</tr>

 <%        
     }

    %>
  
    
 
  
  
  </table> 
</section>	
	
<%@ include file="index.jsp"%>	




</body>
</html>