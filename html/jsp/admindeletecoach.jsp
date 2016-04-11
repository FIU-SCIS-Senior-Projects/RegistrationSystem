<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>  
<%@ page import="java.util.*" %>
<%
   Class.forName("com.mysql.jdbc.Driver").newInstance ();
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
   
   String submit = request.getParameter("submit");
   int tableSize = Integer.parseInt(request.getParameter("tableSize"));
   
   for(int k = 0; k < tableSize; k++)
   {
        if( submit.equals( "Remove School " + ( k+1 ) ) )
        {  
            String query = "DELETE FROM school WHERE school_name = ?";
            PreparedStatement pStatement = con.prepareStatement(query);
            pStatement.setString(1, request.getParameter("sName"+k));
            pStatement.executeUpdate();
            response.sendRedirect("../views/admin/admincoachlist.jsp");
        }
   }
%>