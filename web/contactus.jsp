<%-- 
    Document   : contactus
    Created on : May 24, 2017, 1:40:19 PM
    Author     : Kali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <style type="text/css">
            label{
                color: black;
            }
        </style>

    </head>
    <body>
        <%@include file="header.jsp"%>
        <form action="mailto:luggagetrackingsystem@gmail.com" method="post" enctype="text/plain" class="form-group">
            <div class="row">
                    <div class="col-lg-offset-4">
                        <div class="form-group col-lg-6">
                            <label>Enter PNR Number : </label><br/>
                            <input type="text" required="required" placeholder="PNR Number" name="pnr" min="100001" max="199999" maxlength="6" class="form-control"/>
                        </div>
                    </div>
            </div>    
            <div class="row">
                    <div class="col-lg-offset-4">
                        <div class="form-group col-lg-6">
                            <label>Message : </label><br/>
                            <textarea id="email" required="required" rows="3"  class="form-control" placeholder="Type your message here" name="email"></textarea> 
                        </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-offset-4">
                        <div class="form-group col-lg-6">
                            <label>Feedback : </label><br/>
                            <input type="text" placeholder="Feedback (optional)" name="feedback" class="form-control"/> 
                        </div>
                    </div>
            </div>    
            <div class="row">
                    <div class="col-lg-offset-4">
                        <div class="form-group col-lg-6">
                            <input type="submit" value="Send Mail" class="form-control btn btn-primary"/> 
                        </div>
                    </div>
                </div>
        </form>
        <%@include file="footer.jsp"%>
    </body>
</html>
