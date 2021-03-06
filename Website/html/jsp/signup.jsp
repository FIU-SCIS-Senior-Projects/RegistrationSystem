<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../css/menustyles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="../javascript/menuscript.js"></script>
   <title>Registration Page</title>
</head>
<body>

<!-- Menu setup -->
<div id='cssmenu'>
<ul>
   <li><a href="../../../index.html">Home</a></li>
   <li><a href="guestcontests.html">Contests</a></li>
   <li><a href="guestvideos.html">Videos</a></li>
</ul>
</div>
    
<!-- Set up of the top right links -->    
<div id='toprighttext'>
   <a style=" color:#002D62; position: absolute; top: 0; right: 0; width: 4%; text-align: right; margin-right: 85px; margin-top: 18px" href="signin.html">Sign In</a>
   <p style=" color:black; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 72px">|</p>
   <a style=" color:#002D62; position: absolute; top: 0; right: 0; width: 4.5%; text-align: right; margin-right: 10px; margin-top: 18px" href="signup.html">Sign Up</a>
</div>

<!-- Display this message on successful account create -->    
<div id='successfulCreate'>
    <p id="successfulCreateMessage" style="position:absolute; top:0; right: 0; margin-top:530px; margin-right:570px; display:none">Account successfully created!</p>
</div>

<!-- Validation messages for email and passwords
Registration form-->    
<div id='registrationform'>
    <center>
        <%
           if (request.getParameter("pwvalid") != null && request.getParameter("pwvalid").equals("false"))
           {
        %>
        <div class="alert">
            Your passwords do not match.
        </div>
        <% } %>
        <%
           if (request.getParameter("emailvalid") != null && request.getParameter("emailvalid").equals("false"))
           {
        %>
        <div class="alert">
            Invalid email.
        </div>
        <% } %>
        <%
           if (request.getParameter("pwlength") != null && request.getParameter("pwlength").equals("false"))
           {
        %>
        <div class="alert">
            The password must be at least 6 characters long.
        </div>
        <% } %>
        <%
           if (request.getParameter("coachvalid") != null && request.getParameter("coachvalid").equals("false"))
           {
        %>
        <div class="alert">
            A coach account already exists with the email.
        </div>
        <% } %>
        <%
           if (request.getParameter("adminvalid") != null && request.getParameter("adminvalid").equals("false"))
           {
        %>
        <div class="alert">
            An admin account already exists with the email.
        </div>
        <% } %>
        <%
           if (request.getParameter("exists") != null && request.getParameter("exists").equals("true"))
           {
        %>
        <div class="alert">
            This school already has a coach, called <%=request.getParameter("coachName")%>.
        </div>
        <% } %>
        <form id="regform" action="create_coach.jsp"  style="margin-top: 85px">
            <fieldset style="display:inline">
            <legend>Register here:</legend>
            First Name:<br>
            <input type="text" name="fname" required><br>
            Last Name:<br>
            <input type="text" name="lname" required><br>
            Email:<br>
            <input type="text" name="email" required><br>
            School Name:<br>
            <input type="text" name="schoolname" required><br>
            Password:<br>
            <input type="password" name="pw" required><br>
            Confirm Password:<br>
            <input type="password" name="confpw" required><br>
            <input type="submit" value="Register">
            </fieldset>
          </form>
    </center>
</div>
    
</body>
<html>