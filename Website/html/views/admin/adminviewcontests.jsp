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
       
<script>
function storeContest(str)
{
    document.location.href = "../../jsp/storeContest?contestname=" + str;
}
</script>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li><a href="adminHome.jsp">Home</a></li>
   <li class='has-sub'><a href='#'>Contests</a>
       <ul>
         <li><a href="adminviewcontests.jsp">Current Contests</a></li>
         <li><a href="admincreatecontest.jsp">Create Contest</a></li>
         <li><a href="adminprevcontests.jsp">Previous Contests</a></li>
       </ul>
   </li>
   <li class='has-sub'><a href="#">Participants</a>
       <ul>
         <li><a href="adminViewsParticipants.jsp">Teams</a></li>
         <li><a href="admincoachlist.jsp">Schools</a></li>
         <li><a href="adminViewsAdmins.jsp">Administrators</a></li>
       </ul> 
   </li>
   <li><a href="admincreateadmin.jsp">Create Admin</a></li>
</ul>
</div>
    
<div id='toprighttext'>
   <p id="email" style="position: absolute; top: 0; right: 0; width: 4%; text-align: right; margin-right: 195px; margin-top: 18px"><%=session.getAttribute("user_email")%> </p>
   <p style="color:black; position: absolute; top: 0; right: 0; width: 3%; text-align: right; margin-right: 72px">|</p>
   <a href="../../jsp/logout.jsp" id="logout" style="position: absolute; top: 0; right: 0; width: 4.5%; text-align: right; margin-right: 10px; margin-top: 18px">Log Out</a> 
</div>
   
<%
   Class.forName("com.mysql.jdbc.Driver").newInstance ();
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
   Statement stat = con.createStatement();
   String storeQuery = "UPDATE contest SET active='n' WHERE contest_name=?;";
   PreparedStatement pstat = con.prepareStatement(storeQuery);
   
   String query = "SELECT * FROM contest WHERE active='y';";
   ResultSet rs = stat.executeQuery(query);
   
   while (rs.next()) { %>
        <form action="../../jsp/storeContest.jsp" onsubmit="return confirm('Are you sure you want to archive?');">
        <fieldset style="display:inline">
        <legend> <%= rs.getString("contest_name") %></legend>
        Location: <%=rs.getString("location")%> <br>
        Date: <%= rs.getString("date") %> <br>
        Time: <%= rs.getString("time") %> <br>
        Created By: <%= rs.getString("creator") %> <br>
        Description: <%= rs.getString("description") %> <br>
        Participants: <br>
        <input type="hidden" name="cName" value="<%= rs.getString("contest_name")%>">
        <input type="submit" value="Archive">
        </fieldset>
        </form>
   <%}%>
</body>
<html>