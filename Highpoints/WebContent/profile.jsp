<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "engine.Core" %>
<%@ page import = "domain.Member" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
String login = request.getParameter("user_login");
Member m = Core.getDB().getMember(login);
%>
</head>
<body>


<section>
Profile
</section>
<%@ include file="menu.jsp"%>


</body>
</html>