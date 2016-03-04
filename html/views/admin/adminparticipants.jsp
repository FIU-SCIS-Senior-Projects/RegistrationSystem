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
   <title>Participants</title>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li><a href="homeadminlogin.jsp">Home</a></li>
   <li><a href='#'>Contests</a></li>
   <li><a href="adminparticipants.jsp">Participants</a></li>
   <li><a href='#'>Videos</a></li>
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
   
    ArrayList schoolNames = new ArrayList();
    ArrayList coachFNames = new ArrayList();
    ArrayList coachLNames = new ArrayList();
    ArrayList coachIds = new ArrayList();
    ResultSet rs1 = null;
   
    String query = "SELECT school_name, school.coach_id, first_name, last_name FROM school, coach WHERE school.coach_id <> 0 and school.coach_id = coach.coach_id;";
    PreparedStatement pstat = con.prepareStatement(query);
    ResultSet rs = pstat.executeQuery(); 
   
    while (rs.next())
    {
       coachFNames.add(rs.getString("first_name"));
       coachLNames.add(rs.getString("last_name"));
	   coachIds.add(rs.getString("school.coach_id"));
	   schoolNames.add(rs.getString("school_name"));
    }   
%>
    
<% for(int i =0; i < schoolNames.size(); i++) { %>
    <h1><%= schoolNames.get(i) + "- Coach: " + coachFNames.get(i) + " " + coachLNames.get(i)%></h1>    
    <% 
       query = "SELECT team_id, team_name FROM team WHERE coach_id=?";
       pstat = con.prepareStatement(query);
       pstat.setStringt(1, coachIds.get(i).toString);
       rs = pstat.executeQuery();
       
       ArrayList teamNames = new ArrayList();
       ArrayList teamIds = new ArrayList();
       while (rs.next())
       {
            teamNames.add(rs.getString("team_name"));
            teamIds.add(rs.getString("team_id"));
       }
       for(int j =0; i < teamNames.size(); i++) {
            query = "SELECT DISTINCT participant.first_name, participant.last_name, participant.email, participant.tshirt_size FROM participant, team WHERE participant.team_id = ?";
            pstat = con.prepareStatement(query);
            pstat.setString(1, teamIds.get(i).toString());  %>
            rs1 = pstat.executeQuery();
            
            <table border="0" style="padding-left:30px;">
	        <h2 style="font-family:sans-serif;padding-left:30px;"><%= teamNames.get(i)%></h2> 
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
	           <td><%= rs1.getString("tshirt_size") %></td>
            </tr>
            <% }%> 
	<%}rs1.close();rs.close();%>
 <% } %>   

</body>
<html>