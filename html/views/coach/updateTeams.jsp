<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>  
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
    ResultSet rs = null;
   String submit = request.getParameter("submit");
    
    if(submit.equals("Cancel"))
     {
        response.sendRedirect("coachteams.jsp");
     }
     if(submit.equals("Save & Close"))
     {
        out.print("save and close");
     }
     if(submit.equals("remove"))
     {
        out.print("remove");
     }
       
    %>