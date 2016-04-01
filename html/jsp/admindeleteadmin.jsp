<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>  
<%@ page import="java.util.*" %>
<%
   Class.forName("com.mysql.jdbc.Driver").newInstance ();
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");
%>