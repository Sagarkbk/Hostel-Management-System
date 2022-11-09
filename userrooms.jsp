<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
.button-container form,
.button-container form div {
    display: inline;
}
</style>
</head>
<body>
<div class="topnav">
<a href="http://localhost:7036/SRKR/ROOMS.jsp" target="_self"  class="active" >ROOMS</a>
<a href="http://localhost:7036/SRKR/sagarmybookings.jsp" target="_self" class="active" >MY BOOKINGS</a>
<a href="http://localhost:7036/SRKR/sagarlogout.jsp" target="_self" class="active" >LOGOUT</a>
</div>
<style>
body {
  background-image: url('sagarbg.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

<h2 style="color:red;">ROOMS
</h2>
<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement statement=connection.createStatement();

String sql2 ="select roomimage , roomid from rooms group by roomid";
ResultSet resultSet2 = statement.executeQuery(sql2);
Integer i;
%>
<div class="button-container">
<%
while(resultSet2.next())
{ 
i= resultSet2.getInt("roomid");
String roomimage=resultSet2.getString("roomimage");
 
if(i==1)
{ %>
<form method="post" action="http://localhost:7036/SRKR/r1.jsp">
<input type="image" src="<%= roomimage %>" name="submit" width="669" height="300" alt="submit"/> 
</form>
<%
}
else if(i == 2)
{
 %>
<form method="post" action="http://localhost:7036/SRKR/r2.jsp">
<input type="image" src="<%= roomimage %>" name="submit" width="669" height="300" alt="submit"/> 
</form>
<%
}
else if(i == 3)
{
 %>
<form method="post" action="http://localhost:7036/SRKR/r3.jsp">
<input type="image" src="<%= roomimage %>" name="submit" width="669" height="300" alt="submit"/> 
</form>
<%
}
else 
{
 %>
<form method="post" action="http://localhost:7036/SRKR/r4.jsp">
<input type="image" src="<%= roomimage %>" name="submit" width="669" height="300" alt="submit"/> 
</form>
<%
}

}
%>


</div>
</body>
</html>

