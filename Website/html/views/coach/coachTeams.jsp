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

    <style>

</style>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li><a href="coachHome.jsp">Home</a></li>
   <li><a href="coachTeams.jsp">My Teams</a></li>
   <li><a href="coachAccount.jsp">My Profile</a></li>
</ul>
</div>

<div id='upperbodytext'>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 85px"><%=session.getAttribute("user_email")%></p>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 72px">|</p>
    <a href="../../jsp/logout.jsp" id="logout" style="position: absolute; top: 0; right: 0; width: 4.5%; text-align: right; margin-right: 10px; margin-top: 18px">Log Out</a>
</div>

<form action ="../../jsp/CreateTeam.jsp" style="padding-left:30px;">
      
   <br></br><input type="text" name="tname" placeholder="Team Name" style="width: 200px; height: 15px" required></input>
    <input type= "submit" value="Create Team">
</form>
    
    
<%
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
   
    ResultSet rs = null;
    ResultSet rs1 = null;
    int coachID = (int)session.getAttribute("user_id");
    String query;
    query = "SELECT * FROM team where coach_id = " + coachID;
    rs = stat.executeQuery(query);
    ArrayList teamNames = new ArrayList();
    ArrayList teamIds = new ArrayList();
    PreparedStatement pStatement = null;
   
    while (rs.next()){
	teamIds.add(rs.getString("team_id"));
	teamNames.add(rs.getString("team_name"));
	 } 
 %>

<% for(int i =0; i < teamNames.size(); i++) {
    
    query = "SELECT DISTINCT participant.first_name, participant.last_name, participant.email, participant.tshirt_size FROM participant, coach, team WHERE coach.coach_id = participant.coach_id and participant.team_id = ?";
    pStatement = con.prepareStatement(query);
    
    pStatement.setString(1, teamIds.get(i).toString());
    
    rs1 = pStatement.executeQuery();
    
    %>
   
    
    <table border="0" style="padding-left:30px;">
    <form action="coachEditTeam.jsp">
    <input type="hidden" name="teamId" value="<%=teamIds.get(i)%>"/>

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
            <div style="padding-left:30px;"> 
                <input align="center" type="submit" value="Edit Team"/>
            </div>
    </form>
	<%}rs1.close();rs.close();
                               
    }
    catch(IllegalStateException e) {}
    catch(NullPointerException n)  {}%>
    
</body>
<html>
