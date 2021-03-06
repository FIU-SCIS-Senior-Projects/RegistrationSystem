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
   <li><a href="coachHome.jsp">Home</a></li>
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
        
    <!--The editable table for participants-->
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
            <td><input type = "text" name = "fname<%=i%>" value ="<%=rs.getString("first_name")%>" required></td>
            <td><input type = "text" name = "lname<%=i%>" value ="<%=rs.getString("last_name")%>" required></td>
            <td><input type = "email" name = "email<%=i%>" value ="<%=rs.getString("email")%>" required></td>
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
    

<!--The table/form for adding a participant-->
<div id="table" style="padding-top:40px;">
<form action ="updateTeams.jsp">
    <fieldset style="display:inline">
    <legend>Add Participant:</legend>
    <table  align="center" border="0">
        <tr>
        </tr>
        <tr>
        <td style="background-color: #ffffff;"><input type = "text" name = "fname" placeholder="First Name" required></td>
        <td style="background-color: #ffffff;"><input type = "text" name = "lname" placeholder="Last Name" required></td>
        <td style="background-color: #ffffff;"><input type = "email" name = "email" placeholder="Email" required></td>
        <td style="background-color: #ffffff;"><select name ="tShirt">
                <option selected="selected" value = " "></option>
                <option type = "text" value = "XS">XS</option> 
                <option type = "text" value = "S">S</option>
                <option type = "text" value = "M">M</option>
                <option type = "text" value = "L">L</option>
                <option type = "text" value = "XL">XL</option>
                </select></td>
        <td style="background-color: #ffffff;"><input type="submit" name="submit" value="Add Participant"/></td>
        </tr>
        <input type="hidden" name="teamId" value="<%=teamID%>"/>
        <input type="hidden" name="tableSize" value="<%=0%>"/>
        
    </table>
    </fieldset>
</form>
</div>
        <% }
           catch(IllegalStateException e) {}
           %>
</body>
</html>

