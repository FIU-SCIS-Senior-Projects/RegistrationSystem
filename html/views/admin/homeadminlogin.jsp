<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../../css/menustyles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="../../javascript/menuscript.js"></script>
   <title>Administrator Homepage</title>
    
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

<div id="info">
<h2 style ="color:#002D62; text-align: center">Welcome to the Registration System!</h2>

<center><img src="../../images/post-cs-building.jpg" align="middle"></center>
<p style ="color:#002D62; text-align: center"> The FIU School of Computing and Information Sciences has for many years shown a strong commitment to community outreach,</p>
<p style ="color:#002D62; text-align: center">promoting the cause of computer science education in South Florida.  </p>
<p style ="color:#002D62; text-align: center">As such, the school has offered a High School Programming Competition for the past eleven years. </p>
<p style ="color:#002D62; text-align: center">Over 500 highly skilled computer students from all over Florida have entered this competition.  </p>
<p style ="color:#002D62; text-align: center">Although the competition has had a simple registration website for many years, this new Programming Contest Registration System provides significant improvements. </p>
<p style ="color:#002D62; text-align: center">Great attention was paid to following user experience design principles, as well as improving the applications online security. </p>
<p style ="color:#002D62; text-align: center">The application makes it easy for coaches to register and manage their teams,</p>
<p style ="color:#002D62; text-align: center"> and allows administrators to monitor registration information and send notifications to teams. </p>
</div>

</body>
<html>