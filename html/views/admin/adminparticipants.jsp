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
   <li><a href="homeadminlogin.html">Home</a></li>
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
    ArrayList coachIds = new ArrayList();
   
    String query = "SELECT school_name, coach_id FROM school;";
    PreparedStatement pstat = con.prepareStatement(query);
    ResultSet rs = pstat.executeQuery(); 
   
    while (rs.next())
    {
	   coachIds.add(rs.getString("coach_id"));
	   schoolNames.add(rs.getString("school_name"));
    }   
%>
    
<ol>
      <% for(int i =0; i < schoolNames.size(); i++) { %>
        <li><%=schoolNames.get(i) %></li>
      <% } %>
</ol>
    


</body>
<html>