<%-- 
    Document   : index
    Created on : 28-Oct-2014, 5:53:18 PM
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

        <title>App</title>
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
        <%
            if (session.getAttribute("login") == null || session.getAttribute("login") == "") {
                session.setAttribute("login", null);
                session.setAttribute("userN", null);
                session.setAttribute("registration", null);
            }
        %>
        <div id="login-overlay" class="modal-dialog well">
            <div class="row modal-header">   
                <div class="col-xs-5 col-sm-8 col-md-8">
                    <h4 class="modal-title">Lafarge sign-in system</h4>
                    <h4 class="modal-title"><%=new Date()%></h4>
                </div>
                <div class="col-xs-7 col-sm-4 col-md-4">
                    <a class="brand" href="http://www.lafarge.com/">
                        <img src="http://www.lafarge.com/wps/themes/html/CommonFiles/img/logo-EN.png" alt="">
                    </a>
                </div>
            </div>
            <form role="loginForm" name="loginForm" action="login" method="POST" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="email">Username:</label>
                    <input type="text" class="form-control" name="userName" placeholder="Enter username" required/>  
                </div>
                <div class="form-group">
                    <label for="password">Password: </label>
                    <input type="password" class="form-control" name="password" placeholder="Enter password" required/>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <a href="registration.jsp" class="btn btn-info btn-block">Register</a>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <button type="submit" class="btn btn-success btn-block">Login</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
