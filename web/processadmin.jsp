<%-- 
    Document   : processadmin
    Created on : May 30, 2017, 12:23:41 PM
    Author     : Kali
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<div class="container">
    <%

        String username = (String) request.getParameter("adminName");
        String pass = (String) request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/luggagetrackingsystem";
            String user = "root";
            String password = "";
            out.print("DB Connected");
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet rs;
            String sql = "SELECT * FROM admin WHERE admin_user ='" + username + "'";
            rs = stmt.executeQuery(sql);
            out.print("Query Executed");
            int flag = 0;
            while (rs.next()) {

                if ((aepass.AESCrypt.decrypt(rs.getString("admin_password")).equals(pass)) && (rs.getString("admin_user").equals(username))) {
                    session.setAttribute("adminname", rs.getString("admin_name"));
                    out.println("Login Successful");
                    flag = 1;
                    response.sendRedirect("admindata.jsp");
                } else {
                    flag=2;
                    out.println("<h3 align=\"center\" style=\"color:red;\">Error In Login <a href=\"admin.jsp\">Click Here</a> to try again</h3>");
                }
            }
            if (flag == 0) {
                out.println("<h3 align=\"center\" style=\"color:red;\">Error In Username Or Password <a href=\"admin.jsp\">Click Here</a> to try again</h3>");

            }

        } catch (Exception ex) {
            out.print(ex);
        }

    %>
</div>
<%@include file="footer.jsp" %>