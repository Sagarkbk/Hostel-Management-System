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
        
        <title>delete an trailer </title>
    </head>
    <body>
         <%
int roomno=Integer.parseInt(request.getParameter("roomno"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
PreparedStatement st = conn.prepareStatement("delete from rooms where roomid = ? ,roomno = ?");
String rid=(String)session.getAttribute("roomid");
int roomid = Integer.parseInt(request.getParameter("rid"));
st.setInt(1,roomid);
st.setInt(2,roomno);
session.setAttribute("roomno", roomno);
int  j = st.executeUpdate();
response.sendRedirect("http://localhost:7036/SRKR/sagarpayment.jsp");
}
catch(Exception ex)
{

}
%>
</center>
    </body>
</html>