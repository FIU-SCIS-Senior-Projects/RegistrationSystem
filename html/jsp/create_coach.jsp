<html>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Register a new coach.</title>
</head>
<body>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
    <%@ page import="java.sql.*" %>
        
    <%
        Connection con = null;
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String email = request.getParameter("email");
        String schoolName = request.getParameter("schoolname");
        String pw = request.getParameter("password");
       
        String queryText = "insert into user_details (\"firstName\", \"lastName\",\"emailAddress\", \"schoolName\", \"password\")values('"+fName+"','"+lName+"','"+email+"','"+ schoolName+"','"+pw+"')";
        
        try 
        {
              Class.forName("com.mysql.jdbc.Driver").newInstance ();
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","EWdev");

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

        response.sendRedirect("success.htm");
    %>
</body>
</hmtl>
