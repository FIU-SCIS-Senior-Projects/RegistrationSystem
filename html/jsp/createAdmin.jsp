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
       
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String adminemail = request.getParameter("email");
        String password = request.getParameter("pw");
        String confpassword = request.getParameter("confpw");
       
        try {
            if (password.equals(confpassword) && (coachemail.contains("@") && (coachemail.contains(".edu") || coachemail.contains(".com"))))
            {
                String sql = "INSERT INTO administrator (first_name,last_name, email, password, role) VALUES(?,?,?,?,?);";
                PreparedStatement pstat = con.prepareStatement(sql);
                pstat.setString(1, fName);
                pstat.setString(2, lName);
                pstat.setString(3, adminemail);
                pstat.setString(4, password);
                pstat.setInt(5, 2);
                pstat.executeUpdate();

                response.sendRedirect("../views/admin/homeadminlogin.jsp");
            }
            else if (!password.equals(confpassword))
            {
                response.sendRedirect("../views/admin/admincreateadmin.jsp?pwvalid=false");
            }
            else
            {
                response.sendRedirect("../views/admin/admincreateadmin.jsp?emailvalid=false");
            }
        }
        catch (IllegalStateException e) {}
    %>
</body>
</hmtl>