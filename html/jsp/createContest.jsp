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
       
        String cName = request.getParameter("contestname");
        String loc = request.getParameter("location");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String desc = request.getParameter("description");
       
        try {
            if ((date.contains("Y") || date.contains("D") || date.contains("M")) || (!date.contains("-")))
            {
                response.sendRedirect("../views/admin/admincreatecontest.jsp?datevalid=false");
            }
            else
            {
                String query = "INSERT INTO contest (contest_name, location, date, time, creator, description) VALUES (?,?,?,?,?,?);";
                PreparedStatement pstat = con.prepareStatement(query);
                pstat.setString(1, cName);
                pstat.setString(1, loc);
                pstat.setString(1, date);
                pstat.setString(1, time);
                pstat.setString(1, session.getAttribute("user_email"));
                pstat.setString(1, description);
                pstat.executeUpdate();
                
                response.sendRedirect("../views/admin/adminviewcontests.jsp");
            }
        } 
        catch (IllegalStateException e) {}
    %>
</body>
</hmtl>
