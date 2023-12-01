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
            }
            .content{
                width:80%;
                margin:50px auto;
            }
            .main{
                float:left;
                width:100%;
            }
            #progressbar{
                margin:0;
                padding:0;
                font-size:18px;
                text-align: center;
            }
            #active1{
                color:white;
                background-color: #1E9624;
                padding: 10px;
                border-radius: 4px;
            }
            fieldset{
                display:none;
                width:80%;
                margin: 0 auto;
                margin-top:30px;
                margin-bottom:30px;
                border-radius:10px;
                border: 2px solid #1E9624;
                box-shadow: 5px 10px 8px #888888;
            }
            #first{
                display:block;
                width:50%;
                border-radius:5px;
            }
            .base{
                width: 80%;
                margin: 0 auto;
                padding: 20px 0;
            }
            select{
                width:98.5%;
                margin: 0px;
                margin-bottom: 13px; 
                height:30px;
                padding:5px;
                border: 2px solid #B0BEC5;
                background-color: white;
            }
            textArea{
                width:98.5%;
                margin: 0px;
                margin-bottom: 13px; 
                height:50px;
                padding:5px;
                border: 2px solid #B0BEC5;
                background-color: white;
            }
            input[type=submit]{
                border: none;
                padding: 7px;
                background-color: #1E9624;
                color: white;
                width: 20%;
                float: right;
                transition: border 0.8s ease,color 0.8s,background 0.8s;
            }
            input[type=submit]:hover{
                color: #1E9624;
                border: 2px solid #1E9624;
                background: #ffffff;
            }
            h2,h3{
                text-align:center;
            }
            li{
                margin:30px;
                font-size: 15px;
                display:inline;
                color:#c1c5cc;
            }
            /*headings*/
            .fs-title {
                    font-size: 15px;
                    text-transform: uppercase;
                    color: #2C3E50;
                    margin-bottom: 10px;
            }
            .fs-subtitle {
                    font-weight: normal;
                    font-size: 13px;
                    color: #666;
            }
            img{
                width: 30px;
            }
            #first .imgback{
                position: absolute;
                z-index: 1;
            }
    </style>
    </head>
    <body>
        <fieldset id="first">
            <h2>Contact Us</h2>
                            <div class="base">
                                <form action="contact" method="post">
                                <label for="name">Subject</label><br>
                                <select name="sub" required="">
                                    <option></option>
                                    <option value="report">Report</option>
                                    <option value="Suggestion">Suggestion</option>
                                    <option value="Request">Request</option>
                                </select><br>
                                <label for="msg">Massage</label><br>
                                <textarea name="msg" placeholder="Your Massage Here.." required></textarea><br>
                                <input type="submit" value="Submit" id="submit">
                                </div>
                            </div>
                        </fieldset>
    </body>
</html>