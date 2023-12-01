<%-- 
    Document   : event
    Created on : May 7, 2019, 11:24:04 AM
    Author     : Fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>event!</h1>
        <form action="event" method="post">
        event : <input type="text" name="name"><br>
        address : <input type="text" name="address"><br>    
        date : <input type="date" name="date"><br>
        start : <input type="time" name="start"><br>
        end : <input type="time" name="end"><br>
        <input type="submit" value="submit">
        </form>
    </body>
</html>
