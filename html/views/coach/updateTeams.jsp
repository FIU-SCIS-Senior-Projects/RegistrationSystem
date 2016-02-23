  <%
    Class.forName("com.mysql.jdbc.Driver").newInstance ();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
    Statement stat = con.createStatement();
    ResultSet rs = null;
    
    if((request.getParam("submit")).equals("Cancel"))
     {
        response.sendRedirect("coachteams.jsp");
     }
     if((request.getParam("submit")).equals("Save & Close"))
     {
        out.print("save and close");
     }
     if((request.getParam("submit")).equals("remove"))
     {
        out.print("remove");
     }
       
    %>