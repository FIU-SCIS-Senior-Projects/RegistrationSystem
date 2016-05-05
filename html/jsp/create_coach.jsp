<html>
<head>
   <title>Register a new coach.</title>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
        
<%
Class.forName("com.mysql.jdbc.Driver").newInstance ();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_system","root","EWdev");

int coachID = 0;
int schoolID = 0;
String coachFullName = "";
String coachFName = "";
String coachLName = "";
       
String fName = request.getParameter("fname");
String lName = request.getParameter("lname");
String coachemail = request.getParameter("email");
String schoolName = request.getParameter("schoolname");
String password = request.getParameter("pw");
String confpassword = request.getParameter("confpw");
String query = "";
PreparedStatement pstat = null;
ResultSet rs = null;

boolean pwvalid = password.equals(confpassword);

boolean pwlength = true;
if (password.length() < 6)
{
    pwlength = false;
}

boolean coachvalid = true;
query = "SELECT * FROM coach WHERE email=?;";
pstat = con.prepareStatement(query);
pstat.setString(1, coachemail);
rs = pstat.executeQuery();

if (rs.isBeforeFirst())
{
    coachvalid = false;
}

boolean adminvalid = true;
query = "SELECT * FROM administrator WHERE email=?";
pstat = con.prepareStatement(query);
pstat.setString(1, coachemail);
rs = pstat.executeQuery();
if (rs.isBeforeFirst())
{
    adminvalid = false;
}

boolean emailvalid = false;
if (coachemail.contains("@") && (coachemail.contains(".edu") || coachemail.contains(".com") || coachemail.contains(".org") || coachemail.contains(".gov")))
{
	emailvalid = true;
}

boolean schoolvalid = true;
String checkSchool = "SELECT first_name, last_name FROM coach, school WHERE school.coach_id = coach.coach_id AND school_name=?;";
pstat = con.prepareStatement(checkSchool);
pstat.setString(1, schoolName);
rs = pstat.executeQuery();
if (rs.isBeforeFirst())
{
    while (rs.next())
    {
        coachFName = rs.getString("first_name");
        coachLName = rs.getString("last_name");
    }
    coachFullName = coachFName + " " + coachLName;
    schoolvalid = false;
}

try {
	if (pwvalid && pwlength && coachvalid && adminvalid && emailvalid && schoolvalid)
	{
		query = "INSERT INTO school (school_name, coach_id) VALUES (?,?);";
        pstat = con.prepareStatement(query);
        pstat.setString(1, schoolName);
        pstat.setInt(2, 0);
        pstat.executeUpdate();

        query = "SELECT school_id FROM school WHERE school_name = ?;";
        pstat = con.prepareStatement(query);
        pstat.setString(1, schoolName);
        rs = pstat.executeQuery();

        while (rs.next())
        {
         	schoolID = Integer.parseInt(rs.getString("school_id"));
        }

        query = "INSERT INTO coach (first_name, last_name, email, password, school_id, role) VALUES (?,?,?,?,?,?);";
        pstat = con.prepareStatement(query);
        pstat.setString(1, fName);
        pstat.setString(2, lName);
        pstat.setString(3, coachemail);
        pstat.setString(4, password);
        pstat.setInt(5, schoolID);
        pstat.setInt(6, 1);
        pstat.executeUpdate();

        query = "SELECT coach_id FROM coach WHERE email = ?;";
	    pstat = con.prepareStatement(query);
		pstat.setString(1, coachemail);
		rs = pstat.executeQuery();

		while (rs.next())
		{
			coachID = Integer.parseInt(rs.getString("coach_id"));
		}

		query = "UPDATE school SET coach_id=? where school_name = ?;";
		pstat = con.prepareStatement(query);
		pstat.setInt(1, coachID);
		pstat.setString(2, schoolName);
		pstat.executeUpdate();

		response.sendRedirect("../../index.html");
	}
	else if (pwvalid == false)
	{
		response.sendRedirect("signup.jsp?pwvalid=false");
	}
	else if (pwlength == false)
	{
		response.sendRedirect("signup.jsp?pwlength=false");
	}
	else if (coachvalid == false)
	{
		response.sendRedirect("signup.jsp?coachvalid=false");
	}
	else if (adminvalid == false)
	{
		response.sendRedirect("signup.jsp?adminvalid=false");
	}
	else if (emailvalid == false)
	{
		response.sendRedirect("signup.jsp?emailvalid=false");
	}
	else
	{
		response.sendRedirect("signup.jsp?exists=true&coachName=" + coachFullName);
	}
} catch(IllegalStateException e) {}
// try {
//     if (password.equals(confpassword) == false)
//     {   	
//         response.sendRedirect("signup.jsp?pwvalid=false");
//     }
//     if (password.length() < 6)
//     {
//         response.sendRedirect("signup.jsp?pwlength=false");
//     }

//     query = "SELECT * FROM coach WHERE email=?;";
//     pstat = con.prepareStatement(query);
//     pstat.setString(1, coachemail);
//     rs = pstat.executeQuery();

//     if (rs.isBeforeFirst())
//     {
//         response.sendRedirect("signup.jsp?coachvalid=false");
//     }
//     else
//     {
//         query = "SELECT * FROM administrator WHERE email=?";
//         pstat = con.prepareStatement(query);
//         pstat.setString(1, coachemail);
//         rs = pstat.executeQuery();
//         if (rs.isBeforeFirst())
//         {
//             response.sendRedirect("signup.jsp?adminvalid=false");
//         }
//         else
//         {
//             if (coachemail.contains("@") && (coachemail.contains(".edu") || coachemail.contains(".com") || coachemail.contains(".org") || coachemail.contains(".gov")))
//             {
//                 String checkSchool = "SELECT first_name, last_name FROM coach, school WHERE school.coach_id = coach.coach_id AND school_name=?;";
//                 pstat = con.prepareStatement(checkSchool);
//                 pstat.setString(1, schoolName);
//                 rs = pstat.executeQuery();

//                 if (rs.isBeforeFirst())
//                 {
//                     while (rs.next())
//                     {
//                         coachFName = rs.getString("first_name");
//                         coachLName = rs.getString("last_name");
//                     }
//                     coachFullName = coachFName + " " + coachLName;
//                     response.sendRedirect("signup.jsp?exists=true&coachName=" + coachFullName);
//                 }
//                 else
//                 {
//                     query = "INSERT INTO school (school_name, coach_id) VALUES (?,?);";
//                     pstat = con.prepareStatement(query);
//                     pstat.setString(1, schoolName);
//                     pstat.setInt(2, 0);
//                     pstat.executeUpdate();

//                     query = "SELECT school_id FROM school WHERE school_name = ?;";
//                     pstat = con.prepareStatement(query);
//                     pstat.setString(1, schoolName);
//                     rs = pstat.executeQuery();

//                     while (rs.next())
//                     {
//                         schoolID = Integer.parseInt(rs.getString("school_id"));
//                     }

//                     query = "INSERT INTO coach (first_name, last_name, email, password, school_id, role) VALUES (?,?,?,?,?,?);";
//                     pstat = con.prepareStatement(query);
//                     pstat.setString(1, fName);
//                     pstat.setString(2, lName);
//                     pstat.setString(3, coachemail);
//                     pstat.setString(4, password);
//                     pstat.setInt(5, schoolID);
//                     pstat.setInt(6, 1);
//                     pstat.executeUpdate();

//                     query = "SELECT coach_id FROM coach WHERE email = ?;";
//                     pstat = con.prepareStatement(query);
//                     pstat.setString(1, coachemail);
//                     rs = pstat.executeQuery();

//                     while (rs.next())
//                     {
//                         coachID = Integer.parseInt(rs.getString("coach_id"));
//                     }

//                     query = "UPDATE school SET coach_id=? where school_name = ?;";
//                     pstat = con.prepareStatement(query);
//                     pstat.setInt(1, coachID);
//                     pstat.setString(2, schoolName);
//                     pstat.executeUpdate();

//                     response.sendRedirect("../../index.html");
//                 }
//             }
//             else
//             {
//                 response.sendRedirect("signup.jsp?emailvalid=false");
//             }
//         }
//     }
// } catch(IllegalStateException e) {}                       
%>
</body>
</hmtl>
