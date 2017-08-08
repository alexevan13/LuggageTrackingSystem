<%-- 
    Document   : complain
    Created on : May 24, 2017, 1:40:34 PM
    Author     : Kali
--%>
<%@include file="header.jsp" %>
<div class="container">
    <form method="post" action="processcomplain.jsp">
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
                    <label>Enter Subject : </label><br/>
                    <input required="required"  type="text" placeholder="Subject" name="subject" class="form-control test" data-toggle="tooltip" data-placement="right" title="About What Service You Have The Complain?"/> 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <label>Enter Email : </label><br/>
                    <input required="required"  type="email" placeholder="Subject" name="email" class="form-control test" data-toggle="tooltip" data-placement="right" title="The Email On Which We Can Contact You"/> 
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <label>Enter Your Complain : </label><br/>
                    <textarea rows="5" name="message" required="required"  type="text" placeholder="Please Describe Your Problem In Detail" class="form-control test" data-toggle="tooltip" data-placement="right" title="How can we help you?"></textarea> 
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-offset-4">
                <div class="form-group col-lg-6">
                    <input type="submit" value="Register Your Complain" class="form-control btn btn-primary test" data-toggle="tooltip" data-placement="right" title="We will assist you within 48 hours"/> 
                </div>
            </div>
        </div>
    </form>
</div>
<%@include file="footer.jsp" %>
