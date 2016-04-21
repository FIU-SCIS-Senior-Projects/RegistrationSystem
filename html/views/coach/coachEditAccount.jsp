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
   <li><a href="coachTeams.jsp">My Teams</a></li>
   <li><a href="coachAccount.jsp">My Profile</a></li>
   <li><a href="coachContest.jsp">Contests</a></li>
   <li><a href="coachVideo.jsp">Videos</a></li>
</ul>
</div>

<div id='upperbodytext'>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 85px"><%=session.getAttribute("user_email")%></p>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 72px">|</p>
    <a href="../../jsp/logout.jsp" id="logout" style="position: absolute; top: 0; right: 0; width: 4.5%; text-align: right; margin-right: 10px; margin-top: 18px">Log Out</a>
</div>
    
    <%
    try{
       
       
	String firstName = request.getParameter("fname");
	String lastName = request.getParameter("lname");
	String email = request.getParameter("email");	
	String oldEmail = email;
    %>

<form action="updateCoachAccount.jsp">
    <div style="text-align: center;">
        </br>
        First Name : <input type="text" name="fname" value="<%=firstName%>"></br></br>
        Last Name : <input type="text" name="lname" value="<%=lastName%>"></br></br>
        Email : <input type="text" name="email" value="<%=email%>"></br></br>
	   <input type="hidden" name="oldEmail" value="<%=oldEmail%>"/>
	   <input type="submit" name="submit" value="Save & Close">
	   <input type="submit" name="submit"  value="Cancel">
    </div>
    </form>
    <% 
       }
       catch(IllegalStateException e) {}
       
       
       %>
   </body> 
</html>
