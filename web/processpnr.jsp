<%-- 
    Document   : processpnr
    Created on : May 23, 2017, 6:27:44 PM
    Author     : Kali
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOm4KJ7Z5m1YewVFaqE3J3SYRXLZ6skNI&callback=myMap"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Luggage Tracking System</title>
        <style>
            .footer {
                position: absolute;
                right: 0;
                bottom: 0;
                left: 0;
                padding: 1rem;

                text-align: center;
            }
        </style>

    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <%  int i = 0;
                String loc_name = null;
                String loc_lat = null;
                String loc_lon = null;
                String pnr1 = (String) request.getParameter("pnr");
                String lname = (String) request.getParameter("lname");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/luggagetrackingsystem";
                    String user = "root";
                    String password = "";
                    Connection con = DriverManager.getConnection(url, user, password);
                    Statement stmt = con.createStatement();
                    String sql = "SELECT * FROM passenger WHERE pnr =" + pnr1;
                    ResultSet rs = stmt.executeQuery(sql);
                    ResultSet rs1;
                    // out.print("<table class=\"table\"");
                    //out.print("<tr><th>PNR</th><th>Frequent Flyer</th><th>Firstname</th><th>Lastname</th></tr>");
                    long pnr = 0;
                    String freq_flyer = null;
                    String p_fname = null;
                    String p_lname = null;
                    while (rs.next()) {
                        freq_flyer = rs.getString("freq_flyer");
                        p_fname = rs.getString("p_fname");
                        p_lname = rs.getString("p_lname");
                        pnr = rs.getLong("pnr");
                    }
                    //out.print("1st query executed<br/>");
                    int loc_id[] = new int[10];
                    String bag_wt[] = new String[10];
                    String bag_tag[] = new String[10];

                    if (p_lname.equalsIgnoreCase(lname)) {
                        //out.print("in if l_name vadu<br/>");
                        sql = "SELECT * FROM bag WHERE pnr='" + pnr + "'";
                        rs = stmt.executeQuery(sql);
                        //int i = 0;
                        //out.print("2nd query<br/>");
                        while (rs.next()) {

                            bag_wt[i] = rs.getString("bag_wt");
                            loc_id[i] = rs.getInt("loc_id");
                            pnr = rs.getLong("pnr");
                            bag_tag[i] = rs.getString("bag_tag");
                            i++;
                        }
                        if (bag_tag[0] != null) {
                            //out.print("if bagtag != null<br/>");
                            for (i = 0; i < bag_tag.length; i++) {
                                sql = "SELECT * FROM location where loc_id=" + loc_id[i];
                                rs1 = stmt.executeQuery(sql);
                                //out.print("query executed");

                                while (rs1.next()) {
                                    loc_name = rs1.getString("loc_name");
                                    loc_lat = rs1.getString("loc_lat");
                                    loc_lon = rs1.getString("loc_lon");
                                    //            out.print(i+"<br/>"+loc_name+"<br/>"+loc_lat+"<br/>"+loc_lon+"<br/>");
                                    if (loc_name != null) {
                                        out.print("<div class=\"page-header\"><h1 class=\"h1\" style=\"font-size: 40px;font-family:arial;color:#333333;opacity: 1;\" align=\"center\">Baggage " + (i + 1) + " Details </h1></div>");
                                        out.print("<table class=\"table jumbotron\">"
                                                + "<th>Passenger Name</th>"
                                                + "<td>" + p_fname + " " + p_lname + "</td>"
                                                + "</tr>"
                                                + "<tr>"
                                                + "<tr>"
                                                + "<th>PNR</th>"
                                                + "<td>" + pnr + "</td>"
                                                + "</tr>"
                                                + "<tr>"
                                                + "<th>Location</th>"
                                                + "<td>" + loc_name + "</td>"
                                                + "</tr>"
                                                + "<tr>"
                                                + "<th>BAG-TAG</th>"
                                                + "<td>" + bag_tag[i] + "</td>"
                                                + "</tr>"
                                                + "<tr>"
                                                + "<tr>"
                                                + "<th>Bag Weight</th>"
                                                + "<td>" + bag_wt[i] + "</td>"
                                                + "</tr>"
                                                + "<tr>"
                                                + "</table>"
                                        );
                                        out.print("<div id=\"googleMap" + (i + 500) + "\" style=\"width:100%;height:400px;\"></div>");
                                        //Thread.sleep(1000);
%>


            <script>
                function myMap() {
                    var myLatLng = {lat: <%=loc_lat%>, lng: <%=loc_lon%>};

                    var map = new google.maps.Map(document.getElementById('googleMap<%=(i + 500)%>'), {
                        zoom: 13,
                        center: myLatLng
                    });

                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        title: '<%=loc_name%>'
                    });
                }
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOm4KJ7Z5m1YewVFaqE3J3SYRXLZ6skNI&callback=myMap"></script>

            <%

                } else {
                    out.println("<h3 align=\"center\" style=\"color:red;\">Location Of Bag Not Found</h3>");
                }
            %>

            <%
                                }

                            }
                        } else {
                            out.println("<h3 align=\"center\" style=\"color:red;\">No Bag Data Found</h3>");
                        }
                    } else {
                        out.println("<h3 align=\"center\" style=\"color:red;\">Last Name Not Matched</h3>");
                    }
                } catch (Exception ex) {
                   
                    //out.print(ex+"<br>");
                    out.print("<h4 align=\"center\" style=\"color:red;\">Error Occured Please <a href=\"index.jsp\" align=\"center\">Click Here</a> To Go To Main Page</h4>");
                    
                }

            %>



        </div>
        <div>
            <%@include file="footer.jsp"%>
        </div>

    </body>
</html>
