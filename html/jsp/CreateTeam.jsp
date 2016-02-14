<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<head> 
<title>Connection with mysql database</title>
</head>
<html>    
<body>
<%

//Context initCtx = new InitialContext();
//Context envCtx = (Context) initCtx.lookup("java:comp/env");
//DataSource ds = (DataSource)envCtx.lookup("jdbc/regsys-dev");%>    
<h1>Connection status</h1>  
<%
try {
    String connectionURL = "jdbc:mysql://localhost:3306";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "root", "EWdev");
        if(!connection.isClosed())
            out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            connection.close();
    }catch(Exception ex){
        out.println("Unable to connect to database"+ex);
    }
%>
</font>
</body> 
</html>
