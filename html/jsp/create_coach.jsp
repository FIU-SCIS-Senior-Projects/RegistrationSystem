<html>
<head>
   <title>Register a new coach.</title>
</head>
<body>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*" %> 
        
    <%
        Connection con = null;
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String email = request.getParameter("email");
        String schoolName = request.getParameter("schoolname");
        String pw = request.getParameter("pw");
       
        String queryText = "INSERT INTO coach (first_name, last_name, email, password, school_id, role) VALUES ('"+fname+"','"+lname+"','"+email+"','"+pw+"','"+1+"','"+1+")";
        
        try 
        {
              Class.forName("com.mysql.jdbc.Driver").newInstance ();
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");

              Statement stat = con.createStatement();

              ResultSet rst = stat.executeQuery(queryText);

              rst.close();
              stat.close();
              con.close();
        } 
        catch (Exception e) 
	    {	
        	out.println("Unable to connect to database"+e);
	    }
        response.sendRedirect("../../index.html");
    %>
</body>
</hmtl>
