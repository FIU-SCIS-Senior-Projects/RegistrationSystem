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
   <title>My Teams</title>
   <!--<style type="text/css">
        input {float: right; width: 200px; clear: both;}
        form {float: right; width: 100px;}
        DIV.table {display:table;}
        FORM.tr, DIV.tr{display:table-row;}
        SPAN.td{display:table-cell;}
    </style>-->
    <style>

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
      
   <br></br><input type="text" name="tname" placeholder="Team Name" ></input>
    <input type= "submit" value="Create Team">
</form>
    
    
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
    ResultSet rs = null;
    ResultSet rs1 = null;
    rs = stat.executeQuery("SELECT * FROM team");
    ArrayList teamNames = new ArrayList();
    ArrayList teamIds = new ArrayList();
    while (rs.next()){
	teamIds.add(rs.getString("team_id"));
	teamNames.add(rs.getString("team_name"));
	 } 
 %>

<% for(int i =0; i < teamNames.size(); i++) {

    rs1 = stat.executeQuery("SELECT distinct participant.first_name, participant.last_name, participant.email FROM participant, coach, team WHERE coach.coach_id = participant.coach_id and participant.team_id = '"+ teamIds.get(i) + "'");%>
    <table border="0">
    <form action="editteams.jsp">
    <input type="hidden" name="TeamId" value="<%=teamIds.get(i)%>"/>

	<h2><%= teamNames.get(i)%></h2> 
        <tr>
        <th>First Name</th>
	    <th>Last Name</th>
	    <th>Email</th>
	    <th>T-Shirt Size</th>
        </tr>
	<% while (rs1.next()) {%>
        <tr>
	    <td><%= rs1.getString("first_name")%></td>
	    <td><%= rs1.getString("last_name")%></td>
	    <td><%= rs1.getString("email") %></td>
	    <td>XL</td>
        </tr>
        <% }%>  
    <input type="submit" value="Edit Team"/>
    </form>
	<%}rs1.close();rs.close();%>
    
</body>
<html>
