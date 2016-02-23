<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>  
<%@ page import="java.util.*" %>
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
        ArrayList firstName = new ArrayList();
        ArrayList lastName = new ArrayList();
        ArrayList email = new ArrayList();
        ArrayList tShirt = new ArrayList();
        ArrayList oldEmail = new ArrayList();
        int tableSize = request.getParameter("tableSize");
        out.print(tableSize + "  ");
   
        for(int i = 0; i < tableSize; i++)
        {
            firstName.add(request.getParameter("fname"+i));
            lastName.add(request.getParameter("lname"+i));
            email.add(request.getParameter("email"+i));
            tShirt.add(request.getParameter("tShirt"+i));
            oldEmail.add(request.getParameter("oldEmail"+i));
            out.print(oldEmail.get(i));
        }
        
        
     }
     if(submit.equals("Remove Participant"))
     {
        out.print("remove");
     }
       
    %>