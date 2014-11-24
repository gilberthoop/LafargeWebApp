<%-- 
    Document   : registration
    Created on : 28-Oct-2014, 6:01:07 PM
    Author     : 300091186
--%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="/js/jqBootstrapValidation.js"></script>

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
                    <h4 class="modal-title">Lafarge registration system</h4>
                    <h4 class="modal-title"><%=new Date()%></h4>
                    <a href="index.jsp" class="btn btn-info">Login</a>
                </div>
                <div class="col-xs-7 col-sm-4 col-md-4">
                    <a class="brand" href="http://www.lafarge.com/">
                        <img src="http://www.lafarge.com/wps/themes/html/CommonFiles/img/logo-EN.png" alt="">
                    </a>
                </div>
            </div>
            <form name="registrationForm" action="registration" method="POST">
                <div class="form-group">
                    <label for="firstname">First Name:</label>
                    <input type="text" class="form-control" name="firstname" placeholder="Enter first name" required/>  
                </div>
                <div class="form-group">
                    <label for="lastname">Last Name:</label>
                    <input type="text" class="form-control" name="lastname" placeholder="Enter last name" required/>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter e-mail" required/>  
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" name="username" placeholder="Enter username" required/>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter password" pattern=".{8,}" required title="8 characters minimum" required/>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <button type="reset" class="btn btn-info btn-block">Reset</button>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <button type="submit" class="btn btn-success btn-block">Register</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
