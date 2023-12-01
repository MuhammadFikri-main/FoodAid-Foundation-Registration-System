<%-- 
    Document   : insertemail
    Created on : May 24, 2019, 3:06:42 PM
    Author     : Nazrul Naim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recovery</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            input[type=submit]{
                border: none;
                padding: 7px;
                background-color: #1E9624;
                color: white;
                width: 20%;
            }
            input[type=email],[type=text]{
                width: 73%;
                height: 20px;
                padding: 5px 10px;
                font-size: 15px;
                border: none;
                background: rgba(136, 126, 126, 0.04);
                border: 2px solid rgba(0, 0, 0, 0.02);
            }
            h2{
                text-align: center;
                font-size: 20px;
                text-transform: uppercase;
                padding: 0;
            }
            h3{
                text-align: center;
                font-size: 15px;
                padding: 0;
            }
            img{
                width: 30px;
            }
            .section .imgback{
                position: absolute;
                z-index: 1;
            }
        </style>
    </head>
    <body>
        <div class="section">
            <a href="index.html" class="imgback"><img src="asset/back.png"></a>
            <h2>forgot password?</h2>
            <h3>recover username and password</h3>
    <form method="post" name="frm" action="forget_password">
        <b>Using Email</b><br>
        <input  type="email" name="email" id="pid">
        <input  type="submit" name="submit" value="Send">
    </form>  
            <div style="text-align:center;padding: 10px">or</div>
            <form method="post" name="frm" action="forget_username">
        <b>Using full Name</b><br>
        <input  type="text" name="name" id="pid">
        <input  type="submit" name="submit" value="Send">
    </form>  
        </div>
    </body>
</html>