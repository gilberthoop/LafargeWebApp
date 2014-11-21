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
    </head>
    <body>
        <div id="login-overlay" class="modal-dialog well">
            <div class="row modal-header"> 
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <h4 class="modal-title">Lafarge registration system</h4>
                    <h4 class="modal-title"><%=new Date()%></h4>
                    <% if (session.getAttribute("userN") == null || (session.getAttribute("userN") == "")) {%>
                    <h4 class="modal-title"><%out.println("The manager on site hasn't logged in!");%></h4>                  
                    <%} else {%>
                    <h4 class="modal-title"><%out.println("Manager on site: " + session.getAttribute("userN"));%></h4>
                    <%}%>
                </div>

                <% if (session.getAttribute("userN") == null || (session.getAttribute("userN") == "")) {%>
                <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="index.jsp" class="btn btn-success btn-block">Login</a>
                </div>
                <%} else {%>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <form action="logout" method="POST">
                        <button type="submit" class="btn btn-info btn-block">Logout</button>
                    </form>
                </div>
                <%session.setAttribute("welcome", "welcome");}%>
            </div>
        </div>
    </body>
</html>