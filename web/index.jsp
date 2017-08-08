<%-- 
    Document   : index
    Created on : May 23, 2017, 3:24:56 PM
    Author     : Alexevan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<div class="container" style=""> 
    <div class="row">
        <div class="col-lg-12">
            <div class="page-header"><h1 class="h1" style="text-transform: capitalize;font-family:arial;color:#333333;opacity: 1;" align="center">World Baggage Tracking System</h1></div>
        </div>
    </div>
    <form method="post" action="processpnr.jsp">
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
                    <label>Enter Last Name : </label><br/>
                    <input required="required"  type="text" placeholder="Last Name" name="lname" class="form-control test" data-toggle="tooltip" data-placement="right" title="Your Last Name Here"/> 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <input type="submit" value="Track Baggage" class="form-control btn btn-primary test" data-toggle="tooltip" data-placement="right" title="Click Here To Track Your Baggage/s"/> 
                </div>
            </div>
        </div>
    </form>
    <div class="row"><h4 align="center">or</h4></div>
    <form method="post" action="processqr.jsp">
        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <label>Enter Bag Tag Number : </label><br/>
                    <input type="text" required="required" placeholder="Bag Tag Number" maxlength="12" name="code" class="form-control test" data-toggle="tooltip" data-placement="right" title="Enter 12 Digit AlphaNumeric Bag-Tag Here XXXXXXXXXXXX"/> 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <input type="submit" value="Track Baggage" class="form-control btn btn-primary test" data-toggle="tooltip" data-placement="right" title="Click Here To Track a Single Baggage"/> 
                </div>
            </div>
        </div>
    </form>
    <div class="row"><h4 align="center">or</h4></div>
    <form action="qrcode.jsp">
        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <input type="submit" value="Scan Bag Tag"  class="form-control btn btn-primary test" data-toggle="tooltip" data-placement="right" title="Feeling Bored To Write Bag-Tag Scan The Tag Instead!!"/> 
                </div>
            </div>
        </div>
    </form>
</div>
<%@include file="footer.jsp"%>   
</body>
</html>