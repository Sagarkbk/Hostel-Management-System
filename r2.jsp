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
</style>
</head>
<body>
<div class="topnav">
<a href="http://localhost:7036/SRKR/userrooms.jsp" target="_self"  class="active" >ROOMS</a>
<a href="http://localhost:7036/SRKR/sagarmybookings.jsp" target="_self" class="active" >MY BOOKINGS</a>
<a href="http://localhost:7036/SRKR/sagarlogout.jsp" target="_self" class="active" >LOGOUT</a>
</div>
<style>
body {
  background-image: url('image.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement statement=connection.createStatement();
String sql ="select roomimage , roomno from rooms where roomid = 2";
ResultSet resultSet = statement.executeQuery(sql);
%>
<form name="form1" method="post" action="http://localhost:7036/SRKR/sagarbookings.jsp" >
<h1 style="color:red;"> ROOM DETAILS
</h1>
<center>
<input type="image" src="room2.jpg" name="submit" width="669" height="300" /> 
</center>
<br>
<h2 style="color:red;" > Room Type : Double Bed Room
<br>
<h2 style="color:red;" > Room Capacity : 2
<br>
<h2 style="color:red;"> Available Rooms no :
</h2> 
<%
int i=0;
while(resultSet.next())
{

String roomimage = resultSet.getString("roomimage");
String roomno=resultSet.getString("roomno");
String roomid = "2" ;
i++;
session.setAttribute("roomid", roomid); 
%>
<h2><input type="radio" id="" name="roomno" value="<%= roomno %>"/>
<label style="color:coral;" for="<%= i %>"><%= roomno %></label></h2>
<%
}
%>
<br>
<br>
<br>
<center>
<input type="submit" value="Book">
</center>
</form>
</body>
</html>