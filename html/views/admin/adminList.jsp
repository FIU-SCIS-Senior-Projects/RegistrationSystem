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
   <title>Administrator List</title>
    
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
    
    String query = "SELECT first_name, last_name, email FROM administrator;";
    ResultSet rs = stat.executeQuery(query);
%>
    <form action="../../jsp/admindeleteadmin.jsp">
    <table border="0" style="padding-left:30px;">
    <tr>
	    <th>First Name</th>
	    <th>Last Name</th>
	    <th>Email</th>
        <th>School Name</th>
    </tr>
    <% int i=0;
    while(rs.next()) { %>
    <tr>
        <td><%=rs.getString("first_name")%></td>
        <td><%=rs.getString("last_name")%></td>
        <td><%=rs.getString("email")%></td>
        <td>
            <input type="hidden" name="email<%=i%>" value="<%=rs.getString("email")%>" >
            <input type="submit" name="submit" value="Remove Administrator <%=i+1%>"/>
        </td>
    <% i++; %>
    </tr>
    <% } %>
    </table>
    <input type="hidden" name="tableSize" value="<%=i%>" />
    </form>
</body>
<html>