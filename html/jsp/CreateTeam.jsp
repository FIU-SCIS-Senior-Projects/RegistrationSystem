<html>    
<head> 
<title>Creating a team</title>
</head>
    
<body>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*" %> 
   
    <%
        Class.forName("com.mysql.jdbc.Driver").newInstance ();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
        Statement stat = con.createStatement();
        
        String teamName = request.getParameter("tname");
	if(teamName!= ""){
        stat.executeUpdate("insert into team (coach_id, team_name) VALUES (1, '" + teamName + "');");
	response.sendRedirect("../views/coach/coachteams.jsp");
	}
	
    %>
</body> 
</html>
