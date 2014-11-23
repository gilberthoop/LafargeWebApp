<%-- 
    Document   : error
    Created on : Nov 22, 2014, 7:14:30 PM
    Author     : clementino
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

        <title>Error</title>
        <style>
            body{
                background: url(http://pixabay.com/static/uploads/blog/post/2012/05/30/10-17-57-227_640.jpg);
                background-color: #444;
                //background: url(http://mymaplist.com/img/parallax/pinlayer2.png),url(http://mymaplist.com/img/parallax/pinlayer1.png),url(http://mymaplist.com/img/parallax/back.png);    
            }
        </style>
    </head>
    </head>
    <body>
        <div id="login-overlay" class="modal-dialog well">
            <div class="modal-header">      
                <h4 class="modal-title">Lafarge sign-in system</h4>
                <h4 class="modal-title"><%=new Date()%></h4>
            </div>
            <div class="alert alert-danger"><% out.println("Looks likes something went wrong! Just a second while we fix that..."); %></div>
        </div>    
        <%response.setHeader("Refresh", "5; URL=" + request.getContextPath() + "/welcome.jsp");%>
    </body>
</html>
