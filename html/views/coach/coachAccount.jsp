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
   <li><a href="coachHome.jsp">Home</a></li>
   <li><a href="coachteams.jsp">My Teams</a></li>
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
    int coach_id = 1;
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
    String query = "SELECT * FROM coach WHERE coach_id = ?";
    PreparedStatement pStatement = con.prepareStatement(query); 
    pStatement.setInt(1, coach_id);
    ResultSet rs = pStatement.executeQuery();
    String firstName;
    String lastName;
    String email;
    
    while(rs.next())
    {
        firstName = rs.getString("first_name");
        lastName = rs.getString("last_name");
        email = rs.getString("email");
    %>
    
    <form action="coachEditAccount.jsp">   
    <div style="text-align: center;">
         <p>First Name: <%=firstName%></p>
         <p>Last Name: <%=lastName%></p>
         <p>Email: <%=email%></p>
	 <input type="hidden" name="fname" value="<%=firstName%>"/>
	 <input type="hidden" name="lname" value="<%=lastName%>"/>
	 <input type="hidden" name="email" value="<%=email%>"/>
         <input type="submit" value="Edit Account"/>
    </div>
        <% } rs.close(); %>
   </form>
   </body> 
</html>
