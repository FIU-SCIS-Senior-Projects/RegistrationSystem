<html>
<head>
   <title>Login page</title>
</head>
<body>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*,java.util.*,javax.mail.*"%>
    <%@ page import="javax.mail.internet.*,javax.activation.*"%>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
        
    <%
        Class.forName("com.mysql.jdbc.Driver").newInstance ();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
        String from = "admin@regsys.fiu.edu";
        String host = "localhost";
       
        Properties properties = System.getProperties();
        properties.setProperty("smtp.cs.fiu.edu", host);
        Session mailSession = Session.getDefaultInstance(properties);
       
        String email = request.getParameter("email");
       
        try {
            String query = "SELECT 1 FROM coach WHERE email=?;"
            PreparedStatement pstat = con.prepareStatement(query);
            pstat.setString(1, email);
            ResultSet rs = pstat.executeQuery();
       
            if (rs.isBeforeFirst())
            {
                try {
                    MimeMessage message = new MimeMessage(mailSession);
                    message.setFrom(new InternetAddress(from));
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress("eguer048@fiu.edu");
                    message.setSubject("This is the Subject Line!");
                    message.setText("This is actual message");
                    Transport.send(message);
                } catch (MessageingException mex)
            }
            else
            {
                query = "SELECT 1 FROM administrator WHERE email=?;"
                pstat = con.prepareStatement(query);
                pstat.setString(1, email);
                rs = pstat.executeQuery();
                if (rs.isBeforeFirst())
                {
                    try {
                        MimeMessage message = new MimeMessage(mailSession);
                        message.setFrom(new InternetAddress(from));
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                        message.setSubject("This is the Subject Line!");
                        message.setText("This is actual message");
                        Transport.send(message);
                    } catch (MessageingException mex)
                }
                else
                {
                    response.sendRedirect("../views/guest/signup.html");
                }
            }
        } catch (IllegalStateException e) {}
    %>
</body>
</hmtl>