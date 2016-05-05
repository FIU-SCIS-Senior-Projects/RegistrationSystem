<html>
<head>
   <title>Create a new contest</title>
   <%@ page import="java.sql.*" %> 
   <%@ page import="java.io.*" %> 
</head>
<body>
<%
   Class.forName("com.mysql.jdbc.Driver").newInstance ();
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
   
   String contestName = request.getParameter("cName");
                                              
   String query = "UPDATE contest SET ACTIVE='n' WHERE contest_name=?";
   PreparedStatement pstat = con.prepareStatement(query);
   pstat.setString(1, contestName);
   pstat.executeUpdate();
   
   response.sendRedirect("../views/admin/adminviewcontests.jsp");
%>
</body>
</hmtl>