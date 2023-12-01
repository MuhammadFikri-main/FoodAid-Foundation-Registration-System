<%-- 
    Document   : volunteer
    Created on : May 2, 2019, 2:06:07 PM
    Author     : Fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Volunteer</title>
        <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
        alert('any information in application form can be update when login to the system');
    </script>
        <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src = "http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
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
                width:80%;
                border-radius:5px;
            }
            .base{
                width: 80%;
                margin: 0 auto;
                padding: 20px 0;
            }
            input[type=text],input[type=password],input[type=email]{
                width:98.5%;
                margin: 0px;
                margin-bottom: 13px; 
                height:20px;
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
    </style>
    </head>
    <body>
        <script>
            var check = function() {
            if (document.getElementById('password').value ==
              document.getElementById('confirm-password').value) {
              document.getElementById('msg').style.color = 'green';
              document.getElementById('msg').innerHTML = 'matching';
              document.getElementById('submit').disabled = false;
            } else {
              document.getElementById('msg').style.color = 'red';
              document.getElementById('msg').innerHTML = 'not matching';
              document.getElementById('submit').disabled = true;
            }
          }
        </script>
       <!-- <script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>-->
        <div class="content">
            <!-- Multistep Form -->
            <div class="main">
                    <form action="volunteer" method="post">
                        <a href="index.html"><img src="asset/back.png"></a>
                        <!-- Progressbar -->
                        <ul id="progressbar">
                            <li id="active1">Account</li>
                            <li id="active2">Application Details</li>
                            <li id="active3">Working Experience</li>
                        </ul>
                        
                        <!-- Fieldsets -->
                        <fieldset id="first">
                            <div class="base">
                                <label for="name">Name</label><br>
                                <input type="text" name="name" required><br>
                                <label for="email">Email</label><br>
                                <div class="fs-subtitle">(e.g foodaid@gmail.com)</div>
                                <input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-patz0-9.-]+\.[a-z]{2,}$" required><br>
                                <span id="validate"></span>
                                <label for="nric">NRIC No.</label><br>
                                <div class="fs-subtitle">(e.g XXXXXX-XX-XXXX)</div>
                                <input type="text" name="nric" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" title="NRIC should include numbers only" required><br>
                                <label for="address">Address</label><br>
                                <textarea name="address" required></textarea><br>
                                <label for="contact">Contact No.</label><br>
                                <div class="fs-subtitle">(e.g XXX-XXXXXXXX)</div>
                                <input type="text" name="contact" pattern="[0-9]{3}-[0-9]{7,8}" title="Contact No should include numbers only" required><br>
                                <label for="profession">Profession or Working Experience</label><br>
                                <input type="text" name="profession" required><br>
                                <label for="username">Username</label><br>
                                <div class="fs-subtitle">*This is what you will use to login</div>
                                <input type="text" name="username" required><br>
                                <label for="password">Password</label><br>
                                <input type="password" name="password" id="password" onkeyup='check();' required><br>
                                <label for="confirm-password">Confirm Password</label><br>
                                <div id='msg' class="fs-subtitle"></div>
                                <input type="password" name="confirm-password" id="confirm-password" onkeyup='check();' required><br>
                                <input type="submit" value="Next" id="submit">
                            </div>
                        </fieldset>
                    </form>
            </div>
        </div>
    </body>
</html>
