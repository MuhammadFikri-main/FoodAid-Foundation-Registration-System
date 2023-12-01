<%-- 
    Document   : Logout
    Created on : May 10, 2019, 9:21:48 AM
    Author     : Fikri
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
 <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
<style>
            body{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
                text-transform: capitalize;
                background-color: #F5F5F5;
            }
            .section{
                width: 30%;
                margin: 50px auto;
                border: 2px solid #1E9624;
                box-shadow: 5px 10px 8px #888888;  
                background-color: #ffff;
                padding: 10px 10px;
                line-height: 2.3;
            }
            h3{
                text-align: center;
            }
        </style>
</head>
<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    session.invalidate();%>
<body>
        <div class="section">
        <h3>You have been successfully logout</h3>
        <h3><a href="index.html">Go to Login Page</a></h3>
        </div>
</body>
</html>