<%-- 
    Document   : welcome
    Created on : 18-Nov-2014, 4:36:28 PM
    Author     : 300091186
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.lafarge.members.EmployeesInfo"%>
<%@page import="com.lafarge.members.EmployeesSigninSignoff"%>
<%@page import="java.util.Date"%>
<%@page import="com.lafarge.logapp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <script>
            $(function () {
                $("#names").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            url: "sign_in",
                            type: "POST",
                            dataType: "json",
                            data: {name: request.term},
                            success: function (data) {

                                response($.map(data, function (item) {
                                    return {
                                        label: item.name,
                                        value: item.value,
                                    }
                                }));
                            },
                            error: function (error) {
                                alert('error: ' + error);
                            }
                        });
                    },
                    minLength: 2
                });
            });
        </script>

        <style>
            body{
                background: url(http://mymaplist.com/img/parallax/back.png);
                background-color: #444;
                background: url(http://mymaplist.com/img/parallax/pinlayer2.png),url(http://mymaplist.com/img/parallax/pinlayer1.png),url(http://mymaplist.com/img/parallax/back.png);    
            }
            h6 { 
                display: block;
                font-size: 1.5em;
                //margin-top: 0.5em;
                //margin-bottom: 0.5em;
                margin-left: 0;
                margin-right: 0;
                font-weight: bold;
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
                    <form name="signinForm" action="sign_in" method="POST">
                        <div class="row form-group">
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <label for="email">Fullname</label>
                            </div>
                            <div class="col-xs-10 col-sm-10 col-md-10">
                                <input type="text" class="form-control" name="fullName" id="content" placeholder="Full name" required/>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <label for="email">Phone number</label>
                            </div>
                            <div class="col-xs-10 col-sm-10 col-md-10">
                                <input type="tel" class="form-control" name="phoneNumber" id="content" pattern="^\d{3}\d{3}\d{4}$" placeholder="123 456 7890 (no spaces)" required/> 
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <label for="email">Company</label>
                            </div>
                            <div class="col-xs-10 col-sm-10 col-md-10">
                                <input type="text" class="form-control" name="company" id="content" placeholder="Company" required/>
                            </div>
                        </div>

             <!---          -->
                        <div class="row">
                            <div class="col-xs-9 col-sm-9 col-md-9">
                                <label for="empty"></label>
                            </div>
                            <div class="col-xs-8 col-sm-8 col-md-8">
                                <a href="orientation.jsp" class="btn btn-info btn-block">Orientation Required</a>
                            </div>
                            <!---          -->
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <button type="submit" class="btn btn-success btn-block">Sign-in</button>
                            </div>
                        </div>
              <!---          -->
                     
               <!---          -->
                     <%}%>
                    </form>
                 <!---          -->
                     
                </div>

                <div class="col-md-1 column">
                </div>

                <% if (session.getAttribute("welcome") == null || session.getAttribute("welcome") == "") {%>
                <%//out.println(request.getHeader("referer"));%>
                <%} else {%>
                <div id="flash" class=" col-xs-12 col-sm-10 col-md-6 column well">
                    <%
                        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                        Session sess = sessionFactory.openSession();
                        sess.beginTransaction();
                        try {

                            Query query = sess.createQuery("from EmployeesSigninSignoff ORDER BY SignInTime desc");
                            List<EmployeesSigninSignoff> list = query.list();
                            for (EmployeesSigninSignoff ei : list) {
                                System.out.println(ei.getFullName());
                    %>
                    <div id="update" class="row form-group">                        
                        <div class="col-xs-9 col-sm-10 col-md-10 label label-primary">
                            <h6 class="text-left" style="text-align:left;float:left;"><%=ei.getFullName()%> - <%=ei.getCompany()%></h6><h6 style="text-align:right;float:right;"><%=DateFormat.getTimeInstance(DateFormat.MEDIUM).format(ei.getSignInTime())%></h6> 
                        </div>
                        <div class="col-xs-3 col-sm-2 col-md-2">
                            <form action="sign_out" method="POST">
                                <button type="submit" name="logoutWorker" value ="<%=ei.getPhoneNumber()%>" class="btn btn-danger">Sign-out</button>
                            </form>
                        </div>
                    </div>
                    <%}

                        } finally {
                            sess.getTransaction().commit();
                            sess.close();
                        }
                    %>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
