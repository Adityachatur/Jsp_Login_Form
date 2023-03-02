
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
String uname,upass;
uname=request.getParameter("user");
upass=request.getParameter("pass");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection com;
com=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");

Statement st = com.createStatement();
ResultSet rs = st.executeQuery("select * from data where name='"+uname+"' and pass='"+upass+"'");
if(rs.next())
{
	HttpSession s1 = request.getSession();
	s1.setAttribute("abc", uname);
	s1.setAttribute("pass", upass);
   response.sendRedirect("dashboard.jsp");	
}
else
{
	
  out.println("<script>window.alert('Username or Password wrong')</script>");
  out.println("<script>window.location.href='login.jsp'</script>");
}

%>

</body>
</html>