<%-- 
    Document   : session.jsp
    Created on : 11 Dec, 2024, 8:51:46 AM
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
         <%
            Connection c;
            Statement s;
            ResultSet r;    
            boolean flag = false;
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                        "system","ashvin");
                s = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);               

                String action = request.getParameter("btnSubmit");
                String Email = request.getParameter("txtEmail");
                String Pass = request.getParameter("txtPass");
                String options = request.getParameter("options");
                
                
                
               
                
                if(action.equals("Login")){
                    r = s.executeQuery("Select * From Student");
                    r.first();
                    
                    do{
                       if(Email.equals(r.getString("Email"))
                               && Pass.equals(r.getString("PASS")) && options.equals(r.getString("status")) ){  
                           flag = true;                         
                           break;
                       }                       
                    }while(r.next());
                    
                    if(flag == true){                      
                       
                       
                       if(options.equals("student")){
                         session.setAttribute("email", Email);
                       session.setAttribute("status",options);  
                         RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
                         rd.forward(request, response);    
                      }
                       
                       else if(options.equals("admin")){
                        session.setAttribute("email", Email);
                       session.setAttribute("status",options);   
                        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                        rd.forward(request, response); 
                      }
                   }   
                    else{
                       out.println("<br/><font color='red'><b>You have entered incorrect UID/Password And Status...</b></font>");
                       RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                        rd.include(request, response); 
                   }
               }
                
            }
            catch(Exception e){System.out.println(e.toString());}            
        %> 
    </body>
</html>
