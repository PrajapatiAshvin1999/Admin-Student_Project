<%-- 
    Document   : admin.jsp
    Created on : 13 Dec, 2024, 9:30:48 AM
    Author     : 91955
--%>


<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
         <%
            String name = (String) session.getAttribute("email");
            out.write("Welcome : <b>" + name + "</b> You have successfuly logged-in....");
        %> 
        
        <h1>Admin Page </h1>
        <table border="1">
            
            <tr>
                <td>Roll No</td>
                <td>Student Name</td>
                <td>City</td>
                <td>Email</td>
                <td>Status</td>
                <td>Update</td>
                <td>Delete</td>
            </tr>
            
            <%
                
                try{
                        Connection c;
                        ResultSet r;
                        Statement s;

                        Class.forName("oracle.jdbc.driver.OracleDriver");

                        c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ashvin");
                        s= c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
                        r = s.executeQuery("Select * From Student ");
                        while(r.next()){


                        
                        %>
                         <tr>
                            <td> <%=r.getString("Rno") %></td>
                            <td> <%=r.getString("Sname") %></td>
                            <td> <%=r.getString("city") %></td>
                            <td> <%=r.getString("email") %></td>
                            <td> <%=r.getString("status") %></td>
                            <td><Button ><a href="updateStudent.jsp">Update</a></Button></td>
                            <td><button><a href="deleteStudent.jsp">Delete</a></button></td>

                        </tr>

                <% 
                 }   
                     c.close();
                 }
                 catch(Exception e){
                    e.printStackTrace();
                }
                 
                
                %>
                
            
           
           
        </table>
    </body>
</html>
