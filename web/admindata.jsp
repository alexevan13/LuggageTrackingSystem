<%-- 
    Document   : admindata
    Created on : May 30, 2017, 1:42:28 PM
    Author     : Kali
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%!static int counter = 0;%>
<%

    String adminname = "";
    adminname = (String) session.getAttribute("adminname");
    if (adminname != "") {
        counter++;
        out.println("<h3 align=\"center\" style=\"color:green;\">Login Sucessful</h3>");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/luggagetrackingsystem";
            String user = "root";
            String password = "";
            out.print("DB Connected");
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet rs;
            String sql;

%>
<div class="container">

    <div class="row">
        <div class="col-lg-12">
            <div class="page-header"><h1 class="h1" style="text-transform: capitalize;font-family:arial;color:#333333;opacity: 1;" align="center">Welcome <%=adminname%></h1></div>
        </div>
    </div>


    <div class="panel panel-success">
        <div class="panel-heading"><center> Update Status</center></div>

        <div class="panel-body">
            <form method="post" action="admindata.jsp">
                <div class="row">
                    <div class="col-lg-offset-4">
                        <div class="form-group col-lg-6">
                            <label>Enter PNR Number : </label><br/>
                            <input required="required" autofocus="true" type="text" min="100001" max="199999" maxlength="6" placeholder="PNR Number" name="pnr" class="form-control test" data-toggle="tooltip" data-placement="right" title="6 Digit PNR Number Here XXXXXX "/> 
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-offset-4">
                        <div class="form-group col-lg-6">
                            <label>Enter Status : </label><br/>
                            <input required="required" autofocus="true" type="text" min="1" max="3" maxlength="1" placeholder="Status Number" name="status" class="form-control test" data-toggle="tooltip" data-placement="right" title="Enter Status ID......  1. Solved 2. Pending 3. Working "/> 
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-offset-4">
                        <div class="form-group col-lg-6">
                            <input type="submit" value="Update Status" class="form-control btn btn-primary test" data-toggle="tooltip" data-placement="right" title="Click To Update Status Of Passenger"/> 
                        </div>
                    </div>
                </div>
            </form>

            <form action="adminlogout.jsp">
                <div class="row">
                    <div class="col-lg-offset-4">
                        <div class="form-group col-lg-6">
                            <input type="submit" class="form-control btn btn-primary test" data-toggle="tooltip" data-placement="right" title="Logout" value="Logout"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="container">

    <div class="row">
        <div class="col-lg-12">
            <div class="page-header"><h2 class="h2" style="text-transform: capitalize;font-family:arial;color:#333333;opacity: 1;" align="center" >Complains</h2></div>
        </div>
    </div>
    <table class="table jumbotron">
        <tr>
            <th>Complain ID</th>
            <th>Status</th>
            <th>Subject</th>
            <th>PNR</th>
            <th>Message</th>
            <th>Email</th>
            <th>Date Of Complain</th>
        </tr>
        <%          String sid = null, pnr = null;
                    if (counter != 1) {
                        //out.print("Inside if ");
                        if (request.getParameter("status") != null) {
                            sid = (String) request.getParameter("status");
                            pnr = (String) request.getParameter("pnr");
                            sql = "UPDATE complain SET status_id=" + sid.trim() + " WHERE pnr = " + pnr.trim() + ";";
                           // out.print("Update Query Set ");
                            out.print("<h3 align=\"center\" style=\"color:white; background-color:green;\">" + stmt.executeUpdate(sql) + " Status Updated</h3>");
                        }
                    }
                    sql = "SELECT * FROM complain";
                    //out.println("Select Query Set");
                    rs = stmt.executeQuery(sql);
                    String status;
                    while (rs.next()) {
                        //out.print("inside other while");
                        int i = rs.getInt("status_id");
                        if (i == 1) {
                            status = "CONFIRM";
                        } else if (i == 2) {
                            status = "PENDING";
                        } else if (i == 3) {
                            status = "WORKING";
                        } else {
                            status = "UNDEFINED";
                        }

                        out.print("<tr><td>" + rs.getInt("c_id") + "</td><td>" + status + "</td><td>" + rs.getString("subject") + "</td><td>" + rs.getLong("pnr") + "</td><td>" + rs.getString("message") + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getTimestamp("c_date") + "</td></tr>");
                    }
                    
                } catch (Exception ex) {
                    out.print(ex);
                }
        //out.print("You Visited This Page For " + counter + " Times");
            } else {
                out.println("<h3 align=\"center\" style=\"color:red;\">Error In Login <a href=\"admin.jsp\">Click Here</a> to Login again</h3>");

            }
        %>

        <%         /* String status;      
                  
                    
             }
             catch (Exception ex) {
             out.print(ex);
                   
             }

             }*/

        %>
    </table>
</div>
<%@include file="footer.jsp" %>
