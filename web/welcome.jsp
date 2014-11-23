<%-- 
    Document   : welcome
    Created on : 18-Nov-2014, 4:36:28 PM
    Author     : 300091186
--%>

<%@page import="java.util.Date"%>
<%@page import="com.lafarge.logapp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

        <title>Welcome</title>
        <style>
            body{
                background: url(http://mymaplist.com/img/parallax/back.png);
                background-color: #444;
                background: url(http://mymaplist.com/img/parallax/pinlayer2.png),url(http://mymaplist.com/img/parallax/pinlayer1.png),url(http://mymaplist.com/img/parallax/back.png);    
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-5 column well">
                    <div class="row modal-header"> 
                        <div class="col-xs-5 col-sm-7 col-md-7">
                            <h4 class="modal-title">Lafarge registration system</h4>
                            <h4 class="modal-title"><%=new Date()%></h4>
                            <% if (session.getAttribute("userN") == null || (session.getAttribute("userN") == "")) {%>
                            <h4 class="modal-title"><%out.println("The manager on site hasn't logged in!");%></h4> 
                            <a href="index.jsp" class="btn btn-success">Login</a>
                            <%session.setAttribute("welcome", null);
                            } else {%>
                            <h4 class="modal-title"><%out.println("Manager on site: " + session.getAttribute("userN"));%></h4>
                            <form action="logout" method="POST">
                                <button type="submit" class="btn btn-info">Logout</button>
                            </form>
                            <%session.setAttribute("welcome", "welcome");
                                }%>
                        </div>
                        <div class="col-xs-7 col-sm-5 col-md-5">
                            <a class="brand" href="http://www.lafarge.com/">
                                <img src="http://www.lafarge.com/wps/themes/html/CommonFiles/img/logo-EN.png" alt="">
                            </a>
                        </div>
                    </div>

                    <% if (session.getAttribute("welcome") == null || session.getAttribute("welcome") == "") {%>
                    <%//out.println(request.getHeader("referer"));%>
                    <%} else {%>
                    <div class="form-group">
                        <input type="text" class="form-control" name="name" placeholder="Full name" required/>  
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="phoneNumber" placeholder="Phone number" required/>  
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="company" placeholder="Company" required/>  
                    </div>

                    <div class="row">
                        <div class="col-xs-9 col-sm-9 col-md-9">
                            <label for="empty"></label>
                        </div>
                        <div class="col-xs-3 col-sm-3 col-md-3">
                            <button id="add-option" class="btn btn-success btn-block">Sign-in<i class="icon-plus"></i></button>
                        </div>
                    </div>
                    <%}%>
                </div>

                <div class="col-md-1 column">
                </div>


                <% if (session.getAttribute("welcome") == null || session.getAttribute("welcome") == "") {%>
                <%//out.println(request.getHeader("referer"));%>
                <%} else {%>
                <div class="col-md-6 column well">
                    <div class="row form-group">                        
                        <div class="col-xs-10 col-sm-10 col-md-10">
                            <input type="text" class="form-control" name="worker" placeholder="worker's name" required/>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <form action="" method="POST">
                                <button type="submit" class="btn btn-danger">Sign-out</button>
                            </form>
                        </div>
                    </div>
                    <div class="row form-group">                        
                        <div class="col-xs-10 col-sm-10 col-md-10">
                            <input type="text" class="form-control" name="worker" placeholder="worker's name" required/>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <form action="" method="POST">
                                <button type="submit" class="btn btn-danger">Sign-out</button>
                            </form>
                        </div>
                    </div>
                    <div class="row form-group">                        
                        <div class="col-xs-10 col-sm-10 col-md-10">
                            <input type="text" class="form-control" name="worker" placeholder="worker's name" required/>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <form action="" method="POST">
                                <button type="submit" class="btn btn-danger">Sign-out</button>
                            </form>
                        </div>
                    </div>
                 
                    <div class="row form-group">                        
                        <div class="col-xs-10 col-sm-10 col-md-10">
                            <input type="text" class="form-control" name="worker" placeholder="worker's name" required/>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <form action="" method="POST">
                                <button type="submit" class="btn btn-danger">Sign-out</button>                            
                            </form>
                        </div>
                    </div>
                </div>
                <%}%>

            </div>
        </div>
    </body>
</html>
