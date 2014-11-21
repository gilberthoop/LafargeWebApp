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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="/js/jqBootstrapValidation.js"></script>

        <title>Registration</title>
        <script>
            $(function () {
                $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
            });
        </script>
    </head>
    <body>
        <div id="login-overlay" class="modal-dialog well">
            <div class="row modal-header"> 
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <h4 class="modal-title">Lafarge registration system</h4>
                    <h4 class="modal-title"><%=new Date()%></h4>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <a href="index.jsp" class="btn btn-info btn-block">Login</a>
                </div>
            </div>
            <form role="registrationForm" name="registrationForm" action="registration" method="POST" onsubmit="return validateForm()">
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
