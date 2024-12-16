<%-- 
    Document   : logOut
    Created on : 16 Dec, 2024, 10:43:48 AM
    Author     : 91955
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            out.print( " You have successfuly logOut....");
             RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response); 
        %>
    </body>
</html>
