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
        int tableSize = Integer.parseInt(request.getParameter("tableSize"));
   
   
        for(int i = 0; i < tableSize ; i++)
        {
            firstName.add(request.getParameter("fname"+i));
            lastName.add(request.getParameter("lname"+i));
            email.add(request.getParameter("email"+i));
            tShirt.add(request.getParameter("tShirt"+i));
            oldEmail.add(request.getParameter("oldEmail"+i));
        
            String query = "UPDATE participant SET first_name = ?, last_name = ?, email = ?, tshirt_size = ? WHERE email= ?";
    
            PreparedStatement pStatement = con.prepareStatement(query); 
        
            pStatement.setString(1, firstName.get(i).toString());
            pStatement.setString(2, lastName.get(i).toString());
            pStatement.setString(3, email.get(i).toString());
            pStatement.setString(4, tShirt.get(i).toString());
            pStatement.setString(5, oldEmail.get(i).toString());
    
            int rows = pStatement.executeUpdate();
        }
        response.sendRedirect("coachteams.jsp");
        
        
     }
     if(submit.equals("Remove Participant"))
     {
        out.print("remove");	
        out.println(request.getParameter("remove"));
	out.println("should be 0");
     }
       
    %>
