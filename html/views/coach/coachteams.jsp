<!doctype html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../../css/menustyles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="../../javascript/menuscript.js"></script>
   <title>My Teams</title>
    <style type="text/css">
    input {float: right; clear: both;}
    </style>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li><a href="homecoachlogin.html">Home</a></li>
   <li><a href="coachteams.html">My Teams</a></li>
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

<form action ="../../jsp/CreateTeam.jsp">
    <br>Create team<br/>
    
    <p align= "right">Team Name</p><input type="text" name="tname" ></input>
    <input type= "submit" value="Create Team">
</form>
    
    
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
    ResultSet rs = null;
    rs = stat.executeQuery("SELECT * FROM team");
%>
</br>
    <table border="1">
        <tr>
            <th>Team Name</th>
        </tr>
	<% while(rs.next()) {%>
            <tr>
                <td><%= rs.getString("team_name") %></td>
            </tr>
        <% } rs.close(); %>
    
</body>
<html>
