<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>  
<%@ page import="java.util.*" %>
<%
   Class.forName("com.mysql.jdbc.Driver").newInstance ();
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
   Statement stat = con.createStatement();
   ResultSet rs = null;
   String submit = request.getParameter("submit");
   int tableSize = Integer.parseInt(request.getParameter("tableSize"));
   int teamID = Integer.parseInt(request.getParameter("teamId"));
   ArrayList firstName = new ArrayList();
   ArrayList lastName = new ArrayList();
   ArrayList email = new ArrayList();
   ArrayList tShirt = new ArrayList();
   ArrayList originalEmail = new ArrayList();
   
   for(int i = 0; i < tableSize ; i++)
    {
        firstName.add(request.getParameter("fname"+i));
        lastName.add(request.getParameter("lname"+i));
        email.add(request.getParameter("email"+i));
        tShirt.add(request.getParameter("tShirt"+i));
        originalEmail.add(request.getParameter("oldEmail"+i));
    }
   
    if(submit.equals("Cancel"))
    {
        response.sendRedirect("coachteams.jsp");
    }
    
     if(submit.equals("Save & Close"))
     {
   
        for(int i = 0; i < tableSize ; i++)
        {
            String query = "UPDATE participant SET first_name = ?, last_name = ?, email = ?, tshirt_size = ? WHERE email= ?";
    
            PreparedStatement pStatement = con.prepareStatement(query); 
        
            pStatement.setString(1, firstName.get(i).toString());
            pStatement.setString(2, lastName.get(i).toString());
            pStatement.setString(3, email.get(i).toString());
            pStatement.setString(4, tShirt.get(i).toString());
            pStatement.setString(5, originalEmail.get(i).toString());
    
            int rows = pStatement.executeUpdate();
        }
        response.sendRedirect("coachteams.jsp");
        
        
     }
    for(int k = 0; k < tableSize; k++)
    {
        
        if( submit.equals( "Remove Participant " + ( k+1 ) ) )
        {   
            String query = "UPDATE participant SET team_ID = ? WHERE email = ?";
            PreparedStatement pStatement = con.prepareStatement(query);
            pStatement.setNull(1, java.sql.Types.INTEGER);
            pStatement.setString(2, originalEmail.get(k).toString());
            
            int rows = pStatement.executeUpdate();
            response.sendRedirect("coachedit.jsp?teamId=" + teamID);
        }
                                 
    }
    
    if(submit.equals("Add Participant"))
    {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String tShirt = request.getParameter("tShirt");
        String teamID = request.getParameter("teamId");
        
        if(!fname.equals("") && !lname.equals("") && !email.equals("") && !tShirt.equals(""))
        {
            String query = "INSERT INTO participant VALUES (?, ?, ?, ?)";
            PreparedStatement pStatement = con.prepareStatement(query);
            pStatement.setString(1, fname);
            pStatement.setString(2, lname);
            pStatement.setString(3, email);
            pStatement.setString(4, tShirt);
            
            int rows = pStatement.executeUpdate();
    
        }
        else
        {
            response.sendRedirect("coachedit.jsp?teamId=" + teamID);
        }
    
    }
     
       
    %>
