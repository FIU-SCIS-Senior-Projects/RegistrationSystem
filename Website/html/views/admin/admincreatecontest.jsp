<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../../css/menustyles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="../../javascript/menuscript.js"></script>
   <title>Administrator Create Contest</title>
    
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
   <p style="color:black; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 72px">|</p>
   <a href="../../jsp/logout.jsp" id="logout" style="position: absolute; top: 0; right: 0; width: 4.5%; text-align: right; margin-right: 10px; margin-top: 18px">Log Out</a> 
</div>
    
<div id='contestcreate' >
    <%
    if (request.getParameter("datevalid") != null && request.getParameter("datevalid").equals("false"))
    {
    %>
    <div class="alert">
        Invalid date!
    </div>
    <% } %>
    <form id="CreateContestForm" action="../../jsp/createContest.jsp">
        <fieldset style="display:inline">
        <legend>Create a contest.</legend>
        Contest Name:<br>
        <input type="text" name="contestname" required><br>
        Location:<br>
        <input type="text" name="location" required><br>
        Date:<br>
        <input type="text" name="date" value="YYYY-MM-DD" onfocus="if (this.value=='YYYY-MM-DD') this.value='';" required><br>
        Time:<br>
        <input type="text" name="time" required><br>
        Description:<br>
        <textarea name="description" rows="5" cols="50" required></textarea><br>
        <input type="submit" value="Create">
        </fieldset>
    </form>
</div>

</body>
<html>