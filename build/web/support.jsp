<%-- 
    Document   : support
    Created on : May 9, 2019, 11:21:49 AM
    Author     : Fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Benefeciairies</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
        $( function() {
          $( "#datepicker" ).datepicker({
              dateFormat: 'dd-mm-yy',
            changeMonth: true,
            changeYear: true
          });
        } );
        $( function() {
          $( "#datepicker2" ).datepicker({
              dateFormat: 'dd-mm-yy',
            changeMonth: true,
            changeYear: true
          });
        } );
        </script>
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
            #active2,#active1,#active3,#active4{
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
                border-radius:5px;
                border: 2px solid #1E9624;
                box-shadow: 5px 10px 8px #888888;
            }
            #first{
                display:block;
                width:80%;
                border-radius:5px;
            }
            .base{
                width: 80%;
                margin: 0 auto;
                padding: 20px 0;
            }
            table{
                border: 2px solid red;
                width: 100%;
            }
            table td{
                height: 30px;
            }
            input[type=text],input[type=year]{
                width:98.5%;
                margin: 0px;
                margin-bottom: 13px; 
                height:20px;
                padding:5px;
                border:2px solid #B0BEC5;
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
    </style>
    </head>
    <body>
        <div class="content">
            <!-- Multistep Form -->
            <div class="main">
                    <form action="support" method="post">
                        <!-- Progressbar -->
                        <ul id="progressbar">
                            <li id="active1">Account</li>
                            <li id="active2">Application Details</li>
                            <li id="active3">Home</li>
                            <li id="active4">Support</li>
                        </ul>
                        
                        <!-- Fieldsets -->
                        <fieldset id="first">
                            <h2 class="fs-title"></h2>
                            <h3 class="fs-subtitle">*user may include (-) sign to unnecessary column</h3>
                            <div class="base">
                                Name<br>
                                <div class="fs-subtitle">*Individual name that support your home </div>
                                <input type="text" name="name" required><br>
                                From<br>
                                <div class="fs-subtitle">(e.g. dd-mm-yyyy)</div>
                                <input type="text" name="date_from" id="datepicker" title="Year only e.g. YYYY" required><br>
                                To<br>
                                <div class="fs-subtitle">(e.g. dd-mm-yyyy)</div>
                                <input type="text" name="date_to" id="datepicker2" title="Year only e.g. YYYY" required><br>
                                Type Of Donation<br><input type="text" name="type_of_donation" required><br>
                                <input type="submit" value="Submit">
                            </div>
                        </fieldset>
                        </form>
            </div>
        </div>
    </body>
</html>
