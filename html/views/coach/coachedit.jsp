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
   <title>Update Team</title>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li><a href="homecoachlogin.html">Home</a></li>
   <li><a href="coachteams.jsp">My Teams</a></li>
   <li><a href="coachprofile.html">My Profile</a></li>
   <li><a href="coachcontests.html">Contests</a></li>
   <li><a href="coachvideos.html">Videos</a></li>
</ul>
</div>

<div id='upperbodytext'>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 85px">coach@miamidade.gov</p>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 72px">|</p>
    <p style=" color:#002D62; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 10px">Log Out</p>
</div>
    
    <%
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
    ResultSet rs = null;
    String teamID = request.getParameter("teamId");
    String query = "SELECT * FROM participant WHERE team_id = ?";
    PreparedStatement pStatement = con.prepareStatement(query); 
    pStatement.setString(1, teamID.toString());
    rs = pStatement.executeQuery();
       
    %>
    
    <br>
    <div>
    <table align="center" border="0">
            <form action ="updateTeams.jsp">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>T-Shirt Size</th>
        </tr>
        <% int i = 0; 
           while (rs.next()) { 
                
           %>
        <tr>
            <td><input type = "text" name = "fname<%=i%>" value ="<%=rs.getString("first_name")%>"></td>
            <td><input type = "text" name = "lname<%=i%>" value ="<%=rs.getString("last_name")%>"></td>
            <td><input type = "text" name = "email<%=i%>" value ="<%=rs.getString("email")%>"></td>
            <td><select name ="tShirt<%=i%>">
                <option selected="selected" value = "<%=rs.getString("tshirt_size")%>"><%=rs.getString("tshirt_size")%></option>
                <option type = "text" value = "XS">XS</option> 
                <option type = "text" value = "S">S</option>
                <option type = "text" value = "M">M</option>
                <option type = "text" value = "L">L</option>
                <option type = "text" value = "XL">XL</option>
                </select></td>
            <td style="background-color: #ffffff;">
		<input type="hidden" name="oldEmail<%=i%>" value="<%=rs.getString("email")%>" />
		<input type="hidden" name="remove" value="<%=i%>" />
        <input type="hidden" name="teamId" value="<%=teamID%>"/>
                <input type="submit" name="submit" value="Remove Participant <%=i+1%>"/></td>
            <% i++;%>
        </tr>
             <% } %>
        </table>
            <input type="hidden" name="tableSize" value="<%=i%>" />
            <div style="text-align:center;">
                <div style="text-align:center">  
                    <input align="center" type="submit" name="submit" value ="Save & Close" />
                    <input align="center" type="submit" name="submit" value ="Cancel" />
                </div>  
            </form>
        </div>
    </div>
    
    <%
       String query1 = "SELECT first_name, last_name FROM participant WHERE team_id is ? and coach_id = 1";
       PreparedStatement pStatement1 = con.prepareStatement(query);
       pStatement1.setNull(1, java.sql.Types.INTEGER);
       ResultSet rs3 = pStatement1.executeQuery();
       
    %>
    
    <!--
    <form action ="">
        <input type="hidden" name="teamId" value="<%=teamID%>"/>
        <select name ="participant">
            <% while(rs3.next()){ %>
                <option><%= rs3.getString("first_name")%> <%= rs3.getString("last _name")%>
            <% } %>
            
        </select>
        <input type="submit" name="submit" value="Add Member"/>
    </form>
-->
<form action ="updateTeams.jsp">     
    <table border="0">
        <tr>
        </tr>
        <tr>
        <td style="background-color: #ffffff;"><input type = "text" name = "fname" placeholder="First Name"></td>
        <td style="background-color: #ffffff;"><input type = "text" name = "lname" placeholder="Last Name"></td>
        <td style="background-color: #ffffff;"><input type = "text" name = "email" placeholder="Email"></td>
        <td style="background-color: #ffffff;"><select name ="tShirt">
                <option type = "text" value = "XS">XS</option> 
                <option type = "text" value = "S">S</option>
                <option type = "text" value = "M">M</option>
                <option type = "text" value = "L">L</option>
                <option type = "text" value = "XL">XL</option>
                </select></td>
        </tr>
    </table>
     <input type="hidden" name="teamId" value="<%=teamID%>"/>
     <input type="submit" name="submit" value="Add Participant"/></td>
</form>

