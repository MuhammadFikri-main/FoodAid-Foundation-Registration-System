<%-- 
    Document   : volunteerDetails
    Created on : May 8, 2019, 11:56:15 AM
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
            #active2,#active1{
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
                width: 100%;
            }
            table td{
                height: 30px;
            }
            input[type=text],input[type=password]{
                width:100%;
                margin:10px 0;
                height:20px;
                padding:5px;
                border:1px solid black;
                background-color: white;
                border-radius:4px;
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
        <script>
            function showhideee(show){
                var box00 = document.getElementById("box00");
                var box5 = document.getElementById("box5");
                box00.style.display = show.checked ? "block" : "none";
                box5.style.display = show.checked ? "block" : "none";
            }
            function showhide(showform){
                if (showform=="Yes"){
                    document.getElementById("box1").style.display = "block";
                    document.getElementById("box").style.display ="block";
                    document.getElementById("box2").style.display = "none";
                }
                if (showform=="No"){
                    document.getElementById("box1").style.display = "none";
                    document.getElementById("box2").style.display = "none";
                    document.getElementById("box").style.display ="none";
                }
            }
            function showhidee(showform){
                if (showform=="Yes"){
                    document.getElementById("box3").style.display = "block";
                    document.getElementById("box4").style.display = "none";
                    document.getElementById("box0").style.display ="block";
                }
                if (showform=="No"){
                    document.getElementById("box3").style.display = "none";
                    document.getElementById("box4").style.display = "none";
                    document.getElementById("box0").style.display ="none";
                }
            }
        </script>
        <div class="content">
            <!-- Multistep Form -->
            <div class="main">
                    <form action="volunteerDetails" method="post">
                        <!-- Progressbar -->
                        <ul id="progressbar">
                            <li id="active1">Create Account</li>
                            <li id="active2">Application Details</li>
                            <li id="active3">Working Experience</li>
                        </ul>
                        <!-- Fieldsets -->
                        <fieldset id="first">
                            <div class="base">
                                <table>
                                    <tr>
                                        <td>Have You Done Any Voluntary Work ?</td>
                                        <td>
                                            <input type="radio" id="showform" name="voluntary_work" value="Yes" onchange="showhide(this.value)" required> Yes
                                            <input type="radio" id="showform" name="voluntary_work" value="No" onchange="showhide(this.value)">No
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Are you a member of any NGO ?</td>
                                        <td>
                                            <input type="radio" id="showform" name="member_of_ngo" value="Yes" onchange="showhidee(this.value)" required> Yes
                                            <input type="radio" id="showform" name="member_of_ngo" value="No" onchange="showhidee(this.value)">No
                                            <label id="box0" style="display:none;">(state)</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Do you have any experience in food handling ?</td>
                                        <td>
                                            <input type="radio" name="foodhandling_exp" value="Yes" required> Yes
                                            <input type="radio" name="foodhandling_exp" value="No">No
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Do you have your transport ? </td>
                                        <td>
                                            <input type="radio" name="transport" value="Yes" required> Yes
                                            <input type="radio" name="transport" value="No">No
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Area Of Interest</td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td><input type="checkbox" CHECKED name="interest" value="Fund Raising"> Fund Raising</td>
                                                    <td><input type="checkbox" name="interest" value="Admin"> Admin</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" name="interest" value="Event Organising"> Event Organising</td>
                                                    <td><input type="checkbox" name="interest" value="Communication"> Communication</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" name="interest" value="Food Raising"> Food Raising</td>
                                                    <td><input type="checkbox"  id="show" name="interest" value="Other" onclick="showhideee(this)"> Other</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><input type="submit" value="Next"></td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                    </form>
            </div>
        </div>
    </body>
</html>
