<%-- 
    Document   : processqr
    Created on : May 23, 2017, 6:27:26 PM
    Author     : Kali
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@include file="header.jsp"%>
        <div class="container">
        <%
            String qr=(String)request.getParameter("code");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/luggagetrackingsystem";
                String user="root";
                String password="";
                Connection con=DriverManager.getConnection(url, user, password);
                Statement stmt=con.createStatement();
                String sql="SELECT * FROM bag WHERE bag_tag='"+qr+"'";
                ResultSet rs=stmt.executeQuery(sql);
                //out.print("query executed");
                int loc_id=0;
                String bag_wt=null;
                long pnr=0;
                while (rs.next()) {
                   bag_wt=rs.getString("bag_wt");
                   loc_id=rs.getInt("loc_id");
                   pnr=rs.getLong("pnr");
                }
                //out.print(bag_wt+" "+loc_id+" "+pnr);
                sql="SELECT * FROM location where loc_id="+loc_id;
                rs=stmt.executeQuery(sql);
                //out.print("query executed");
                String loc_name=null;
                String loc_lat=null;
                String loc_lon=null;
                
                while(rs.next())
                {
                    loc_name=rs.getString("loc_name");
                    loc_lat=rs.getString("loc_lat");
                    loc_lon=rs.getString("loc_lon");
                }
                if(loc_name!=null){
                    out.print("<div class=\"page-header\"><h1 class=\"h1\" style=\"font-size: 40px;font-family:arial;color:#333333;opacity: 1;\" align=\"center\">Baggage  Details </h1></div>");
                out.print("<table class=\"table jumbotron\">"
                        + "<tr>"
                        + "<th>PNR</th>"
                        + "<td>"+pnr+"</td>"
                        + "</tr>"
                        + "<tr>"
                        + "<th>Location</th>"
                        + "<td>"+loc_name+"</td>"
                        + "</tr>"
                        + "<tr>"
                        + "<th>BAG-TAG</th>"
                        + "<td>"+qr+"</td>"
                        + "</tr>"
                        + "<tr>"
                        + "</table>"
                        
                );
                %>
                <div id="googleMap" style="width:100%;height:400px;"></div>
                

<script>



function myMap() {
  var myLatLng = {lat: <%=loc_lat%>, lng: <%=loc_lon%>};

  var map = new google.maps.Map(document.getElementById('googleMap'), {
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
                }
                else{
             out.println("<h3 align=\"center\" style=\"color:red;\">Location Of Bag Not Found. <a href=\"index.jsp\">Click Here</a> To Go To Main Page</h3>");       
                }
                %>
                
<%
            }catch(Exception ex)
            {
                out.print(ex);
            }
        
        %>
    </div>
        <div>
        <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
