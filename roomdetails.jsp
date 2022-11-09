<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
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
<a href="http://localhost:7036/SRKR/adminrooms.jsp" target="_self"  class="active" >ROOMS</a>
<a href="http://localhost:7036/SRKR/roomdetails.jsp" target="_self" class="active" >HOSTEL ROOM DETAILS</a>
<a href="http://localhost:7036/SRKR/sagaradminpayments.jsp" target="_self" class="active" >PAYMENTS</a>
<a href="http://localhost:7036/SRKR/sagarlogout.jsp" target="_self" class="active" >LOGOUT</a>
</div>
<font color ="red">
<h1 >ROOMS DETAILS</h1>
</font>
<center>
<font color ="cornsilk">

<h2> AVAILABLE ROOMS </h2>
<table border="1">
<tr ><th>ROOMID</th><th>ROOM NUMBER</th></tr> 
<style>
body {
  background-image: url('sagarroom.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

<%
try{
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement stmt=con.createStatement();
ResultSet rs1 = stmt.executeQuery("select roomid,  roomno from rooms");
while(rs1.next()){
%>

<tr>
<td ><%=rs1.getInt("roomid") %></td>
<td ><%=rs1.getInt("roomno") %></td>
</tr>

<%


}

con.close();
} catch (Exception e) {
e.printStackTrace();
}

%>
</font>
</table>
<form method="post" action="addroom.html">
<input type="submit" value="Add ROOM">
</form>
</center>

<strong>
NOTE:</strong>
<br>
ROOM ID 1 ---> single bed room
<br>
ROOM ID 2 ---> double bed room
<br>
ROOM ID 3 ---> triple bed room
<br>
ROOM ID 4 ---> quad bed room
</p>
<center>
<h2> BOOKED ROOMS </h2>
</center>
<table border="1">
<tr ><th>ROOMID</th><th>ROOM NUMBER</th></tr> 
<%
try{
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement stmt=con.createStatement();
ResultSet rs2 = stmt.executeQuery("select roomid,  roomno from bookedrooms");
while(rs2.next()){
%>

<tr>
<td ><%=rs2.getInt("roomid") %></td>
<td ><%=rs2.getInt("roomno") %></td>
</tr>

<%

}

con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>



</font>
</body>
</html>