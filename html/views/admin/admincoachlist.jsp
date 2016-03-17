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
   <title>Administrator Coach List</title>
    
</head>
<body>

<div id='cssmenu'>
<ul>
   <li class='active'><a href="homeadminlogin.jsp">Home</a></li>
   <li class='has-sub'><a href='#'>Contests</a>
       <ul>
         <li><a href="adminviewcontests.jsp">Current Contests</a></li>
         <li><a href="admincreatecontest.jsp">Create Contest</a></li>
         <li><a href="adminprevcontests.jsp">Previous Contests</a></li>
       </ul>
   </li>
   <li class='has-sub'><a href="#">Participants</a>
       <ul>
         <li><a href="adminparticipants.jsp">Teams</a></li>
         <li><a href="admincoachlist.jsp">Coaches</a></li>
       </ul> 
   </li>
</ul>
</div>
       
<div id='toprighttext'>
   <p id="email" style="position: absolute; top: 0; right: 0; width: 4%; text-align: right; margin-right: 195px; margin-top: 18px"><%=session.getAttribute("user_email")%> </p>
   <p style="color:black; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 72px">|</p>
   <a href="../../jsp/logout.jsp" id="logout" style="position: absolute; top: 0; right: 0; width: 4.5%; text-align: right; margin-right: 10px; margin-top: 18px">Log Out</a> 
</div>

<%
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
    
    String query = "SELECT first_name, last_name, email, school_name FROM coach, school WHERE coach.school_id=school.school_id;";
    ResultSet rs = stat.executeQuery(query);
%>
    <table id="coachTable" border="0" style="padding-left:30px;">
    <h1 style="font-family:sans-serif;padding-left:30px;">List of coaches</h1>
    <tr>
        <th>Action</th>
	    <th>First Name</th>
	    <th>Last Name</th>
	    <th>Email</th>
        <th>School Name</th>
    </tr>
    <% while(rs.next()) { %>
    <tr>
        <td><input type="checkbox" id="action"></td>
        <td><%= rs.getString("first_name")%></td>
        <td><%= rs.getString("last_name")%></td>
        <td><%= rs.getString("email")%></td>
        <td><%= rs.getString("school_name")%></td>
    </tr>
    <% } %>
</body>
<html>