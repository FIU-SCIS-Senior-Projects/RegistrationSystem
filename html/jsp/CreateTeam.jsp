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
    int coachID = 1;
   
    String query = "INSERT INTO team (coach_id, team_name) VALUES (?, ?)";
    PreparedStatement pStatement = con.prepareStatement(query);
    pStatement.setInt(1, coach);
    pStatement.setString(2, teamName);
	int rows = pStatement.executeUpdate();
	
%>
</body> 
</html>
