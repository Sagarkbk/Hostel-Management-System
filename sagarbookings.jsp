<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
margin: 0;
font-family: Arial, Helvetica, sans-serif;
}

.topnav {
overflow: hidden;
background-color: #333;
}

.topnav a {
float: left;
color: #f2f2f2;
text-align: center;
padding: 14px 16px;
text-decoration: none;
font-size: 17px;
}

.topnav a:hover {
background-color: #ddd;
color: black;
}

.topnava.active {
background-color: #4CAF50;
color: white;
}
body {
  background-image: url('sagarbooking.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
</style>
</head>
<body>
<div class="topnav">
<a href="http://localhost:7036/SRKR/userrooms.jsp" target="_self"  class="active" >ROOMS</a>
<a href="http://localhost:7036/SRKR/sagarmybookings.jsp" target="_self" class="active" >MY BOOKINGS</a>
<a href="http://localhost:7036/SRKR/sagarlogout.jsp" target="_self" class="active" >LOGOUT</a>
</div>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
} 
catch (ClassNotFoundException e) 
{
e.printStackTrace();
}

try
{

String id=(String)session.getAttribute("roomid");  
String roomno =request.getParameter("roomno");
int a;
if(id .equals( "1"))
{
	a=6000;
}
else if(id .equals( "2"))
{
	a=5000;
}
else if(id .equals( "3"))
{
	a=4000;
}
else
{
        a=4500;
}
int s = a;

session.setAttribute("roomno", roomno); 
session.setAttribute("amount", s);  

String name=(String)session.getAttribute("user"); 

%>
<font color ="red">
<h1 >CONFIRM DETAILS</h1>
</font>
<font color ="OrangeRed">
<br>
<table border="1">
<tr ><th>USER NAME</th><th>ROOM ID</th><th>ROOM NO</th><th>AMOUNT</th></tr> 
<tr ><td><%= name %></td><td><%= id %></td><td><%= roomno %></td><td><%= s %></td></tr> 
</font>
<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement statement=connection.createStatement();
String sql1 = "create table "+ name +"(roomid varchar(25) , roomno varchar(100),amount int);";
statement.executeUpdate(sql1);
}
catch(Exception e)
{

}
finally
{%>
<center>
<form name="form1" method="post" action="http://localhost:7036/SRKR/sagarpayment.jsp" >
<input type="submit" value="CONFIRM and MAKE PAYMENT">
</form>
</center>
<%
}

%>

</body>
</html>