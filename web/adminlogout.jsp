<%-- 
    Document   : logout
    Created on : May 30, 2017, 8:32:45 PM
    Author     : Kali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<meta
http-equiv="refresh" content="5;URL=admin.jsp">
</head> 
<%@include file="header.jsp" %>
<%
    session.setAttribute("adminname", "");
    out.println("<h3 align=\"center\" style=\"color:blue;\">You Are Sucessfully Logged Out <a href=\"admin.jsp\">Click Here</a> To Go Back</h3><br/>");
        out.println("<h5 align=\"center\" style=\"color:green;\">You will automatically redirected to Admin Login page after 5 Seconds....</h5>");

%>
<%@include file="footer.jsp" %>