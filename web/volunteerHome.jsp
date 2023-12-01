<%-- 
    Document   : beneficialHome
    Created on : May 10, 2019, 2:38:25 PM
    Author     : Fikri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
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
        $( function() {
          $( "#datepicker3" ).datepicker({
              dateFormat: 'dd-mm-yy',
            changeMonth: true,
            changeYear: true
          });
        } );
        $( function() {
          $( "#datepicker4" ).datepicker({
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
                text-transform: capitalize;
                background-color: #F5F5F5;
                background-image: url("asset/bg2.jpg");
                background-blend-mode:lighter;
                background-size: cover;
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
            #nav{
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                transition: 0.5s;
                overflow-x: hidden;
                padding-top: 60px;
            }
            #nav a{
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }
            #nav a:hover{
                color: #f1f1f1;
            }
            #nav .closebtn{
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }
            .openbtn{
                font-size: 20px;
                cursor: pointer;
                position: fixed;
                background-color: white;
                color: white;
                padding: 10px 15px;
                border: none;
            }
            #base{
                transition: margin-left .5s;
                padding: 10px;
            }
            fieldset{
                border-radius: 10px;
                margin: 30px auto;
                display: none;
                width:80%;
                padding:20px;
                border: 2px solid #1E9624;
                background-color: #ffff;
            }
            #third{
                margin: 30px auto;
                display:block;
                width:80%;
                padding:20px;
            }
            input[type=submit]{
                border: none;
                padding: 7px;
                background-color: #1E9624;
                color: white;
                margin-top: 13px;
                width: 20%;
                float: right;
                transition: border 0.8s ease,color 0.8s,background 0.8s;
            }
            input[type=submit]:hover{
                color: #1E9624;
                border: 2px solid #1E9624;
                background: #ffffff;
            }
            textArea{
                width: 98.5%;
                margin: 0px;
                margin-bottom: 13px; 
                height:50px;
                padding:5px;
                background-color: white;
                border:2px solid #B0BEC5;
            }
            h2{
                text-align: center;
                font-size: 20px;
                text-transform: uppercase;
            }
            h3{text-align: center;
                font-size: 15px;
            }
            .section{
                width: 100%;
                margin: 0 auto;
            }
            .section table td{
                border: none;
                height: 50px;
            }
            img{
                width: 20px;
            }
            table{
                width: 100%;
                margin: 0 auto;
                border-collapse: collapse;
                background-color: #ffffff;
            }
            tr:hover {background-color: #f5f5f5;}
            td{
                padding-left: 10px;
                height: 30px;
                border: 1px solid black; 
            }
            table td a{
                text-decoration: none;
            }
            .center{
                text-align: center;
            }
            table td input[type=text]{
             border: none;  
             width: 95%;
             margin: auto;
            }
            table td table td {
                border: none;
            }
            input[type=text],input[type=password]{
                width:99%;
                margin: 0px ;
                margin-bottom: 13px; 
                height:20px;
                padding:3px;
                border:2px solid #B0BEC5;
                background-color: white;
            }
            /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
            @media screen and (max-height: 450px) {
              #nav {padding-top: 15px;}
              #nav a {font-size: 18px;}
            }
            .fs-subtitle {
                text-transform: none;
                text-align: left;
                    font-weight: normal;
                    font-size: 13px;
                    color: #666;
            }h4{
                text-align: center;
            }
            .floatSide{
                width: 55px;
                height: 180px;
                z-index: 1;
                right: 10px;
                top: 300px;
                position: fixed;
                background-color: white;
                padding: 5px 10px 5px 10px;
                box-sizing: border-box;
            }
            .floatSide img{
                border-radius: 50%;
                width: 35px;
                margin: 2.5px auto;
                transition: 0.3s;
            }
            .floatSide img:hover{
                border-radius: 0;
                width: 35px;
            }
            #nav .copywrite{
                width: 100%;
                color: #818181;
                text-align: center;
                position: absolute;
                bottom: 90px;
            }
            /* The popup form - hidden by default */
            .form-popup {
              display: none;
              position: fixed;
              bottom: 100px;
              right: 10px;
              border: 3px solid #f1f1f1;
              z-index: 9;
            }

            /* Add styles to the form container */
            .form-container {
              max-width: 300px;
              padding: 10px;
              background-color: white;
            }

            /* Full-width input fields */
            .form-container input[type=text]{
                width:98.5%;
                margin: 0px;
                margin-bottom: 13px; 
                height:20px;
                padding: 2.5px;
                border: 2px solid #B0BEC5;
                background-color: white;
            }
            /* Set a style for the submit/login button */
            .form-container .btn {
              background-color: #4CAF50;
              color: white;
              padding: 16px 20px;
              border: none;
              cursor: pointer;
              width: 100%;
              margin-bottom:10px;
              opacity: 0.8;
            }
            .form-container .sub {
              background-color: #4CAF50;
              color: white;
              padding: 10px 10px;
              border: none;
              cursor: pointer;
              width: 100%;
              margin-bottom:10px;
              opacity: 0.8;
            }

            /* Add a red background color to the cancel button */
            .form-container .cancel {
              background-color: red;
              text-decoration: none;
            }

            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
              opacity: 1;
            }
        </style>
    </head>
    <body>
        <script>
                    /*---------------------------------------------------------*/
        // Function that executes on click of first next button.
        function profile() {
            document.getElementById("first").style.display = "block";
            document.getElementById("second").style.display = "none";
            document.getElementById("third").style.display = "none";
            document.getElementById("update").style.display = "none";
            document.getElementById("uapp").style.display = "none";
            document.getElementById("event").style.display = "none";
        }
        function update() {
            document.getElementById("first").style.display = "none";
            document.getElementById("second").style.display = "none";
            document.getElementById("third").style.display = "none";
            document.getElementById("update").style.display = "block";
            document.getElementById("uapp").style.display = "none";
            document.getElementById("event").style.display = "none";
        }
        function application() {
            document.getElementById("first").style.display = "none";
            document.getElementById("second").style.display = "block";
            document.getElementById("third").style.display = "none";
            document.getElementById("update").style.display = "none";
            document.getElementById("uapp").style.display = "none";
            document.getElementById("event").style.display = "none";
        }
        function uapp() {
            document.getElementById("first").style.display = "none";
            document.getElementById("second").style.display = "none"; 
            document.getElementById("third").style.display = "none";
            document.getElementById("uapp").style.display = "block";
            document.getElementById("event").style.display = "none";
        }
        function events() {
            document.getElementById("first").style.display = "none";
            document.getElementById("second").style.display = "none";
            document.getElementById("third").style.display = "block";
            document.getElementById("update").style.display = "none";
            document.getElementById("uapp").style.display = "none";
            document.getElementById("event").style.display = "block";
        }
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
          function openNav() {
            document.getElementById("nav").style.width = "200px";
            document.getElementById("base").style.marginLeft = "200px";
          }

          function closeNav() {
            document.getElementById("nav").style.width = "0";
            document.getElementById("base").style.marginLeft= "0";
          }
          function openForm() {
            document.getElementById("myForm").style.display = "block";
          }

          function closeForm() {
            document.getElementById("myForm").style.display = "none";
          }
        </script>
        <script>
            function showhide1(showform){
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
            function showhide2(showform){
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
            function showhide3(show){
                var box00 = document.getElementById("box00");
                var box5 = document.getElementById("box5");
                box00.style.display = show.checked ? "block" : "none";
                box5.style.display = show.checked ? "block" : "none";
            }
            function showhide4(show){
                var box01 = document.getElementById("box01");
                var box6 = document.getElementById("box6");
                box01.style.display = show.checked ? "block" : "none";
                box6.style.display = show.checked ? "block" : "none";
            }
            function showhide5(showform){
                if (showform=="Yes"){
                    document.getElementById("box7").style.display = "block";
                    document.getElementById("box02").style.display ="block";
                    document.getElementById("box8").style.display = "none";
                }
                if (showform=="No"){
                    document.getElementById("box7").style.display = "none";
                    document.getElementById("box02").style.display = "none";
                    document.getElementById("box8").style.display ="none";
                }
            }
            function showhide6(showform){
                if (showform=="Yes"){
                    document.getElementById("box9").style.display = "block";
                    document.getElementById("box03").style.display ="block";
                    document.getElementById("box10").style.display = "none";
                }
                if (showform=="No"){
                    document.getElementById("box9").style.display = "none";
                    document.getElementById("box03").style.display = "none";
                    document.getElementById("box10").style.display ="none";
                }
            }
            function showhide7(show){
                var box04 = document.getElementById("box04");
                var box11 = document.getElementById("box11");
                box04.style.display = show.checked ? "block" : "none";
                box11.style.display = show.checked ? "block" : "none";
            }
        </script>
        <div id="nav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="text-transform:none;">x</a>
            <a href="#" onclick="profile()"><img src="asset/wuser.png"> Profile</a>
            <a href="#" onclick="application()"><img src="asset/wapp.png"> Application</a>
            <a href="#" onclick="events()"><img src="asset/wevent.png"> Event</a><hr style="width:90%;background-color: white;">
            <a href="logout"><img src="asset/wlogout.png"> logout</a>
            <div class="copywrite" style="text-align:center;text-transform: none;">
                FoodAidFoundation2019<br>mfikri | rafie | naim
            </div>
        </div>
        <%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no_cache");
            response.setHeader("Expires", "0");
            String username=(String) request.getSession().getAttribute("username");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");

            PreparedStatement pst = con.prepareStatement("select name,type,email,nric,address,contact,profession,username from account where username='"+username+"'");
            PreparedStatement p = con.prepareStatement("select name,email,nric,address,contact,profession,username,password,id from account where username='"+username+"'");
            PreparedStatement st = con.prepareStatement("select name,address,date,start,end from event order by id desc limit 3");

            ResultSet rs=pst.executeQuery();
            ResultSet r=p.executeQuery();
            ResultSet rst=st.executeQuery();
            while(rs.next()){ 
        %> 
        <div id="base">
            <div class="header">
                <button class="openbtn" onclick="openNav()"><img src="asset/menu-button.png"></button>
            </div>
            <fieldset id="first">
                <div class="section">
                    <h2><%=rs.getString(8)%></h2>
                    <h3><%=rs.getString(2)%></h3>
                </div>
                <div class="section">
                    <table>
                        <tr>
                            <td><img src="asset/user_1.png"></td>
                            <td>
                                Name<br><%=rs.getString(1)%>
                            </td>
                            <td><img src="asset/email.png"></td>
                            <td>
                                Email<br><span style="text-transform:none;"><%=rs.getString(3)%></span>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="asset/card.png"></td>
                            <td>
                                Nric<br><%=rs.getString(4)%>
                            </td>
                            <td><img src="asset/home.png"></td>
                            <td>Address<br><%=rs.getString(5)%></td>
                        </tr>
                        <tr>
                            <td><img src="asset/smartphone.png"></td>
                            <td>
                                Contact<br><%=rs.getString(6)%>
                            </td>
                            <td><img src="asset/suitcase.png"></td>
                            <td>
                                Profession<br><%=rs.getString(7)%><% } %>
                            </td>
                        </tr>
                    </table>
                        <a href="#" onclick="update()"><input type="submit" value="Update"></a>
                </div>
            </fieldset>
            <fieldset id="update">
                <div class="section">
                    <h2>Update Profile</h2>
                    <form action="updateProfile" method="post">
                        <% while(r.next()) {%>
                        Name<br>
                        <input type="text" name="name" value="<%=r.getString(1)%>"><br>
                        Email<br>
                        <input type="text" name="email" value="<%=r.getString(2)%>"> <br>
                        NRIC No.<br>
                        <input type="text" name="nric" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" title="NRIC should include numbers only" required value="<%=r.getString(3)%>"> <br>
                        Address<br>
                        <textArea name="address" value=""><%=r.getString(4)%></textArea> <br>
                        Contact No.<br>
                        <div class="fs-subtitle">(e.g XXX-XXXXXXXX)</div>
                        <input type="text" name="contact" pattern="[0-9]{3}-[0-9]{7,8}" value="<%=r.getString(5)%>"><br>
                        Profession<br>
                        <input type="text" name="profession" value="<%=r.getString(6)%>"><br>
                        Username<br>
                        <input type="text" name="username" value="<%=r.getString(7)%>" readonly><br>
                        Password<br>
                        <input type="password" name="password" id="password" value="<%=r.getString(8)%>"><br>
                        <label for="confirm-password">Confirm Password</label><br>
                        <div id='msg' class="fs-subtitle"></div>
                        <input type="password" id="confirm-password" onkeyup='check();' required>
                        <input type="hidden" name="id" value="<%=r.getString(9)%>"><br>
                        <input type="submit" id="submit" value="Update"><% } %>
                    </form>
                </div>
            </fieldset>
            <fieldset id="second">
            <%
                Class.forName("com.mysql.jdbc.Driver");

                PreparedStatement profile = con.prepareStatement("select type,status,name,email,nric,address,contact,profession from account where username='"+username+"'");
                PreparedStatement v_details = con.prepareStatement("select voluntary_work,member_of_ngo,foodhandling_exp,transport,interest from volunteer where acc_id=(select id from account where username='"+username+"')");
                PreparedStatement b_details = con.prepareStatement("select type_of_home,no_of_people,age,gender,no_of_worker,"
                        + "meals_per_day,religion,specific_food,vehicle,kitchen,facilities,cold_storage,chef,kind_of_food,purchase_food from beneficiaries where acc_id=(select id from account where username='"+username+"')");
                PreparedStatement info = con.prepareStatement("select name,address,telephone,mobile,email,fax,registration_no,owner from home_information where acc_id=(select id from account where username='"+username+"')");
                PreparedStatement work = con.prepareStatement("select company_name,position,year_from,year_to,last_salary,leave_reason from work_experience where acc_id=(select id from account where username='"+username+"')");
                PreparedStatement support = con.prepareStatement("select name,date_from,date_to,type_of_donation from support where acc_id=(select id from account where username='"+username+"')");

                ResultSet pr=profile.executeQuery();
                ResultSet ds=v_details.executeQuery();
                ResultSet bs=b_details.executeQuery();
                ResultSet in=info.executeQuery();
                ResultSet wk=work.executeQuery();
                ResultSet sp=support.executeQuery();

                while(pr.next()){ 
            %>
                <div style="float:left;">Application Type : <%=pr.getString(1)%></div>
                <div style="float:right">Status : <%=pr.getString(2)%></div><br>
                <h2><img src="asset/bapp.png"> Application</h2>
                <h3>Your application form</h3>
                <table>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>Profile</h4></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><%=pr.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>email</td>
                        <td style="text-transform:none;"><%=pr.getString(4)%></td>
                    </tr>
                    <tr>
                        <td>nric</td>
                        <td><%=pr.getString(5)%></td>
                    </tr>
                    <tr>
                        <td>address</td>
                        <td><%=pr.getString(6)%></td>
                    </tr>
                    <tr>
                        <td>contact</td>
                        <td><%=pr.getString(7)%></td>
                    </tr>
                    <tr>
                        <td>profession</td>
                        <td><%=pr.getString(8)%></td><% } while(ds.next()) { %>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>details</h4></td>
                    </tr>
                    <tr>
                        <td>voluntary work</td>
                        <td><%=ds.getString(1)%></td>
                    </tr>
                    <tr>
                        <td>member of ngo</td>
                        <td><%=ds.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>food handling experience</td>
                        <td><%=ds.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>transport</td>
                        <td><%=ds.getString(4)%></td>
                    </tr>
                    <tr>
                        <td>interest</td>
                        <td><%=ds.getString(5)%></td><% } while(bs.next()) {%>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>Home</h4></td>
                    </tr>
                    <tr>
                        <td>Type of Home</td>
                        <td><%=bs.getString(1)%></td>
                    </tr>
                    <tr>
                        <td>How many home residents do you have currently?</td>
                        <td><%=bs.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>How old are the home resident?</td>
                        <td><%=bs.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>Gender of the home Residents?</td>
                        <td><%=bs.getString(4)%></td>
                    </tr>
                    <tr>
                        <td>How many workers / volunteers do you have?</td>
                        <td><%=bs.getString(5)%></td>
                    </tr>
                    <tr>
                        <td>How many meals per day do you serve?</td>
                        <td><%=bs.getString(6)%></td>
                    </tr>
                    <tr>
                        <td>What kind of religion is mostly represented among the home residents?</td>
                        <td><%=bs.getString(7)%></td>
                    </tr>
                    <tr>
                        <td>Do you have specific requirement to the type of food?</td>
                        <td><%=bs.getString(8)%></td>
                    </tr>
                    <tr>
                        <td>Does the home have vehicles?</td>
                        <td><%=bs.getString(9)%></td>
                    </tr>
                    <tr>
                        <td>Do you have a kitchen in your premise?</td>
                        <td><%=bs.getString(10)%></td>
                    </tr>
                    <tr>
                        <td>Do you have facilities to store food?</td>
                        <td><%=bs.getString(11)%></td>
                    </tr>
                    <tr>
                        <td>Do you have cold storage equipment? </td>
                        <td><%=bs.getString(12)%></td>
                    </tr>
                    <tr>
                        <td>Do you have cooks at the home?</td>
                        <td><%=bs.getString(13)%></td>
                    </tr>
                    <tr>
                        <td>What kind of food do you need?</td>
                        <td><%=bs.getString(14)%></td>
                    </tr>
                    <tr>
                        <td>Do you purchase the food you serve?</td>
                        <td><%=bs.getString(15)%></td><% } while(wk.next()) {%>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>working experience</h4></td>
                    </tr>
                    <tr>
                        <td>company name</td>
                        <td><%=wk.getString(1)%></td>
                    </tr>
                    <tr>
                        <td>position</td>
                        <td><%=wk.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>from</td>
                        <td><%=wk.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>to</td>
                        <td><%=wk.getString(4)%></td>
                    </tr>
                    <tr>
                        <td>last salary </td>
                        <td><%=wk.getString(5)%></td>
                    </tr>
                    <tr>
                        <td>leave reason </td>
                        <td><%=wk.getString(6)%></td><% } while(sp.next()) { %>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>support</h4></td>
                    </tr>
                    <tr>
                        <td>name</td>
                        <td><%=sp.getString(1)%></td>
                    </tr>
                    <tr>
                        <td>from</td>
                        <td><%=sp.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>to</td>
                        <td><%=sp.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>type of donation</td>
                        <td><%=sp.getString(4)%></td><% } while(in.next()) {%>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>Home Information</h4></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><%=in.getString(1)%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=in.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>Telephone</td>
                        <td><%=in.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td><%=in.getString(4)%></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td style="text-transform:none;"><%=in.getString(5)%></td>
                    </tr>
                    <tr>
                        <td>Fax</td>
                        <td><%=in.getString(6)%></td>
                    </tr>
                    <tr>
                        <td>Registration No. </td>
                        <td><%=in.getString(7)%></td>
                    </tr>
                    <tr>
                        <td>Owner</td>
                        <td><%=in.getString(8)%></td><% } %>
                    </tr>
                </table>
                    <a href="#" onclick="uapp()"><input type="submit" value="Update"></a>
            </fieldset>
            <fieldset id="uapp">
            <%
                Class.forName("com.mysql.jdbc.Driver");

                PreparedStatement uprofile = con.prepareStatement("select type,status,name,email,nric,address,contact,profession,id from account where username='"+username+"'");
                PreparedStatement uv_details = con.prepareStatement("select voluntary_work,member_of_ngo,foodhandling_exp,transport,interest, id from volunteer where acc_id=(select id from account where username='"+username+"')");
                PreparedStatement ub_details = con.prepareStatement("select type_of_home,no_of_people,age,gender,no_of_worker,"
                        + "meals_per_day,religion,specific_food,vehicle,kitchen,facilities,cold_storage,chef,kind_of_food,purchase_food,id from beneficiaries where acc_id=(select id from account where username='"+username+"')");
                PreparedStatement uinfo = con.prepareStatement("select name,address,telephone,mobile,email,fax,registration_no,owner from home_information where acc_id=(select id from account where username='"+username+"')");
                PreparedStatement uwork = con.prepareStatement("select company_name,position,year_from,year_to,last_salary,leave_reason from work_experience where acc_id=(select id from account where username='"+username+"')");
                PreparedStatement usupport = con.prepareStatement("select name,date_from,date_to,type_of_donation from support where acc_id=(select id from account where username='"+username+"')");

                ResultSet upr=uprofile.executeQuery();
                ResultSet uds=uv_details.executeQuery();
                ResultSet ubs=ub_details.executeQuery();
                ResultSet uin=uinfo.executeQuery();
                ResultSet uwk=uwork.executeQuery();
                ResultSet usp=usupport.executeQuery();

                while(upr.next()){ 
            %>
                <h2>Update application</h2>
                <form action="cuba" method="post">
                <table>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>Profile</h4></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">Name</td>
                        <td><input type="text" name="name2" value="<%=upr.getString(3)%>"></td>
                    </tr>
                    <tr>
                        <td>email</td>
                        <td><input type="text" name="email2" pattern="[a-z0-9._%+-]+@[a-patz0-9.-]+\.[a-z]{2,}$" value="<%=upr.getString(4)%>"></td>
                    </tr>
                    <tr>
                        <td>nric</td>
                        <td><input type="text" name="nric2" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" title="NRIC should include numbers only" value="<%=upr.getString(5)%>"></td>
                    </tr>
                    <tr>
                        <td>address</td>
                        <td><input type="text" name="address2" value="<%=upr.getString(6)%>"></td>
                    </tr>
                    <tr>
                        <td>contact</td>
                        <td><input type="text" name="contact" pattern="[0-9]{3}-[0-9]{7,8}" title="Contact No should include numbers only" value="<%=upr.getString(7)%>"></td>
                    </tr>
                    <tr>
                        <td>profession</td>
                        <td><input type="text" name="profession" value="<%=upr.getString(8)%>">
                             <input type="hidden" name="acc_id" value="<%=upr.getString("id")%>"/>
                           </td>
                           <% } while(uds.next()) {
                                         String checked1 = "";
                                         String checked2 = "";
                                         String checked3 = "";
                                         String checked4 = "";
                                         String checked5 = "";
                                         String checked6 = "";
                                         String checked7 = "";
                                         String checked8 = "";
              if(uds.getString(1).equals("Yes")){
                  checked1 = "checked";}
              else 
              {
                         
                  checked2 = "checked";
              }
              if(uds.getString(2).equals("Yes")){
                  checked3 = "checked";}
              else 
              {
                         
                  checked4 = "checked";
              }
               
              if(uds.getString(3).equals("Yes")){
                  checked5 = "checked";}
              else 
              {
                         
                  checked6 = "checked";
              }
                
              if(uds.getString(4).equals("Yes")){
                  checked7 = "checked";}
              else 
              {
                  checked8 = "checked";
              }

         %> 
                    </tr>
                  <table>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>details</h4></td>
                    </tr>
                     <tr>
                        <td style="width:50%;">Have You Done Any Voluntary Work ?</td>
                        <td>
                            <input type="radio" id="showform" name="voluntary_work" value="Yes" onchange="showhide1(this.value)" <%=checked1%> required> Yes
                            <input type="radio" id="showform" name="voluntary_work" value="No" onchange="showhide1(this.value)" <%=checked2%> >No
                        </td>
                    </tr>
                    <tr>
                        <td>Are you a member of any NGO ?</td>
                        <td>
                            <input type="radio" id="showform" name="member_of_ngo" value="Yes" onchange="showhide2(this.value)" <%=checked3%>  required> Yes
                            <input type="radio" id="showform" name="member_of_ngo" value="No" onchange="showhide2(this.value)" <%=checked4%> >No
                        </td>
                    </tr>
                    <tr>
                        <td>Do you have any experience in food handling ?</td>
                        <td>
                            <input type="radio" name="foodhandling_exp" value="Yes" <%=checked5%> required> Yes
                            <input type="radio" name="foodhandling_exp" value="No"<%=checked6%> >No
                        </td>
                    </tr>
                    <tr>
                        <td>Do you have your transport ? </td>
                        <td>
                            <input type="radio" name="transport" value="Yes" required <%=checked7%> > Yes
                            <input type="radio" name="transport" value="No" <%=checked8%> >No
                        </td>
                    </tr>
                    <tr>
                        <td>Area Of Interest</td>
                        <td>
                            <table>
                                <tr>
                                    <td><input type="checkbox" name="interest" value="Fund Raising" checked> Fund Raising</td>
                                    <td><input type="checkbox" name="interest" value="Admin"> Admin</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="interest" value="Event Organising"> Event Organising</td>
                                    <td><input type="checkbox" name="interest" value="Communication"> Communication</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="interest" value="Food Raising"> Food Raising</td>
                                    <td><input type="checkbox"  id="show" name="interest" value="Other" onclick="showhide3(this)"> Other</td>
                                </tr><input type="hidden" name="id" value="<%=uds.getString(6)%>"/>
                            </table>
                            <label  id="box00" style="display:none;">Please state</label>
                            <input type="text" id="box5" name="kind_of_food" style="display:none;">
                            <% } while(ubs.next()){ 
                                         String checked1 = ""; String checked2 = "";
                                         String checked3 = ""; String checked4 = "";
                                         String checked5 = ""; String checked6 = "";
                                         String checked7 = ""; String checked8 = "";
                                         String checked9 = ""; String checked10 = "";
                                         String checked11 = "";String checked12 = "";
                                         String checked13 = "";String checked14 = "";
                                            if(ubs.getString(8).equals("Yes"))
                                            {
                                                checked1 = "checked";
                                            }
                                            else 
                                            {
                                                checked2 = "checked";
                                            }
                                            if(ubs.getString(9).equals("Yes")){
                                                checked3 = "checked";}
                                            else 
                                            {
                                                checked4 = "checked";
                                            }
                                            if(ubs.getString(10).equals("Yes")){
                                                checked5 = "checked";}
                                            else 
                                            {
                                                checked6 = "checked";
                                            } 
                                            if(ubs.getString(11).equals("Yes")){
                                                checked7 = "checked";}
                                            else 
                                            {
                                                checked8 = "checked";
                                            }
                                            if(ubs.getString(12).equals("Yes")){
                                                checked9 = "checked";}
                                            else 
                                            {
                                                checked10 = "checked";
                                            }
                                            if(ubs.getString(13).equals("Yes")){
                                                checked11 = "checked";}
                                            else 
                                            {
                                                checked12 = "checked";
                                            }
                                            if(ubs.getString(15).equals("Yes")){
                                                checked13 = "checked";}
                                            else 
                                            {     
                                                checked14 = "checked";
                                            }
%>
                        </td>
                    </tr>
                   
                    <tr>
                        <td colspan="2" style="border:none;"><h4>Home</h4></td>
                    </tr>
                        <tr>
                    <td>Type of Home</td>
                    <td>
                        <input type=checkbox name="type_of_home" value="ORPHANAGE" checked>ORPHANAGE <br>
                        <input type=checkbox name="type_of_home" value="SPECIAL CARE CENTER FOR DISABLED PEOPLE">SPECIAL CARE CENTER FOR DISABLED PEOPLE<br>
                        <input type=checkbox name="type_of_home" value="SHELTER FOR HOMELESS PEOPLE">SHELTER FOR HOMELESS PEOPLE<br>
                        <input type=checkbox name="type_of_home" value="HOME FOR ABUSED MOTHERS – and their children">HOME FOR ABUSED MOTHERS-and their children <br>
                        <input type=checkbox name="type_of_home" value="REFUGEE CENTER">REFUGEE CENTER <br>
                        <input type=checkbox name="type_of_home" value="SOUP KITCHEN">SOUP KITCHEN<br>
                        <input type=checkbox name="type_of_home" value="OLD FOLKS HOME">OLD FOLKS HOME<br>
                        <input type=checkbox id="show" name="type_of_home" value="Others" onclick="showhide4(this)">Others<br>
                    </td>
                    </tr>
                    <tr>
                        <td>How many home residents do you have currently?</td>
                        <td><input type="text" name="no_of_people" value="<%=ubs.getString(2)%>"></td>
                    </tr>
                    <tr>
                         <td>How old are the home resident?</td>
                        <td>
                            <input type=checkbox name="age" value="0-6" checked>0-6
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
                        <td><input type="text" name="no_of_worker" value="<%=ubs.getString(5)%>"</td>
                    </tr>
                    <tr>
                        <td>How many meals per day do you serve?</td>
                        <td><input type="text" name="meals_per_day" value="<%=ubs.getString(6)%>"></td>
                    </tr>
                    <tr>
                        <td>What kind of religion is mostly represented among the home residents?</td>
                        <td>
                            <input type=checkbox name="religion" value="Islam" checked>Islam
                            <input type=checkbox name="religion" value="Christianity">Christianity <br>
                            <input type=checkbox name="religion" value="Hinduism">Hinduism
                            <input type=checkbox name="religion" value="Buddhism">Buddhism<br>
                            <input type=checkbox name="religion" value="Others">Others
                        </td>
                    </tr>
                    <tr>
                        <td>Do you have specific requirement to the type of food?</td>
                        <td> <input type="radio" name="specific_food"<%=checked1%> value="Yes">Yes
                             <input type="radio" name="specific_food" <%=checked2%> value="No">No</td>
                    </tr>
                    <tr>
                        <td>Does the home have vehicles?</td>
                       <td>
                            <input type="radio" id="showform" name="vehicle" <%=checked3%> value="Yes" onchange="showhide5(this.value)" >Yes
                            <input type="radio" id="showform" name="vehicle" <%=checked4%> value="No" onchange="showhide5(this.value)">No
                        </td>
                    </tr>
                    <tr>
                        <td>Do you have a kitchen in your premise?</td>
                        <td>
                            <input type="radio" name="kitchen" <%=checked5%> value="Yes" >Yes
                            <input type="radio" name="kitchen" <%=checked6%> value="No">No
                        </td>
                    </tr>
                    <tr>
                        <td>Do you have facilities to store food?</td>
                        <td>
                            <input type="radio" name="facilities" <%=checked7%> value="Yes" >Yes
                            <input type="radio" name="facilities" <%=checked8%> value="No">No
                        </td>
                    </tr>
                    <tr>
                        <td>Do you have cold storage equipment? </td>
                        <td>
                            <input type="radio" id="showform" name="cold_storage" <%=checked9%> value="Yes" onchange="showhide6(this.value)" >Yes
                            <input type="radio"  id="showform" name="cold_storage" <%=checked10%> value="No" onchange="showhide6(this.value)">No
                        </td>
                    </tr>
                    <tr>
                        <td>Do you have cooks at the home?</td>
                       <td>
                            <input type="radio" name="chef" <%=checked11%> value="Yes" >Yes
                            <input type="radio" name="chef" <%=checked12%> value="No">No
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
                                    <td><input type=checkbox id="show" name="kind_of_food" value="Others" onclick="showhide7(this)">Others</td> 
                                </tr>
                            </table>
                        </td>
                    </tr>   
                   
                    <tr>
                        <td>Do you purchase the food you serve?</td>
                        <td> <input type="radio" name="purchase_food" <%=checked13%> value="Yes">Yes
                            <input type="radio" name="purchase_food" <%=checked14%> value="No">No</td>
                        <input type="hidden" name="id" value="<%=ubs.getString("id")%>"/>
                        <% } while(uwk.next()) {%>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>working experience</h4></td>
                    </tr>
                   <tr>
                        <td>company name</td>
                        <td><input type="text" name="company_name" value="<%=uwk.getString(1)%>"></td>
                    </tr>
                    <tr>
                        <td>position</td>
                        <td><input type="text" name="position" value="<%=uwk.getString(2)%>"></td>
                    </tr>
                    <tr>
                        <td>from</td>
                        <td><input type="text" id="datepicker" name="year_from"  value="<%=uwk.getString(3)%>"</td>
                    </tr>
                    <tr>
                        <td>to</td>
                        <td><input type="text" id="datepicker2" name="year_to"  value="<%=uwk.getString(4)%>"</td>
                    </tr>
                    <tr>
                        <td>last salary (e.g. RM XXX++)</td>
                        <td><input type="text" name="last_salary" title="please fill with required format e.g. RM XXX" value="<%=uwk.getString(5)%>"></td>
                    </tr>
                    <tr>
                        <td>leave reason </td>
                         <td><input type="text" name="leave_reason" value="<%=uwk.getString(6)%>"</td><% } while(usp.next()) { %>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>support</h4></td>
                    </tr>
                    <tr>
                        <td>name</td>
                        <td><input type="text" name="name1" value="<%=usp.getString(1)%>"></td>
                    </tr>
                    <tr>
                        <td>from (e.g dd-mm-yyyy)</td>
                        <td><input type="text" id="datepicker3" name="date_from" value="<%=usp.getString(2)%>"></td>
                    </tr>
                    <tr>
                        <td>to (e.g dd-mm-yyyy)</td>
                        <td><input type="text" id="datepicker4" name="date_to" value="<%=usp.getString(3)%>"></td>
                    </tr>
                    <tr>
                        <td>type of donation</td>
                        <td><input type="text" name="type_of_donation" value="<%=usp.getString(4)%>"></td><% } while(uin.next()) {%>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:none;"><h4>Home Information</h4></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" value="<%=uin.getString(1)%>"></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" value="<%=uin.getString(2)%>"></td>
                    </tr>
                    <tr>
                        <td>Telephone</td>
                        <td><input type="text" name="telephone" value="<%=uin.getString(3)%>"></td>
                    </tr>
                    <tr>
                        <td>Mobile (e.g XXX-XXXXXXXX)</td>
                        <td><input type="text" name="mobile" pattern="[0-9]{3}-[0-9]{7,8}" value="<%=uin.getString(4)%>"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" pattern="[a-z0-9._%+-]+@[a-patz0-9.-]+\.[a-z]{2,}$" value="<%=uin.getString(5)%>"></td>
                    </tr>
                    <tr>
                        <td>Fax</td>
                        <td><input type="text" name="fax" title="fax format e.g. 60-12-34567890" value="<%=uin.getString(6)%>"></td>
                    </tr>
                    <tr>
                        <td>Registration No. </td>
                        <td><input type="text" name="registration_no" title="Registration No. format e.g. 012345678912" value="<%=uin.getString(7)%>"></td>
                    </tr>
                    <tr>
                        <td>Owner</td>
                        <td><input type="text" name="owner" value="<%=uin.getString(8)%>"></td><% } %>
                    </tr>
                </table><input type="submit" value="Update">
                </form>
            </fieldset>
            <fieldset id="third">
                <h2><img src="asset/bevent.png">Event</h2>
                <h3>Come and Join us</h3>
                    <% while(rst.next()){%>
                    <h2><%=rst.getString(1)%></h2>
                    <table>
                        <tr>
                            <td style="width: 70px;">Name </td>
                            <td><%=rst.getString(1)%></td>
                        </tr>
                        <tr>
                            <td>Address </td>
                            <td><%=rst.getString(2)%></td>
                        </tr>
                        <tr>
                            <td>Date </td>
                            <td><%=rst.getString(3)%></td>
                        </tr>
                        <tr>
                            <td>Time </td>
                            <td><%=rst.getString(4)%> - <%=rst.getString(5)%></td>
                        </tr>
                    </table>
                <% } %>
            </fieldset>
            <div class="floatSide">
                <a href="https://www.facebook.com/foodaidfoundation"><img src="asset/facebook.png"></a>
                <a href="https://www.instagram.com/FoodAidFoundation/"><img src="asset/instagram.png"></a>
                <a href="https://www.foodaidfoundation.org/"><img src="asset/website.png"></a>
                <a href="#" onclick="openForm()"><img src="asset/gmail.png"></a>
            </div>
            <div class="form-popup" id="myForm">
                <form action="contactus" method="post" class="form-container">
                    
                    <a href="#" class="btn cancel" onclick="closeForm()">x</a>
                  <h1>Email Us</h1>
                  <h3 style="text-transform: none;">foodfoundationm@gmail.com</h3>
                </form>
              </div>
        </div>
    </body>
</html>
