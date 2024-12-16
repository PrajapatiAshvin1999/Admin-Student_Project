<%-- 
    Document   : updateStudent
    Created on : 13 Dec, 2024, 11:39:31 AM
    Author     : 91955
--%>

<%@page import="java.io.PrintWriter" %>
<%@page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.DriverManager"  %>
<%@page import="java.sql.ResultSet"  %>
<%@page import="java.sql.Statement"  %>
<%@page import="java.sql.Connection"  %>
<%@page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update Student Details</h1>
       <form method="post" action="updateStudent.jsp"> 
            <table border="1">
                <tr>
                    <td>RNO : </td>
                    <td><input type="text" name="txtRno" /></td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="txtSname" /></td>
                </tr>
                <tr>
                    <td>City : </td>
                    <td><input type="text" name="txtCity" /></td>
                </tr>
                  <tr>
                    <td>
                        Status :
                    </td>
                    <td>
                        <select name="options" id="options"  >
                            <option value="student">Student</option>
                            <option value="admin"> Admin </option>
                        </select>
                    </td>
                </tr>
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
        
        <%
            String name = (String) session.getAttribute("email");
            
            Connection c;
            Statement s;
            ResultSet r;
            PreparedStatement ps;
            boolean flag = false;
            
           try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ashvin");
                s = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);               

               
               String action = request.getParameter("btnSubmit");
               
               
               if(action.equals("Submit")){
                   String RNO = request.getParameter("txtRno");
                   String SNAME = request.getParameter("txtSname");
                   String CITY = request.getParameter("txtCity");
                   String options = request.getParameter("options"); 
                   String Pass = request.getParameter("txtPass");
                   String rPass = request.getParameter("txtRPass");
                    
                   
                       
                    
                   if(Pass.equals(rPass)){
                      
                        String insUsers = "Update student set rno=('"+ RNO+"'), sname=('"+SNAME+"'),city=('"+CITY+"'),status=('"+options+"'), pass=('"+ Pass+"') where email=('"+name+"')";
                        ps = c.prepareStatement(insUsers);
                        ps.clearParameters();
                        
                       
                     
                        
                        System.out.println("Hello");
                      
                        ps.executeUpdate();
                       
                       out.println("<font color='red'><b>Record UPDATED Sucessfully....</b></font>");
                       
                       
                       
                   }
                   else{
                       out.println("<font color='red'><b>Invalid Password / Retype Password ..</b></font>");
 
                       
                       
                   }
                   
               }
               
               
               
               
           }
           catch(Exception e){
               System.out.println(e.toString());
           }
            
        %>    
    
    </body>
</html>
