<!DOCTYPE html>
<html>
    <head>

        <title>Luggage Tracking System</title>

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
        
        <style type="text/css">
            .scanner-laser{
                position: absolute;
                margin: 40px;
                height: 30px;
                width: 30px;
            }
            .laser-leftTop{
                top: 0;
                left: 0;
                border-top: solid red 5px;
                border-left: solid red 5px;
            }
            .laser-leftBottom{
                bottom: 0;
                left: 0;
                border-bottom: solid red 5px;
                border-left: solid red 5px;
            }
            .laser-rightTop{
                top: 0;
                right: 0;
                border-top: solid red 5px;
                border-right: solid red 5px;
            }
            .laser-rightBottom{
                bottom: 0;
                right: 0;
                border-bottom: solid red 5px;
                border-right: solid red 5px;
            }
        </style>
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
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="jumbotron">
                <h3 align="center">Please Allow Access To WebCam and Place Your Bag Tag In Front Of Your WebCam</h3>
                <h5 align="right">First Of All Press The Play Button Below</h5>
            </div>
            <div id="QR-Code" class="container" style="width:100%">
                <div class="panel panel-primary">
                    <div class="panel-heading" style="display: inline-block;width: 100%;">
                        <div style="width:50%;float:right;margin-top: 5px;margin-bottom: 5px;text-align: right;">
                            <select id="cameraId" class="form-control" style="display: inline-block;width: auto;"></select>
                            <button id="save" data-toggle="tooltip" title="Image shoot" type="button" class="btn btn-info btn-sm disabled"><span class="glyphicon glyphicon-picture"></span></button>
                            <button id="play" data-toggle="tooltip" title="Play" type="button" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-play"></span></button>
                            <button id="stop" data-toggle="tooltip" title="Stop" type="button" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-stop"></span></button>
                            <button id="stopAll" data-toggle="tooltip" title="Stop streams" type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-stop"></span></button>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-6" style="text-align: center;">
                            <div class="well" style="position: relative;display: inline-block;">
                                <canvas id="qr-canvas" width="320" height="240"></canvas>
                                <div class="scanner-laser laser-rightBottom" style="opacity: 0.5;"></div>
                                <div class="scanner-laser laser-rightTop" style="opacity: 0.5;"></div>
                                <div class="scanner-laser laser-leftBottom" style="opacity: 0.5;"></div>
                                <div class="scanner-laser laser-leftTop" style="opacity: 0.5;"></div>
                            </div>
                            <div class="well" style="position: relative;" >
                                <label id="zoom-value" width="100">Zoom: 2</label>
                                <input type="range" id="zoom" value="20" min="10" max="30" onchange="Page.changeZoom();"/>
                                <label id="brightness-value" width="100">Brightness: 0</label>
                                <input type="range" id="brightness" value="0" min="0" max="128" onchange="Page.changeBrightness();"/>
                                <label id="contrast-value" width="100">Contrast: 0</label>
                                <input type="range" id="contrast" value="0" min="0" max="64" onchange="Page.changeContrast();"/>
                                <label id="threshold-value" width="100">Threshold: 0</label>
                                <input type="range" id="threshold" value="0" min="0" max="512" onchange="Page.changeThreshold();"/>
                                <label id="sharpness-value" width="100">Sharpness: off</label>
                                <input type="checkbox" id="sharpness" onchange="Page.changeSharpness();"/>
                                <label id="grayscale-value" width="100">grayscale: off</label>
                                <input type="checkbox" id="grayscale" onchange="Page.changeGrayscale();"/>
                            </div>
                        </div>
                        <div class="col-md-6" style="text-align: center;">
                            <div id="result" class="thumbnail">
                                <div class="well" style="position: relative;display: inline-block;">
                                    <img id="scanned-img" src="" width="320" height="240">
                                </div>
                                <div class="caption">
                                    <h3>Scanned result</h3>
                                    <form action="processqr.jsp" method="get">
                                        <p id="scanned-QR"  name="qr"></p>
                                        <input type="text" id="code" name="code" class="form-control test"  data-toggle="tooltip" data-placement="top"  title="Just Press The Submit Button After Scanning The Tag .... No Need To Copy Paste"  autofocus="true"/>
                                        <input type="submit" class="btn btn-success" value="Submit" onclick="copy()"/>
                                    </form>
                                    <script>
            function copy()
            {
                document.getElementById("code").value=document.getElementById("scanned-QR").innerHTML;
            }
        </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/qrcodelib.js"></script>
        <script type="text/javascript" src="js/WebCodeCam.js"></script>
        <script type="text/javascript" src="js/main.js"></script>
        
        <%@include file="footer.jsp"%>
    </body>

</html>