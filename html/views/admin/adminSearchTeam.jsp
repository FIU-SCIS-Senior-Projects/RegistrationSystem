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
   <script src="../../javascript/SearchFunction.js"></script>
   <title>Participants</title>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li><a href="homeadminlogin.jsp">Home</a></li>
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
         <li><a href="adminList.jsp">Administrators</a></li>
       </ul> 
   </li>
   <li><a href="admincreateadmin.jsp">Create Admin</a></li>
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
   
    ResultSet rs = null;
    ResultSet rs1 = null;
    String query;
    PreparedStatement pStatement1;

       
    String schoolName = request.getParameter("schoolName");
    query = "SELECT first_name, last_name, school_name, coach.coach_id FROM school, coach WHERE school.coach_id=coach.coach_id and school_name like ? ";
    PreparedStatement pStatement = con.prepareStatement(query);
    pStatement.setString(1, schoolName);
    rs = pStatement.executeQuery();
       
    ArrayList coachFNames = new ArrayList();
    ArrayList coachLNames = new ArrayList();
    ArrayList schoolNames = new ArrayList();
    ArrayList coachIds = new ArrayList();
    
   
    while (rs.next()){
       coachFNames.add(rs.getString("first_name"));
       coachLNames.add(rs.getString("last_name"));
       schoolNames.add(rs.getString("school_name"));
       coachIds.add(rs.getString("coach_id"));
       out.print(rs.getString("coach_id"));
    } 
       out.print(coachIds.getSize());
       rs.close();
 %>
        
<% for(int i =0; i < coachFNames.size(); i++) {
    query = "SELECT participant.first_name, participant.last_name, participant.email, participant.tshirt_size, team.team_name From participant, team where participant.coach_id = ? and participant.team_id = team.team_id";
    pStatement1 = con.prepareStatement(query);
    
    pStatement1.setInt(1, (Integer)coachIds.get(i));
    
    rs1 = pStatement1.executeQuery();
    
    %>
    
   

    <table border="0" style="padding-left:30px;">
	<h2 style="font-family:sans-serif;padding-left:30px;"><%= schoolNames.get(i) + " - Coach: " + coachFNames.get(i) + " " + coachLNames.get(i)%></h2>
        <tr>
        <th>First Name</th>
	    <th>Last Name</th>
	    <th>Email</th>
	    <th>T-Shirt Size</th>
        <th>Team Name</th>
        </tr>
	<% while (rs1.next()) {%>
        <tr>
	    <td><%= rs1.getString("first_name")%></td>
	    <td><%= rs1.getString("last_name")%></td>
	    <td><%= rs1.getString("email") %></td>
	    <td><%= rs1.getString("tshirt_size") %></td>
        <td><%= rs1.getString("team_name") %></td>
        </tr>
        
        <% }%> 
	<%}%>
    
    </body>
              
<html>