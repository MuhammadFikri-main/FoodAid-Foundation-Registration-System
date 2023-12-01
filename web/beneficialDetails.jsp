<%-- 
    Document   : beneficialDetails
    Created on : May 9, 2019, 12:08:44 AM
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
            table td{
                height: 30px;
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
        <script>
            function showhideee(show){
                var box00 = document.getElementById("box00");
                var box5 = document.getElementById("box5");
                box00.style.display = show.checked ? "block" : "none";
                box5.style.display = show.checked ? "block" : "none";
            }
            function showwhideee(show){
                var box01 = document.getElementById("box01");
                var box6 = document.getElementById("box6");
                box01.style.display = show.checked ? "block" : "none";
                box6.style.display = show.checked ? "block" : "none";
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
        <form action="beneficialDetails" method="post">
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
            <table>
                <tr>
                    <td>Type of Home</td>
                    <td>
                        <input type=checkbox name="type_of_home" value="ORPHANAGE" checked="">ORPHANAGE <br>
                        <input type=checkbox name="type_of_home" value="SPECIAL CARE CENTER FOR DISABLED PEOPLE">SPECIAL CARE CENTER FOR DISABLED PEOPLE<br>
                        <input type=checkbox name="type_of_home" value="SHELTER FOR HOMELESS PEOPLE">SHELTER FOR HOMELESS PEOPLE<br>
                        <input type=checkbox name="type_of_home" value="HOME FOR ABUSED MOTHERS – and their children">HOME FOR ABUSED MOTHERS-and their children <br>
                        <input type=checkbox name="type_of_home" value="REFUGEE CENTER">REFUGEE CENTER <br>
                        <input type=checkbox name="type_of_home" value="SOUP KITCHEN">SOUP KITCHEN<br>
                        <input type=checkbox name="type_of_home" value="OLD FOLKS HOME">OLD FOLKS HOME<br>
                        <input type=checkbox id="show" name="type_of_home" value="Others" onclick="showwhideee(this)">Others<br>
                    </td>
                    </tr>
                    <tr>
                        <td>How many home residents do you have currently?</td>
                        <td><input type="text" name="no_of_people" pattern="[0-9]{0,}" title="Should contain number only" required></td>
                    </tr>
                     <tr>
                         <td>How old are the home resident?</td>
                        <td>
                            <input type=checkbox name="age" value="0-6" checked="">0-6
                            <input type=checkbox name="age" value="7-12">7-12
                            <input type=checkbox name="age" value="13-18">13-18<br>
                            <input type=checkbox name="age" value="19-25">19-25
                            <input type=checkbox name="age" value="26-50">26-50
                            <input type=checkbox name="age" value=">50">>50
                        </td>
                    </tr>
                    <tr>
                        <td> Gender of the home Residents</td>
                        <td>
                            <input type="checkbox" name="gender" value="Male" checked>Male
                            <input type="checkbox" name="gender" value="Female">Female
                        </td>
                    </tr>
                    <tr>
                        <td>How many workers / volunteers do you have?</td>
                        <td><input type="text" name="no_of_worker" pattern="[0-9]{0,}" required></td>
                    </tr>
                    <tr>
                        <td>How many meals per day do you serve?</td>
                        <td><input type="text" name="meals_per_day" pattern="[0-9]{0,}" required></td>
                    </tr>
                    <tr>
                        <td>What kind of religion is mostly represented among the home residents?</td>
                        <td>
                            <input type=checkbox name="religion" value="Islam" checked="">Islam
                            <input type=checkbox name="religion" value="Christianity">Christianity <br>
                            <input type=checkbox name="religion" value="Hinduism">Hinduism
                            <input type=checkbox name="religion" value="Buddhism">Buddhism<br>
                            <input type=checkbox name="religion" value="Others">Others
                        </td>
                    </tr>
                    <tr>
                        <td> Do you have specific requirement to the type of food?</td>
                        <td>
                            <input type="radio" name="specific_food" value="Yes" required>Yes
                            <input type="radio" name="specific_food" value="No">No
                        </td>
                    </tr>
                     <tr>
                         <td> Does the home have vehicles?</td>
                        <td>
                            <input type="radio" id="showform" name="vehicle" value="Yes" onchange="showhide(this.value)" required>Yes
                            <input type="radio" id="showform" name="vehicle" value="No" onchange="showhide(this.value)">No
                        </td>
                    </tr>
                    <tr>
                        <td> Do you have a kitchen in your premise?</td>
                        <td>
                            <input type="radio" name="kitchen" value="Yes" required>Yes
                            <input type="radio" name="kitchen" value="No">No
                        </td>
                    </tr>
                    <tr>
                        <td> Do you have facilities to store food?</td>
                        <td>
                            <input type="radio" name="facilities" value="Yes" required>Yes
                            <input type="radio" name="facilities" value="No">No
                        </td>
                    </tr>
                    <tr>
                        <td> Do you have cold storage equipment?</td>
                        <td>
                            <input type="radio" id="showform" name="cold_storage" value="Yes" onchange="showhidee(this.value)" required>Yes
                            <input type="radio"  id="showform" name="cold_storage" value="No" onchange="showhidee(this.value)">No
                        </td>
                    </tr>
                    <tr>
                        <td> Do you have cooks at the home?</td>
                        <td>
                            <input type="radio" name="chef" value="Yes" required>Yes
                            <input type="radio" name="chef" value="No">No
                        </td>
                    </tr>
                    
                    <tr>
                        <td> Do you purchase the food you serve?</td>
                        <td>
                            <input type="radio" name="purchase_food" value="Yes" required>Yes
                            <input type="radio" name="purchase_food" value="No">No
                        </td>
                    </tr>
                    <tr>
                        <td>What kind of food do you need?</td>
                        <td>
                            <table>
                                <tr>
                                    <td><input type=checkbox name="kind_of_food" value="Salt" checked>Salt </td>
                                    <td><input type=checkbox name="kind_of_food" value="Sugar">Sugar</td>
                                    <td><input type=checkbox name="kind_of_food" value="Oil">Oil</td>
                                </tr>
                                <tr>
                                    <td><input type=checkbox name="kind_of_food" value="Bread">Bread</td>
                                    <td><input type=checkbox name="kind_of_food" value="Tea/Coffee">Tea/Coffee</td>
                                    <td><input type=checkbox name="kind_of_food" value="Rice">Rice</td>
                                </tr>
                                <tr>
                                    <td><input type=checkbox name="kind_of_food" value="Noodles">Noodles </td>
                                    <td><input type=checkbox name="kind_of_food" value="Fruits">Fruits</td>
                                    <td><input type=checkbox name="kind_of_food" value="Flour">Flour</td>
                                </tr>
                                <tr>
                                    <td><input type=checkbox name="kind_of_food" value="Chicken">Chicken</td>
                                    <td><input type=checkbox name="kind_of_food" value="Cooking Spices">Cooking Spices</td>
                                    <td><input type=checkbox name="kind_of_food" value="Beef">Beef</td>
                                </tr>
                                <tr>
                                    <td><input type=checkbox name="kind_of_food" value="Sauces">Sauces</td>
                                    <td><input type=checkbox id="show" name="kind_of_food" value="Others" onclick="showhideee(this)">Others</td> 
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"></td>
                    </tr>
            </table>
                            </div>
                        </fieldset>
        </form>
            </div>
        </div>
    </body>
</html>
