<%-- 
    Document   : index
    Created on : 12 Dec, 2024, 8:27:30 PM
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
        <form method="post" action="session.jsp"> 
            <table border="1">
                <tr>
                    <td>Email-ID : </td>
                    <td><input type="text" name="txtEmail" /></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="text" name="txtPass" /></td>
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
                    <td colspan="2">
                        <input type="submit" name="btnSubmit" value="Login" /><br/>
                    </td>
                </tr>           
            </table>           
        </form> 
        <button><a href="createStudent.jsp" style="text-decoration: none">Create User</a></button>

    </body>
</html>
