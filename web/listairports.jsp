<%-- 
    Document   : listairports
    Created on : May 26, 2017, 2:15:44 PM
    Author     : Kali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<div class="container">
<%@page import="java.sql.*"%>
<%
    try {
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/luggagetrackingsystem";
                    String user = "root";
                    String password = "";
                    Connection con = DriverManager.getConnection(url, user, password);
                    Statement stmt = con.createStatement();
                    String sql="SELECT * FROM airports";
                    ResultSet rs=stmt.executeQuery(sql);
                    if(rs!=null)
                    {
                        %>
                        <table class="table">
                            <tr>
                                <th>Airport Code</th>
                                <th>Airport Name</th>
                                <th>City Code</th>
                                <th>City Name</th>
                                <th>Country Name</th>
                                <th>Country Code</th>
                            </tr>
                        <%
                        while(rs.next())
                        {
                            out.print("<tr>");
                            for(int i=1;i<=6;i++)
                            out.print("<td>"+rs.getString(i)+"</td>");
                            out.print("</tr>");
                        }
                        %>
                        </table>
                        <%
                    }
    }catch(Exception ex)
    {
        out.println(ex);
    }
%>
</div>
<%@include file="footer.jsp"%>