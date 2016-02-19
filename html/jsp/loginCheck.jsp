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
        String pw = request.getParameter("password");
       
        try {
            String query = "SELECT EXISTS(SELECT 1 FROM coach WHERE email=? AND password=?);";
            PreparedStatement pstat = con.prepareStatement(query);
            pstat.setString(1, email);
            pstat.setString(2, pw);
            ResultSet results = pstat.execute();
        }
        catch (IllegalStateException e) {}
    %>
</body>
</hmtl>