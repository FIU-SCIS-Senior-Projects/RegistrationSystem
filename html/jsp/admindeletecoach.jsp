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
        if( submit.equals( "Remove Coach " + ( k+1 ) ) )
        {  
            %>
            <script>alert("Stuff");</script>
            <%
            String query = "DELETE FROM coach WHERE email = ?";
            PreparedStatement pStatement = con.prepareStatement(query);
            pStatement.setString(1, request.getParameter("email"+k));
            pStatement.executeUpdate();
            response.sendRedirect("../views/admin/admincoachlist.jsp");
        }
   }
%>