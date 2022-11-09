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
<body>
<%

int romid=Integer.parseInt(request.getParameter("romid"));
String romimg=request.getParameter("romimg");
int romno=Integer.parseInt(request.getParameter("romno"));
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
PreparedStatement st = conn.prepareStatement("insert into rooms( roomid, roomimage, roomno) " + "values(?,?,?)");
st.setInt(1,romid);
st.setString(2, romimg);
st.setInt(3,romno);
int  j = st.executeUpdate();
if((j!=0))
{
response.sendRedirect("http://localhost:7036/SRKR/roomdetails.jsp");
}
}
catch(Exception ex)
{
%>
<script>
setTimeout(function(){ alert("something went wrong please check"); }, 1);
</script>
<style>
body {
  background-image: url('addroomimg.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
<h1 style="color:red";>
    click on yes to go back to room details page or no to logout
</h1>
<center>
<form name="form1" method="post" action="http://localhost:7036/SRKR/adminmovies.jsp" >
<input type="submit" value="yes">
</form>
<form name="form1" method="post" action="http://localhost:7036/SRKR/logout.jsp" >
<input type="submit" value="no">
</form>
</center>



<%

ex.printStackTrace();
}

%>
   </body>
</html>