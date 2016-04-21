<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>  
<%@ page import="java.util.*" %>
<%
   Class.forName("com.mysql.jdbc.Driver").newInstance ();
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
   Statement stat = con.createStatement();
   ResultSet rs = null;
   String submit = request.getParameter("submit");
   ArrayList firstName = new ArrayList();
   ArrayList lastName = new ArrayList();
   ArrayList email = new ArrayList();
   ArrayList tShirt = new ArrayList();
   ArrayList originalEmail = new ArrayList();
   int rows;
   int teamID;
   int tableSize = Integer.parseInt(request.getParameter("tableSize"));
   
    //Cancel and go back to teams page
    if(submit.equals("Cancel"))
    {
        response.sendRedirect("coachTeams.jsp");
    }
    
   
    //Updating a team
    if(submit.equals("Save & Close"))
    {
        tableSize = Integer.parseInt(request.getParameter("tableSize"));
        teamID = Integer.parseInt(request.getParameter("teamId"));
        
        for(int i = 0; i < tableSize ; i++)
        {
        firstName.add(request.getParameter("fname"+i));
        lastName.add(request.getParameter("lname"+i));
        email.add(request.getParameter("email"+i));
        tShirt.add(request.getParameter("tShirt"+i));
        originalEmail.add(request.getParameter("oldEmail"+i));
        }
   
        for(int i = 0; i < tableSize ; i++)
        {
            String query = "UPDATE participant SET first_name = ?, last_name = ?, email = ?, tshirt_size = ? WHERE email= ?";
    
            PreparedStatement pStatement = con.prepareStatement(query); 
        
            pStatement.setString(1, firstName.get(i).toString());
            pStatement.setString(2, lastName.get(i).toString());
            pStatement.setString(3, email.get(i).toString());
            pStatement.setString(4, tShirt.get(i).toString());
            pStatement.setString(5, originalEmail.get(i).toString());
    
            rows = pStatement.executeUpdate();
        }
        response.sendRedirect("coachTeams.jsp");
        
        
     }
    
    //logic for removing a participant from a team
    for(int k = 0; k < tableSize; k++)
    {
        
        originalEmail.add(request.getParameter("oldEmail"+k));
        if( submit.equals( "Remove Participant " + ( k+1 ) ) )
        {   
            teamID = Integer.parseInt(request.getParameter("teamId"));
            String query = "DELETE FROM participant WHERE email = ?";
            PreparedStatement pStatement = con.prepareStatement(query);
            pStatement.setString(1, originalEmail.get(k).toString());
            
            rows = pStatement.executeUpdate();
            response.sendRedirect("coachEditTeam.jsp?teamId=" + teamID);
        }
                                 
    }
    
    //Adding a participant
    if(submit.equals("Add Participant"))
    {
        String newFname = request.getParameter("fname");
        String newLname = request.getParameter("lname");
        String newEmail = request.getParameter("email");
        String newTShirt = request.getParameter("tShirt");
        teamID = Integer.parseInt(request.getParameter("teamId"));
        int coachID = (int)session.getAttribute("user_id");
       
        String query = "INSERT INTO participant(first_name, last_name, email, team_id, coach_id, tshirt_size) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pStatement = con.prepareStatement(query);
        pStatement.setString(1, newFname);
        pStatement.setString(2, newLname);
        pStatement.setString(3, newEmail);
        pStatement.setInt(4, teamID);
        pStatement.setInt(5, coachID);
        pStatement.setString(6, newTShirt);
            
        rows = pStatement.executeUpdate();
        response.sendRedirect("coachEditTeam.jsp?teamId=" + teamID);
    
    }
     
       
    %>
