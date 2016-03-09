<html>
<head>
   <title>Login page</title>
    
<script type="text/javascript">
    window.onload = maxWindow;

    function maxWindow() {
        window.moveTo(0, 0);


        if (document.all) {
            top.window.resizeTo(screen.availWidth, screen.availHeight);
        }

        else if (document.layers || document.getElementById) {
            if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth) {
                top.window.outerHeight = screen.availHeight;
                top.window.outerWidth = screen.availWidth;
            }
        }
    }

</script>
</head>
<body>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*" %> 
        
    <%
        Class.forName("com.mysql.jdbc.Driver").newInstance ();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
       
        String email = request.getParameter("email");
        String pw = request.getParameter("pw");
       
        try {
            String query = "SELECT coach_id FROM coach WHERE email=? AND password=?;";
            PreparedStatement pstat = con.prepareStatement(query);
            pstat.setString(1, email);
            pstat.setString(2, pw);
            ResultSet rs = pstat.executeQuery();
       
            if (rs.isBeforeFirst())
            {
                session.setAttribute("user_email", email);
                session.setAttribute("user_role", 1);
                %>
                <script type="text/javascript">
                    maxWindow();
                </script>
                <%
                response.sendRedirect("../views/coach/homecoachlogin.html");
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
                    <script type="text/javascript">
                        maxWindow();
                    </script>
                    <%
                    response.sendRedirect("../views/admin/homeadminlogin.jsp");
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