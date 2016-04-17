<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>  
<%@ page import="java.util.*" %>
<%
   Class.forName("com.mysql.jdbc.Driver").newInstance ();
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
   
   String submit = request.getParameter("submit");
   int tableSize = Integer.parseInt(request.getParameter("tableSize"));
   int coachID;
   String schoolName;
   
   for(int k = 0; k < tableSize; k++)
   {
        if(submit.equals( "Remove School " + ( k+1 ) ) )
        {
        	schoolName = request.getParameter("sName"+k);
            //String query = "DELETE FROM school WHERE school_name = ?";
            //PreparedStatement pStatement = con.prepareStatement(query);
            //pStatement.setString(1, request.getParameter("sName"+k));
            //pStatement.executeUpdate();
            //response.sendRedirect("../views/admin/admincoachlist.jsp");
        }
   }

   String query = "SELECT coach_id FROM school WHERE school.coach_id = coach.coach_id AND school_name = ?;";
   PreparedStatement pstat = con.prepareStatement(query);
   pstat.setString(1, schoolName);
   ResultSet rs = pstat.executeUpdate();

   coachID = rs.getString("coach_id");

   query = "DELETE FROM participant WHERE coach_id = ?";
   pstat = con.prepareStatement(query);
   pstat.setInt(1, coachID);
   pstat.executeUpdate();

   query = "DELETE FROM team WHERE coach_id = ?";
   pstat = con.prepareStatement(query);
   pstat.setInt(1, coachID);
   pstat.executeUpdate();

   query = "DELETE FROM coach WHERE coach_id = ?";
   pstat = con.prepareStatement(query);
   pstat.setInt(1, coachID);
   pstat.executeUpdate();

   query = "DELETE FROM school WHERE school_name = ?";
   pstat = con.prepareStatement(query);
   pstat.setString(1, schoolName);
   pstat.executeUpdate();

%>