<%-- 
    Document   : googlesearch
    Created on : May 23, 2017, 7:38:18 PM
    Author     : Kali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Done</title>
    </head>
    <body>
        <%String keyword=request.getParameter("search");
        response.sendRedirect("https://www.google.co.in/?#q="+keyword);
        %>
    </body>
</html>
