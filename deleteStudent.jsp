<%-- 
    Document   : deleteStudent
    Created on : 13 Dec, 2024, 9:23:43 PM
    Author     : 91955
--%>
<%@page import="java.io.PrintWriter" %>
<%@page trimDirectiveWhitespaces="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="deleteStudent.jsp" method="post">
              <h1>Delete Student: </h1>
        <table>
             <tr>
                    <td>Email-ID : </td>
                    <td><input type="text" name="txtEmail" /></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="text" name="txtPass" /></td>
                </tr>
                <tr>
                    <td> ReType Password : </td>
                    <td><input type="text" name="txtRPass" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="btnSubmit" value="Submit" /><br/>
                    </td>
                </tr>
                
                
        </table>
        </form>
    <buuton><a href="admin.jsp">Blck</a></buuton>
        <%
            Connection c;
            Statement s;
            ResultSet r;
            PreparedStatement ps;
            
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ashvin");
                s = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
                
                String action = request.getParameter("btnSubmit");
                
                if(action.equals("Submit")){
                 
                   String Email =  request.getParameter("txtEmail");
                   String Pass = request.getParameter("txtPass");
                   String rPass = request.getParameter("txtRPass");
                    
                    
                       
                    
                   if(Pass.equals(rPass)){
                      
                        String insUsers = " delete from student where email=('"+Email+"') and pass=('"+Pass+"')";
                        ps = c.prepareStatement(insUsers);
                        ps.clearParameters();
                       
                        
                      
                        ps.executeUpdate();
                       
                       out.println("<font color='red'><b>Record Deleted Sucessfully....</b></font>");
                       
                       
                       
                   }
                   else{
                       out.println("<font color='red'><b>Invalid Password / Retype Password ..</b></font>");
 
                       
                       
                   }
                }    
                
                
                
            }
            catch(Exception e){
                e.printStackTrace();
            }
            
            
        %>    
        
    </body>
</html>
