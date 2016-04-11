<!doctype html>
<html lang=''>
<body>
    
<% 
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

      
      // Recipients email ID needs to be mentioned.
      String to = request.getParameter("email");

      // Senders email ID needs to be mentioned
      String from = "wcurl001@fiu.edu";

      // Assuming you are sending email from localhost
      String host = "localhost";

      // Get system properties
      Properties properties = System.getProperties();

      // Setup mail server
      properties.setProperty("smtp.cs.fiu.edu", host);

      // Get the default Session object.
      Session session = Session.getDefaultInstance(properties);

      try{
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

         // Set Subject: header field
         message.setSubject("This is the Subject Line!");

         // Send the actual HTML message, as big as you like
         message.setContent("<h1>This is actual message</h1>", "text/html" );

         // Send message
         Transport.send(message);
         System.out.println("Sent message successfully....");
      }catch (MessagingException mex) {
         mex.printStackTrace();
      }
   %>
    
    
</body>
</html>