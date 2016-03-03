<!doctype html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../../css/menustyles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="../../javascript/menuscript.js"></script>
   <title>Account Information</title>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li><a href="homecoachlogin.html">Home</a></li>
   <li><a href="coachteams.jsp">My Teams</a></li>
   <li><a href="coachprofile.html">My Profile</a></li>
   <li><a href="coachcontests.html">Contests</a></li>
   <li><a href="coachvideos.html">Videos</a></li>
</ul>
</div>

<div id='upperbodytext'>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 85px">coach@miamidade.gov</p>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 72px">|</p>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 10px">Log Out</p>
</div>
    
    <%
    int coach_id = 1;
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
    String query = "SELECT * FROM coach WHERE coach_id = ?";
    PreparedStatement pStatement = con.prepareStatement(query); 
    pStatement.setInt(1, coach_id);
    ResultSet rs = pStatement.executeQuery();
    
    while(rs.next())
    {
        String firstName = rs.getString("first_name");
        String lastName = rs.getString("last_name");
        String email = rs.getString("email");
    }  
    %>
    
    <div style="text-align: center;">
        <% firstName  lastName email %> 
        
    </div>
    