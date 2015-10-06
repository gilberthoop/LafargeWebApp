<%-- 
    Document   : orientation
    Created on : 12-Dec-2014, 8:57:36 PM
    Author     : merlyn
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="/js/jqBootstrapValidation.js"></script>

        <title>Orientation Update</title>
        <script>
            $(function () {
                $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
            });
        </script>
        <style>
            body{
                background: url(http://mymaplist.com/img/parallax/back.png);
                background-color: #444;
                background: url(http://mymaplist.com/img/parallax/pinlayer2.png),url(http://mymaplist.com/img/parallax/pinlayer1.png),url(http://mymaplist.com/img/parallax/back.png);    
            }
        </style>
    </head>
    <body>
        <div id="login-overlay" class="modal-dialog well">
            <div class="row modal-header"> 
                <div class="col-xs-5 col-sm-8 col-md-8">
                    <h4 class="modal-title">Validate Orientation</h4>
                    <h4 class="modal-title"><%=new Date()%></h4>
                </div>
                <div class="col-xs-7 col-sm-4 col-md-4">
                    <a class="brand" href="http://www.lafarge.com/">
                        <img src="http://www.lafarge.com/wps/themes/html/CommonFiles/img/logo-EN.png" alt="">
                    </a>
                </div>
            </div>
            <form name="orientationForm" action="orientation" method="POST" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" class="form-control" name="fullName" placeholder="Full Name" required/>  
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" class="form-control" name="phoneNumber" placeholder="Phone Number" required/>
                </div>
                <div class="form-group">
                    <label for="company">Company:</label>
                    <input type="text" class="form-control" name="company" placeholder="Company" required/>
                </div>
                <div class=form-group">
                    <label for="allowLogin">Allowed to Login?:</label>
                    <input type="text" class="form-control" name="allowLogin" placeholder="Yes or No" required/>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9">
                    <label for="empty"></label>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <button type="reset" class="btn btn-info btn-block">Reset</button>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <button type="submit" class="btn btn-success btn-block">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
