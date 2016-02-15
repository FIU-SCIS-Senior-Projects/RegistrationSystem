<html>
<head>
   <title>Register a new coach.</title>
</head>
<body>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*" %> 
        
    <%
        Class.forName("com.mysql.jdbc.Driver").newInstance ();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
        Statement stat = con.createStatement();
       
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String email = request.getParameter("email");
        String schoolName = request.getParameter("schoolname");
        String password = request.getParameter("pw");
       
        stat.executeUpdate("INSERT INTO coach VALUES( " + fName + ", '" + lName + "' , '" + email + "', '" + schoolName + "', '" + password + "', '1', '1');" );
    %>
</body>
</hmtl>
