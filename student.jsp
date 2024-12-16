<%-- 
    Document   : student
    Created on : 13 Dec, 2024, 8:09:52 PM
    Author     : 91955
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>WelCome!</h1>
        <table border="1">
            <tr>
                <td>Rno</td>
                <td>Sname</td>
                <td>City</td>
                <td>Email</td>
                <td>Status</td>
                <td>Update</td>
            </tr>
       
        
          <%
            String name = (String) session.getAttribute("email");
       
            out.write(" <b>" + name + "</b> You have successfuly logged-in....");
          %>
        <%
            
            Connection c;
            Statement s;
            ResultSet r;    
            
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ashvin");
                s = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE); 
                
                r = s.executeQuery("Select * From Student where email=('"+name+"') ");  
                
                
                while(r.next()){

            %>
            <tr>
                <td> <%=r.getString("Rno") %></td>
                <td> <%=r.getString("Sname") %></td>
                <td> <%=r.getString("city") %></td>
                <td> <%=r.getString("email") %></td>
                <td> <%=r.getString("status") %></td>
                <td> <button><a href="updateStudent.jsp">Update</a></button></td>
                
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
        <button><a href="logOut.jsp">LogOut</a></button>
        
    </body>
</html>
