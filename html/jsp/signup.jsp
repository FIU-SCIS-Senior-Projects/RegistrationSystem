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
       
<div id='cssmenu'>
<ul>
   <li><a href="../../../index.html">Home</a></li>
   <li><a href="guestcontests.html">Contests</a></li>
   <li><a href="guestvideos.html">Videos</a></li>
</ul>
</div>
    
<div id='toprighttext'>
   <a style=" color:#002D62; position: absolute; top: 0; right: 0; width: 4%; text-align: right; margin-right: 85px; margin-top: 18px" href="signin.html">Sign In</a>
   <p style=" color:black; position: absolute; top: 0; right: 0; width: 100%; text-align: right; margin-right: 72px">|</p>
   <a style=" color:#002D62; position: absolute; top: 0; right: 0; width: 4.5%; text-align: right; margin-right: 10px; margin-top: 18px" href="signup.html">Sign Up</a>
</div>


<!--
<div id='validationMessages'>
    <p id="firstNameValidation" style="position:absolute; top:0; right: 0; margin-top:230px; margin-right:400px; color:#e60000; display:none"><b>This field can't be empty.</b></p>
    <p id="lastNameValidation" style="position:absolute; top:0; right: 0; margin-top:277px; margin-right:400px; color:#e60000; display:none"><b>This field can't be empty.</b></p>
    <p id="emailValidation" style="position:absolute; top:0; right: 0; margin-top:325px; margin-right:400px; color:#e60000; display:none"><b>This field can't be empty.</b></p>
    <p id="schoolNameValidation" style="position:absolute; top:0; right: 0; margin-top:371px; margin-right:400px; color:#e60000; display:none"><b>This field can't be empty.</b></p>
    <p id="passwordValidationEmpty" style="position:absolute; top:0; right: 0; margin-top:418px; margin-right:400px; color:#e60000; display:none"><b>This field can't be empty.</b></p>
    <p id="passwordValidationNotMatching" style="position:absolute; top:0; right: 0; margin-top:418px; margin-right:400px; color:#e60000; display:none"><b>The values do not match</b></p>
    <p id="confPasswordValidationEmpty" style="position:absolute; top:0; right: 0; margin-top:465px; margin-right:400px; color:#e60000; display:none"><b>This field can't be empty.</b></p>
    <p id="confPasswordValidationNotMatching" style="position:absolute; top:0; right: 0; margin-top:465px; margin-right:400px; color:#e60000; display:none"><b>The values do not match.</b></p>
</div>
-->

    
<div id='successfulCreate'>
    <p id="successfulCreateMessage" style="position:absolute; top:0; right: 0; margin-top:530px; margin-right:570px; display:none">Account successfully created!</p>
</div>
    
<div id='registrationform'>
    <center>
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
        <form name="regform" action="create_coach.jsp"  style="margin-top: 85px">
            First Name:<br>
            <input type="text" name="fname" required><br>
            Last Name:<br>
            <input type="text" name="lname" required><br>
            Email:<br>
            <input type="text" name="email" required><br>
            School Name:<br>
            <input type="text" name="schoolname" required><br>
            Password:<br>
            <input type="text" name="pw" required><br>
            Confirm Password:<br>
            <input type="text" name="confpw" required><br>
            <input type="submit" value="Register">
          </form>
    </center>
</div>
    
</body>
<html>