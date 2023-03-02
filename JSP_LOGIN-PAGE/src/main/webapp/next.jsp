<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String n,c,cp;
n=request.getParameter("name");
c=request.getParameter("pass");
cp=request.getParameter("cpass");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection com;
com=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
if(c.equals(cp))
{

	
	PreparedStatement ps = com.prepareStatement("insert into data(name,pass,cpass)values ('"+n+"','"+c+"','"+cp+"')");
	ps.executeUpdate();
	out.print("<script>window.alert('Register Successfull')</script>");
	out.println("<script>window.location.href='login.jsp'</script>");
}
else{
	response.sendRedirect("index.html");
}
%>
</body>
</html>