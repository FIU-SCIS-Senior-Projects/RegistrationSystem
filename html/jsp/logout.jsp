<html>
<head>
   <title>Logout page</title>
</head>
<body>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*" %> 
        
    <%
        request.getSession().invalidate();
        response.sendRedirect("../../index.html");
    %>
</body>
</hmtl>