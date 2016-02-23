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
   
        for(int i = 0; i < 3; i++)
        {
            firstName.add(request.getParameter("fname"+i));
            lastName.add(request.getParameter("lname"+i));
            email.add(request.getParameter("email"+i));
            tShirt.add(request.getParameter("tShirt"+i));
            out.print(firstName.get(i));
            out.print(lastName.get(i));
            out.print(email.get(i));
            out.print(tShirt.get(i));
            
        }
        String firstName = request
        out.print("save and close");
     }
     if(submit.equals("Remove Participant"))
     {
        out.print("remove");
     }
       
    %>