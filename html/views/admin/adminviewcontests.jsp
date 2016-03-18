<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../../css/menustyles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="../../javascript/menuscript.js"></script>
   <title>Admin View Contests</title>
   <%@ page import="java.sql.*" %> 
   <%@ page import="java.io.*" %>   
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
   
   String query = "SELECT * from contest;";
   ResultSet rs = stat.executeQuery(query);
   
   while (rs.next()) { %>
        <fieldset style="display:inline">
        <legend> <%= rs.getString("contest_name") %></legend>
        Location: <%= rs.getString("location") %> <br>
        Date: <%= rs.getString("date") %> <br>
        Time: <%= rs.getString("time") %> <br>
        Created By: <%= rs.getString("creator") %> <br>
        Description: <%= rs.getString("description") %> <br>
        </fieldset>
   <%}%>
</body>
<html>