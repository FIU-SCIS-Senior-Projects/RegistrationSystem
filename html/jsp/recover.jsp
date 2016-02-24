<html>
<head>
   <title>Login page</title>
</head>
<body>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*" %> 
        
    <%
        Class.forName("com.mysql.jdbc.Driver").newInstance ();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
       
        String email = request.getParameter("email");
       
        try {
            String query = "SELECT 1 FROM coach WHERE email=?;"
            PreparedStatement pstat = con.prepareStatement(query);
            pstat.setString(1, email);
            ResultSet rs = pstat.executeQuery();
       
            if (rs.isBeforeFirst())
            {
                
            }
            else
            {
                query = "SELECT 1 FROM administrator WHERE email=?;"
                pstat = con.prepareStatement(query);
                pstat.setString(1, email);
                rs = pstat.executeQuery();
                if (rs.isBeforeFirst())
                {
                
                }
                else
                {
                    response.sendRedirect("../views/guest/signup.html");
                }
            }
        } catch (IllegalStateException e) {}
    %>
</body>
</hmtl>