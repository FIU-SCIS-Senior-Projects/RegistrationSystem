<!doctype html>
 
<%@ page import ="java.util.*" %>
<%@ page import ="javax.mail.*" %>

<html lang=''>
<body>

<%
      
Message message = new MimeMessage(session);
try {
        message.setFrom(new InternetAddress("wcurl001@fiu.edu");
        InternetAddress to[] = new InternetAddress[1];
        to[0] = new InternetAddress("wcurl001@fiu.edu");
        message.setRecipients(Message.RecipientType.TO, to);
        message.setSubject("SUBJECT");
        message.setContent(corps, "text/html;charset=UTF-8");
        Transport.send(message);
    } 
   
catch (AddressException ex) 
{
   System.out.println(ex.getMessage());
} 
catch (MessagingException ex) 
{
   System.out.println(ex.getMessage());
}
   %>
    
    
</body>
</html>