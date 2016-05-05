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
   <title>Recover Password</title>
</head>
<body>

<%
	Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");

    String pw = "";
    String email = request.getParameter("email");
    String query = "SELECT password FROM coach WHERE email=?;";
    PreparedStatement pstat = con.prepareStatement(query);
    pstat.setString(1, email);
    ResultSet rs = pstat.executeQuery();

    if (rs.isBeforeFirst())
    {
		while (rs.next())
		{
			pw = rs.getString("password");
		}
		%> <p style="margin-top: 50%">Your password is: <%=pw%> </p><%
	}
	else
	{
		%> No account with that email.<%
	}
%>
</body>
</html>