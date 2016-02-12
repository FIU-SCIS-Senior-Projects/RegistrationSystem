<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<head> 
<title>Connection with mysql database</title>
</head>
<html>    
<body>
    
<h1>Connection status</h1>  
try {
    String connectionURL = "jdbc:mysql://regsys-dev.cis.fiu.edu";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "username", "password");
        if(!connection.isClosed())
            out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            connection.close();
    }catch(Exception ex){
        out.println("Unable to connect to database"+ex);
    }
</font>
</body> 
</html>