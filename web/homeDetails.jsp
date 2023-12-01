<%-- 
    Document   : homeDetails
    Created on : May 9, 2019, 12:12:47 AM
    Author     : Fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Benefeciairies</title>
        <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
        alert('any information in application form can be update when login to the system');
    </script>
        <style>
            body{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }
            body::-webkit-scrollbar {
                width: 0.8em;
                background-color: transparent;
            }

            body::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            }

            body::-webkit-scrollbar-thumb {
              background-color: darkgrey;
              outline: 1px solid slategrey;
              border-radius: 10px;
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
            #active1,#active2,#active3{
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
            input[type=text],input[type=password]{
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
                <form action="homeDetails" method="post">
                    <!-- Progressbar -->
                    <ul id="progressbar">
                        <li id="active1">Account</li>
                        <li id="active2">Application Details</li>
                        <li id="active3">Home</li>
                        <li id="active4">Support</li>
                    </ul>
                    <!-- Fieldsets -->
                    <fieldset id="first">
                    <div class="base">
                        Name<br>
                        <div class="fs-subtitle">Your Home Name</div>
                        <input type="text" name="name" required>
                        Address
                        <input type="text" name="address" required>
                        Telephone Number 
                        <input type="text" name="telephone">
                        Mobile/HP 
                        <div class="fs-subtitle">(e.g XXX-XXXXXXXX)</div>
                        <input type="text" name="mobile" pattern="[0-9]{3}-[0-9]{7,8}" title="Mobile No should include numbers only. Mobile No. format e.g. 012-3456789" required>
                        Email 
                        <div class="fs-subtitle">(e.g foodaid@gmail.com)</div>
                        <input type="text" name="email" pattern="[a-z0-9._%+-]+@[a-patz0-9.-]+\.[a-z]{2,}$" required>
                        Fax 
                        <div class="fs-subtitle">(e.g 60-12-34567890)</div>
                        <input type="text" name="fax" title="fax format e.g. 60-12-34567890">
                        Registration Number(SSM)
                        <div class="fs-subtitle">(e.g 012345678912)</div>
                        <input type="text"  name="registration_no" title="Registration No. format e.g. 012345678912">
                        Particulars of the Owners/Directors
                        <input type="text"  name="owner" required>
                        <input type="submit" value="Next">
                    </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>
