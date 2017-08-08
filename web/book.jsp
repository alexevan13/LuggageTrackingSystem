<%-- 
    Document   : book
    Created on : May 24, 2017, 1:06:38 PM
    Author     : Kali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
        <%java.util.Date date = new java.util.Date();

            String formatted = new java.text.SimpleDateFormat("yyyy-MM-dd").format(date);%>
            <%response.sendRedirect("https://www.google.co.in/flights/#search;d=" + formatted);%>
       

        <%@include file="footer.jsp"%>
