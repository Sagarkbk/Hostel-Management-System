<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
  background-image: url('sagarpayment.jpg');
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
String name=(String)session.getAttribute("user"); 
String id=(String)session.getAttribute("roomid");
String roomno=(String)session.getAttribute("roomno");
Integer amount=(Integer)session.getAttribute("amount");
try
{

%>
<font color ="red">
<h1 >PAYMENT SLIP</h1>
</font>
<font color ="white">
<br>
<table border="1">
<tr ><th>USER NAME</th><th>ROOM ID</th><th>ROOM NO</th><th> AMOUNT</th></tr> 
<tr ><td><%= name %></td><td><%= id %></td><td><%= roomno %></td><td><%= amount %></td></tr> 

</font>
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement st=conn.createStatement();
int j=st.executeUpdate("insert into "+name+"(roomid, roomno, amount)values('"+id+"','"+roomno+"',"+amount+")");
int i=st.executeUpdate("insert into adminsagar(userid , roomid, roomno, amount)values('"+name+"','"+id+"','"+roomno+"',"+amount+")");
int k=st.executeUpdate("insert into bookedrooms( roomid , roomno)values('"+id+"','"+roomno+"')");
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
try
{

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
PreparedStatement stmt = conn.prepareStatement("delete from rooms where roomid = ? and roomno = ?");
stmt.setString(1,id);
stmt.setString(2,roomno);
int  p = stmt.executeUpdate();

}
catch(Exception e)
{

}

%>
<center>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
</center>
</body>
</html>