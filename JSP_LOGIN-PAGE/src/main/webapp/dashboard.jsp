<%@page import="org.apache.catalina.User"%>
<%
HttpSession s1= request.getSession(false);
String p;
p=(String)s1.getAttribute("abc");
if(p==null || s1.getAttribute("abc")==null)
{

	response.sendRedirect("login.jsp");
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>
h5{
  font-family: sans-serif;
}
</style>
</head>
<body>
<%
 
Class.forName("com.mysql.cj.jdbc.Driver");
Connection com;
com=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
Statement st = com.createStatement();
String n = (String)session.getAttribute("abc");
ResultSet rs = st.executeQuery("select * from data where name='"+n+"'");
if(rs.next())
{
 %>
 <section >
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6 col-xl-4">
        <div class="card text-black">
          <i class="fab fa-apple fa-lg pt-3 pb-1 px-3"></i>
          <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/3.webp"
            class="card-img-top" alt="Apple Computer" />
          <div class="card-body">
            <div class="text-center">
            <center><h5>Welcome User</h5></center>
            </div>
            <br>
            <div>
              <div class="d-flex justify-content-evenly">
                
                <span><h5>Name is:</h5></span><span><h5><% out.println(rs.getString(2));%></h5></span>
              </div>
              <div class="d-flex justify-content-evenly">
                 <span><h5>Id is:</h5></span><span><h5><% out.println(rs.getString(1));%></h5></span>
              
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
 
   <%
}

%>
<a href="logout.jsp" class="btn btn-success">Logout</a>
<table border="1">

</table>
</body>
</html>