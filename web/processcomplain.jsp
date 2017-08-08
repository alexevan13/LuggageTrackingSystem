
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@page import="java.sql.*"%>
    <div class="container">
    <%
        String pnr=(String)request.getParameter("pnr");
        String lname=(String)request.getParameter("lname");
        String message=(String)request.getParameter("message");
        String subject=(String)request.getParameter("subject");
        String email=(String)request.getParameter("email");
        try {
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/luggagetrackingsystem";
                    String user = "root";
                    String password = "";
                    //out.print("DB Connected");
                    Connection con = DriverManager.getConnection(url, user, password);
                    Statement stmt = con.createStatement();
                   
                    String sql = "SELECT * FROM passenger WHERE pnr ='"+pnr+"'" ;
                    ResultSet rs = stmt.executeQuery(sql);
                    
                    int flag=0;
                    
                    while(rs.next())
                    {
                       
                        long pnr1=rs.getLong("pnr");
                        java.util.Date date = new java.util.Date();

            String formatted = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
                            if(rs.getString("p_lname").equalsIgnoreCase(lname))
                            {
                                sql="INSERT INTO complain (`subject`,`pnr`,`message`,`email`,`status_id`,`c_date`) values(\""+subject+"\","+pnr1+",\""+message+"\",\""+email+"\""+",\""+2+"\""+",\""+formatted+"\");";
                      //          out.print("Next Query Set");
                                flag=1;
                            }else{
                                out.println("<h3 align=\"center\" style=\"color:red;\">Last Name Doesnt Match <a href=\"complain.jsp\">Click Here</a> to try again</h3>");
                                flag=2;
                                break;
                            }
                        }
                        if(flag==0)
                       out.println("<h3 align=\"center\" style=\"color:red;\">PNR Doesnt Exists <a href=\"complain.jsp\">Click Here</a> to try again</h3>"); 
                    
                    if(flag==1){
                        sql="SELECT * FROM complain WHERE pnr='"+pnr+"'";
                        rs=stmt.executeQuery(sql);
                        while(rs.next()){
                            flag=3;
                    }
                        if(flag!=3){
                        stmt.executeUpdate(sql);
                    //out.print("Query Executed");
                    out.print("<h3 align=\"center\" style=\"color:blue;\">We Have Recorded Your Complain</h3><br/><h4 align=\"center\">Our Technical Team Will Respond You on Your Given Email</h4>");
                    }else if(flag==3){
                           out.print("<h3 align=\"center\" style=\"color:green;\">You Have Already Submitted Your Complain. The Complain Is In Process.</h3><br/><h4 align=\"center\">Our Technical Team Will Respond You on Your Given Email</h4>");
                     
                        }
                    }
        }catch(Exception ex)
        {
            System.out.println(ex);
        }
        %>
    </div>
        <%@include file="footer.jsp" %>