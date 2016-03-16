<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%

   if(request.getParameter("submit").equals("Cancel"))
   { response.sendRedirect("coachAccount.jsp"); }
	
if(request.getParameter("submit").equals ("Save & Close")){
  Class.forName("com.mysql.jdbc.Driver").newInstance ();
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
   Statement stat = con.createStatement();
   ResultSet rs = null;
   String firstName = request.getParameter("fname");
   String lastName = request.getParameter("lname");
   String email = request.getParameter("email");
   String oldEmail = request.getParameter("oldEmail");

   String query = "UPDATE coach SET first_name = ?, last_name = ?, email = ? WHERE email = ?";
   PreparedStatement pStatement = con.prepareStatement(query);
   pStatement.setString(1, firstName);
   pStatement.setString(2, lastName);
   pStatement.setString(3, email);
   pStatement.setString(4, oldEmail);
    
   int rows = pStatement.executeUpdate();

   response.sendRedirect("coachAccount.jsp");}
%>
   
