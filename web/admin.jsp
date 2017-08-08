<%-- 
    Document   : admin
    Created on : May 30, 2017, 12:15:03 PM
    Author     : Kali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<form method="post" action="processadmin.jsp">
        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <label>Admin : </label><br/>
                    <input required="required" autofocus="true" type="text" placeholder="Username" name="adminName" class="form-control test" data-toggle="tooltip" data-placement="right" title="Admin Name Given By The Company"/> 
                </div>
            </div>
        </div>
    <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <label>Password : </label><br/>
                    <input required="required" autofocus="true" type="password" placeholder="Password" name="password" class="form-control test" data-toggle="tooltip" data-placement="right" title="Admin Password Here"/> 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <input type="submit" value="Submit" class="form-control btn btn-primary test" data-toggle="tooltip" data-placement="right" title="Submit"/> 
                </div>
            </div>
        </div>
</form>
<%@include file="footer.jsp" %>
