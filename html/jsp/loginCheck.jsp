<html>
<head>
   <title>Login page</title>
</head>
<body>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*" %> 
        
    <%
        Class.forName("com.mysql.jdbc.Driver").newInstance ();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
       
        String email = request.getParameter("email");
        String pw = request.getParameter("pw");
        int coachID = 0;
       
        try {
            String query = "SELECT coach_id FROM coach WHERE email=? AND password=?;";
            PreparedStatement pstat = con.prepareStatement(query);
            pstat.setString(1, email);
            pstat.setString(2, pw);
            ResultSet rs = pstat.executeQuery();
       
            if (rs.isBeforeFirst())
            {
            	while (rs.next())
            	{
            		coachID = Integer.parseInt(rs.getString("coach_id"));
            	}
                session.setAttribute("user_email", email);
                session.setAttribute("user_role", 1);
                session.setAttribute("user_id", coachID);
                %>
                <script language="JavaScript">
                    window.opener.document.location.href = "../views/coach/coachHome.jsp";
                    window.close();
                </script>
                <%
            }
            else
            {
                query = "SELECT administrator_id FROM administrator WHERE email=? AND password=?;";
                pstat = con.prepareStatement(query);
                pstat.setString(1, email);
                pstat.setString(2, pw);
                rs = pstat.executeQuery();
                if (rs.isBeforeFirst())
                {
                    session.setAttribute("user_email", email);
                    session.setAttribute("user_role", 2);
                    %>
                    <script language="JavaScript">
                        window.opener.document.location.href = "../views/admin/homeadminlogin.jsp";
                        window.close();
                    </script>
                    <%
                }
                else
                {
                    response.sendRedirect("../views/guest/signin.html"); 
                }
            }
        }
        catch (IllegalStateException e) {}
    %>
</body>
</hmtl>