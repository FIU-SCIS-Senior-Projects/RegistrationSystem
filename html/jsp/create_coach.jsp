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
       
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String coachemail = request.getParameter("email");
        String schoolName = request.getParameter("schoolname");
        String password = request.getParameter("pw");
        String confpassword = request.getParameter("confpw");
       
        if(!password.equals(confpassword) {
            response.sendRedirect("../jsp/signup.jsp?valid=false");
        }
       
        String sql = "INSERT INTO coach (first_name,last_name, email, password, school_id, role) VALUES(?,?,?,?,?,?);";
        PreparedStatement pstat = con.prepareStatement(sql);
        pstat.setString(1, fName);
        pstat.setString(2, lName);
        pstat.setString(3, coachemail);
        pstat.setString(4, password);
        pstat.setInt(5, 1);
        pstat.setInt(6, 1);
        pstat.executeUpdate();
       
        response.sendRedirect("../../index.html");
    %>
</body>
</hmtl>
