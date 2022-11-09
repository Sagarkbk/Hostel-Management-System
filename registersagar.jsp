<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("id");
String email=request.getParameter("email");
String password=request.getParameter("password");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy", "root", "Teja@4547");
Statement st=conn.createStatement();
int j=st.executeUpdate("insert into registersagar(userid , email , password)values('"+userid+"','"+email+"','"+password+"')");

if(j!=0)
{
response.sendRedirect("http://localhost:7036/SRKR/Loginsagarpage.html");
}
}
catch(Exception e)
{

%>
<script>
setTimeout(function(){ alert("Userid is duplicated"); }, 1);
</script>
<style>
body {
  background-image: url('wrong.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
<h1 style="color:red";>
    click on yes to go back to login page
</h1>
<center>
<form name="form1" method="post" action="http://localhost:7036/SRKR/Loginsagarpage.html" >
<input type="submit" value="yes">

</form>
</center>
<%
e.printStackTrace();
}
%>