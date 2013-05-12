<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PeakList</title>
</head>
<body>

<table>
<tr>
	<td><%@ include file="index.jsp"%> </td>
	<td>	
	<p>Points list</p>
	
	
	
	<table border="1">
<tr>
<th>COUNTRY</th>
<th>POINT</th>

</tr>

 <%  

Class.forName("org.postgresql.Driver"); 
  
	Connection connection = DriverManager.getConnection(
			"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
			"Phie5pia");
	
	
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
	
	
	
	
	
	
	
	
	</td>
</tr>

</table>



</body>
</html>