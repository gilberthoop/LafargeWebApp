<%-- 
    Document   : login_failed
    Created on : Nov 20, 2014, 8:43:25 PM
    Author     : clementino
--%>
<%@page import="com.lafarge.logapp.*"%>
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

        <title>Alert</title>
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
            <div class="modal-header">      
                <h4 class="modal-title">Lafarge sign-in system</h4>
                <h4 class="modal-title"><%=new Date()%></h4>
            </div>
            <%//out.println(request.getHeader("referer")+" "+session.getAttribute("login")+" "+session.getAttribute("registration"));%>
            <% if ((request.getHeader("referer").contains("LafargeLogApp") || request.getHeader("referer").contains("index")) && (session.getAttribute("login") == null && session.getAttribute("registration") == null)) {%>
            <div class="alert alert-danger">Invalid username or password <a href='index.jsp'>try again</a></div>
            <%} else if ((request.getHeader("referer").contains("/") || request.getHeader("referer").contains("index")) && session.getAttribute("login") != null && session.getAttribute("userN") != null) {%>
            <div class="alert alert-success">Login successful! Please wait...<%response.setHeader("Refresh", "3; URL=" + request.getContextPath() + "/welcome.jsp");%></div>
            <%} else if (request.getHeader("referer").contains("registration") && (session.getAttribute("login") == null && session.getAttribute("registration") != null)) {%>
            <div class="alert alert-success">Registration successful! Login <a href='index.jsp'>here</a></div> 
            <%} else if (request.getHeader("referer").contains("registration") && (session.getAttribute("login") == null && session.getAttribute("registration") == null)) {%>
            <div class="alert alert-danger">Registration Failed! <a href='index.jsp'>try again</a></div> 
            <%} else{%>
            <div class="alert alert-warning"><% out.println("<a href='http://www.lafarge.com/'>Visit Lafarge's Website</a> or click <a href='index.jsp'>here</a>  to return to the log in system."); %></div> 
            <%}%>
        </div>
    </body>
</html>
