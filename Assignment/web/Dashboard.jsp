<%-- 
    Document   : Dashboard
    Created on : Apr 12, 2022, 12:28:15 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <hea>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <h1>Hello World!</h1>
        <form action="NewServlet" method="POST">
            <input type="text" name="text">
            <input type="submit" value="Input" />
        </form>
        <input type="text" value="${text}">
    </body>
</html>
