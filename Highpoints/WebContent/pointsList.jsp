<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import = "engine.DB" %>
  <%@ page import = "engine.Core" %>
  <%@ page import = "domain.State" %>
<%@ page import = "domain.Point" %>
 <%@ page import="java.util.List"%>
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
<th>ALTERNATIVE POINTS</th>

</tr>


  
    
 
  
  

   <%List<State> states = Core.getDB().getStatesList();
  for (State s: states){
	  Point p = Core.getDB().getPoint(s.getPropPoint());
  %>
  <tr><td><%=s.getName()%></td>
 
  		
  
  </tr> 
  
  <%} %> 
  
  </table>
  
</section>	

<%@ include file="menu.jsp"%>	




</body>
</html>