<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../../css/menustyles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="../../javascript/menuscript.js"></script>
   <title>Create an administrator</title>
    
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
    
<div id='registrationform'>
        <%
           if (request.getParameter("pwvalid") != null && request.getParameter("pwvalid").equals("false"))
           {
        %>
        <div class="alert">
            Your passwords do not match!
        </div>
        <% } %>
        <%
           if (request.getParameter("emailvalid") != null && request.getParameter("emailvalid").equals("false"))
           {
        %>
        <div class="alert">
            Invalid email!
        </div>
        <% } %>
        <form id="regform" action="create_coach.jsp"  style="margin-top: 85px">
            <fieldset style="display:inline">
            <legend>Create a new administrator:</legend>
            First Name:<br>
            <input type="text" name="fname" required><br>
            Last Name:<br>
            <input type="text" name="lname" required><br>
            Email:<br>
            <input type="text" name="email" required><br>
            Password:<br>
            <input type="password" name="pw" required><br>
            Confirm Password:<br>
            <input type="password" name="confpw" required><br>
            <input type="submit" value="Create">
            </fieldset>
          </form>
</div>

</body>
<html>