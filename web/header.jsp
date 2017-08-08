<%--
    Document   : header
    Created on : May 24, 2017, 12:44:51 PM
    Author     : Kali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head><title>LuggageTrackingSystem</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
         
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title><i class="glyphicon glyphicon-camera"></i>Luggage Tracking System</title>
        
        
        <style type="text/css">
            
                  label{
                color: black;
            }
            body{
  overflow-x: hidden;
  overflow-y: scroll;
}


        </style>

            
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
         
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style type="text/css">
            html,body {
                height:100%;
                width:100%;
                position:relative;
            }
            #background-carousel{
                position:fixed;
                width:100%;
                height:100%;
                z-index:-5;
            }
            .carousel,
            .carousel-inner {
                width:100%;
                height:100%;
                z-index:0;
                overflow:hidden;
            }
            .item {
                width:100%;
                height:100%;
                background-position:center center;
                background-size:contain;
                background-repeat: no-repeat;
                z-index:0;
            }

            #content-wrapper {
                position:absolute;
                z-index:1;
                min-width:100%;
                min-height:100%;
            }
            .well {
                opacity:0.85
            }</style>
        <script>
            $('#myCarousel').carousel({
                pause: 'none'
            })
        </script>
    
            
    </head>
    <body id="bodytag">
     
        <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                       <%-- <div class="d-flex justify-content-between hidden-lg-up">--%>
     <a class="navbar-brand" href="index.jsp">
        Luggage Tracking System
      </a>
     
     <button onclick="body1()" class="glyphicon glyphicon-list navbar-toggle navbar-toggler" style="color:white"  type="button" data-toggle="collapse" data-target="#bd-main-nav" aria-controls="bd-main-nav" aria-expanded="false" aria-label="Toggle navigation">
    
         <span class="navbar-toggler-icon"></span>
      </button>
    </div>
                         <%--
                        <div class="navbar-header">
                            <a class="navbar-brand" href="index.jsp">Luggage Tracking System</a>
                        </div>
                       --%>
                        
                <div class="collapse navbar-collapse" id="bd-main-nav">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="nav-item"><a href="index.jsp">Home</a></li>
                            <li class="nav-item"><a href="aboutus.jsp">About Us</a></li>
                            <li class="nav-item"><a href="book.jsp" class="test" data-toggle="tooltip" data-placement="bottom" title="You Will Be Redirected To Google Flight Booking System">Book</a></li>
                            <li class="nav-item"><a href="listairports.jsp">Airports</a></li>
                            <li class="nav-item"><a href="contactus.jsp">Contact Us</a></li>
                            <li class="nav-item"><a href="complain.jsp">Complain</a></li>
                            <li><form class="navbar-form navbar-left" method="get" action="googlesearch.jsp">
                            <div class="input-group">
                                <input type="text" name="search" id="keyword" class="form-control" placeholder="Google Search"/>
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form></li>
                        </ul>
                    </div>
                    </div>
                </nav>
            </div>
        </div>




        <div id="background-carousel" style="opacity:0.2;">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active" style="background-image:url(images/1.png)"></div>
                    <div class="item" style="background-image:url(images/2.png)"></div>
                    <div class="item" style="background-image:url(images/3.png)"></div>
                    <div class="item" style="background-image:url(images/4.png)"></div>
                    <div class="item" style="background-image:url(images/5.png)"></div>
                    <div class="item" style="background-image:url(images/6.png)"></div>
                    <div class="item" style="background-image:url(images/7.png)"></div>
                    <div class="item" style="background-image:url(images/8.png)"></div>
                    <div class="item" style="background-image:url(images/9.png)"></div>
                    <div class="item" style="background-image:url(images/10.png)"></div>
                    <div class="item" style="background-image:url(images/12.png)"></div>
                    <div class="item" style="background-image:url(images/13.png)"></div>
                    <div class="item" style="background-image:url(images/14.png)"></div>
                    <div class="item" style="background-image:url(images/15.png)"></div>
                    <div class="item" style="background-image:url(images/16.png)"></div>
                </div>
            </div>
        </div>
        <style>
    .test + .tooltip > .tooltip-inner {
      background-color: #73AD21; 
      color: #FFFFFF; 
      border: 1px solid green; 
      padding: 15px;
      font-size: 20px;
  }
  /* Tooltip on top */
  .test + .tooltip.top > .tooltip-arrow {
      border-top: 5px solid green;   
  }
  /* Tooltip on bottom */
  .test + .tooltip.bottom > .tooltip-arrow {
      border-bottom: 5px solid blue;
  }
  /* Tooltip on left */
  .test + .tooltip.left > .tooltip-arrow {
      border-left: 5px solid red;
  }
  /* Tooltip on right */
  .test + .tooltip.right > .tooltip-arrow {
      border-right: 5px solid black;
  }
</style>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>

