<%-- 
    Document   : admin
    Created on : May 5, 2019, 3:33:46 PM
    Author     : Fikri
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script>
        $( function() {
          $( "#datepicker" ).datepicker({
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
                background-color: #ffff;
                color: white;
                padding: 10px 15px;
                border: none;
                margin-left: 10px;
                margin-top: 10px;
            }
            #base{
                transition: margin-left .5s;
                padding: 0px;
                border: 1px solid transparent;
            }
            fieldset{
                border-radius: 10px;
                background-color: #ffff;
                margin: 30px auto;
                display: none;
                width:80%;
                border: 2px solid #1E9624;
                padding:20px 10px;
            }
            #second{
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
                width: 99%;
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
            .bg{
                background-color: red;
                padding: 10px;
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
            .div{
                width: 85%;
                margin: 20px auto;
            }
            .center{
                text-align: center;
            }
            input[type=text],input[type=password],input[type=time]{
                width:99%;
                margin: 0px ;
                margin-bottom: 13px; 
                height:20px;
                padding:3px;
                border:2px solid #B0BEC5;
                background-color: white;
            }
            .fs-subtitle {
                    font-weight: normal;
                    font-size: 20px;
                    text-align: center;
            }
            @media screen and (max-height: 450px) {
            #nav {padding-top: 15px;}
            #nav a {font-size: 18px;}
          }
          /* Style the tab */
            .tab {
                padding: 5px 5px;
                margin: 0 auto;
                border: 1px solid white;
                background-color: white;
            }

            /* Style the buttons inside the tab */
            .tab button {
              background-color: #1E9624;
              color:#ffffff;
              border: 1px solid #f1f1f1;
              outline: none;
              cursor: pointer;
              padding: 14px 16px;
              transition: 0.3s;
              font-size: 17px;
            }
            /* Change background color of buttons on hover */
            .tab button:hover {
              background-color: #ddd;
              color: black;
            }
            .tab input[type=text] {
                width: 92%;
                padding: 6px;
                margin-top: 8px;
                font-size: 17px;
                border: 1px solid #B0BEC5;
              }
              .tab .search-container button{
                padding: 5px;
                margin-top: 8px;
                float: right;
                background-color: #ffff;
                border: none;
                cursor: pointer;
              }
            /* Create an active/current tablink class */
            .tab button.active {
               border: 1px solid #1E9624; 
               background-color: #ffff;
               color: #1E9624;
            }
            .tab .search-container{
                width: 55%;
                float: right;
            }

            /* Style the tab content */
            .tabcontent {
              display: none;
              padding: 6px 12px;
              border-top: none;
            }
            .analyst{
                width: 50%;
                height: 400px;
                margin: 10px auto;
            }
            .fs-subtitle {
                text-transform: none;
                text-align: left;
                    font-weight: normal;
                    font-size: 13px;
                    color: #666;
            }
            .floatSide{
                width: 55px;
                height: 140px;
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
            select{
                margin: 0px ;
                margin-bottom: 13px; 
                height:20px;
                border:2px solid #B0BEC5;
                background-color: white;
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
            //document.getElementById("third").style.display = "none";
            document.getElementById("update").style.display = "none";
            document.getElementById("event").style.display = "none";
            document.getElementById("event").style.display = "none";
            document.getElementById("analyst").style.display = "none";
        }
        function update() {
            document.getElementById("first").style.display = "none";
            document.getElementById("second").style.display = "none";
            //document.getElementById("third").style.display = "none";
            document.getElementById("update").style.display = "block";
            document.getElementById("event").style.display = "none";
            document.getElementById("analyst").style.display = "none";
        }
        function application() {
            document.getElementById("first").style.display = "none";
            document.getElementById("second").style.display = "block";
            //document.getElementById("third").style.display = "none";
            document.getElementById("update").style.display = "none";
            document.getElementById("event").style.display = "none";
            document.getElementById("analyst").style.display = "none";
        }
        function analysis() {
            document.getElementById("first").style.display = "none";
            document.getElementById("second").style.display = "none";
            //document.getElementById("third").style.display = "none";
            document.getElementById("update").style.display = "none";
            document.getElementById("event").style.display = "none";
            document.getElementById("analyst").style.display = "block";
        }
        function events() {
            document.getElementById("first").style.display = "none";
            document.getElementById("second").style.display = "none";
            //document.getElementById("third").style.display = "block";
            document.getElementById("update").style.display = "none";
            document.getElementById("event").style.display = "block";
            document.getElementById("analyst").style.display = "none";
        }
        $(function() {
            $("#stat td").each(function() {
              if ($(this).text() === 'pending') {
                $(this).css('background-color', '#048BA8');
                $(this).css('color','white');
                $(this).css('text-transform','capitalize');
              }
              if ($(this).text() === 'accept') {
                $(this).css('background-color', 'green');
                $(this).css('color','white');
                $(this).css('text-transform','capitalize');
              }
              if ($(this).text() === 'reject') {
                $(this).css('background-color', '#A1213B');
                $(this).css('color','white');
                $(this).css('text-transform','capitalize');
              }
            });
          });
          function openNav() {
            document.getElementById("nav").style.width = "200px";
            document.getElementById("base").style.marginLeft = "200px";
          }

          function closeNav() {
            document.getElementById("nav").style.width = "0";
            document.getElementById("base").style.marginLeft= "0";
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
          function openAnalyst(evt, Name) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }   
            document.getElementById(Name).style.display = "block";
            evt.currentTarget.className += " active";
          }
          function openAnalyst1(evt1, Name1) {
            var x, tabcontent1, tablinks1;
            tabcontent1 = document.getElementsByClassName("tabcontent1");
            for (x = 0; x < tabcontent1.length; x++) {
              tabcontent1[x].style.display = "none";
            }
            tablinks1 = document.getElementsByClassName("tablinks1");
            for (x = 0; x < tablinks1.length; x++) {
              tablinks1[x].className = tablinks1[x].className.replace(" active", "");
            }   
            document.getElementById(Name1).style.display = "block";
            evt1.currentTarget.className += " active";
          }
          function openAnalyst2(evt2, name2) {
            var y, tabcontent2, tablinks2;
            tabcontent2 = document.getElementsByClassName("tabcontent2");
            for (y = 0; y < tabcontent2.length; y++) {
              tabcontent2[y].style.display = "none";
            }
            tablinks2 = document.getElementsByClassName("tablinks2");
            for (y = 0; y < tablinks2.length; y++) {
              tablinks2[y].className = tablinks2[y].className.replace(" active", "");
            }   
            document.getElementById(name2).style.display = "block";
            evt2.currentTarget.className += " active";
          }
          
        </script>
        <div id="nav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="text-transform:none;">x</a>
            <a href="#profile" onclick="profile()"><img src="asset/wuser.png"> Profile</a>
            <a href="#application" onclick="application()"><img src="asset/wapp.png"> Application</a>
            <a href="#analysis" onclick="analysis()"><img src="asset/wanalysis.png"> Analysis</a>
            <a href="#event" onclick="events()"><img src="asset/wevent.png"> Event</a><hr style="width:90%;background-color: white;">
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

            PreparedStatement pst = con.prepareStatement("select username,name,type,email,nric,address,contact,profession from account where username='"+username+"'");
            PreparedStatement p = con.prepareStatement("select name,email,nric,address,contact,profession,username,password,id from account where username='"+username+"'");
            PreparedStatement list = con.prepareStatement("select name,status,id from account where type='volunteer' and status='pending' order by id desc");
            PreparedStatement listb = con.prepareStatement("select name,status,id from account where type='beneficiairies' and status='pending' order by id desc");
            PreparedStatement lists = con.prepareStatement("select name,status,id from account where type='volunteer' and status in('accept','reject') order by field(status,'accept','reject'),id desc");
            PreparedStatement listbs = con.prepareStatement("select name,status,id from account where type='beneficiairies' and status in('accept','reject') order by field(status,'accept','reject'),id desc");
            PreparedStatement st = con.prepareStatement("select name,address,date,start,end,id from event order by id desc");

            ResultSet rs=pst.executeQuery();
            ResultSet r=p.executeQuery();
            ResultSet li=list.executeQuery();
            ResultSet lib=listb.executeQuery();
            ResultSet lis=lists.executeQuery();
            ResultSet libs=listbs.executeQuery();
            ResultSet rst=st.executeQuery();
            while(rs.next()){ 
        %> 
        <div id="base">
            <button class="openbtn" onclick="openNav()"><img src="asset/menu-button.png"></button>
            <fieldset id="first" class="pro">
                <div class="section">
                    <h2><%=rs.getString(2)%></h2>
                    <h3><%=rs.getString(3)%></h3>
                </div>
                <div class="section">
                    <table>
                        <tr>
                            <td style="width:30px;"><img src="asset/user_1.png"></td>
                            <td>
                                Username<br><%=rs.getString(1)%>
                            </td>
                            <td style="width:30px;"><img src="asset/email.png"></td>
                            <td>
                                Email<br><span style="text-transform:none;"><%=rs.getString(4)%></span>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="asset/card.png"></td>
                            <td>
                                Nric<br><%=rs.getString(5)%>
                            </td>
                            <td><img src="asset/home.png"></td>
                            <td>Address<br><%=rs.getString(6)%></td>
                        </tr>
                        <tr>
                            <td><img src="asset/smartphone.png"></td>
                            <td>
                                Contact<br><%=rs.getString(7)%>
                            </td>
                            <td><img src="asset/suitcase.png"></td>
                            <td>
                                Profession<br><%=rs.getString(8)%><% } %>
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
                        <div class="fs-subtitle">e.g foodaid@gmail.com</div>
                        <input type="text" name="email" value="<%=r.getString(2)%>"> <br>
                        NRIC No.<br>
                        <div class="fs-subtitle">e.g XXXXXX-XX-XXXX</div>
                        <input type="text" name="nric" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" title="NRIC should include numbers only" required value="<%=r.getString(3)%>"> <br>
                        Address<br>
                        <textArea name="address"><%=r.getString(4)%></textarea> <br>
                        Contact No.<br>
                        <div class="fs-subtitle">e.g XXX-XXXXXXXX</div>
                        <input type="text" name="contact" value="<%=r.getString(5)%>"><br>
                        Profession<br>
                        <input type="text" name="profession" value="<%=r.getString(6)%>"><br>
                        Username<br>
                        <input type="text" name="username" value="<%=r.getString(7)%>" readonly><br>
                        Password<br>
                        <input type="password" id="password" name="password" value="<%=r.getString(8)%>"><br>
                        <label for="confirm-password">Confirm Password</label><br>
                        <div id='msg' class="fs-subtitle"></div>
                        <input type="password" id="confirm-password" onkeyup='check();' required>
                        <input type="hidden" name="id" value="<%=r.getString(9)%>"><br>
                        <input type="submit" id="submit" value="Update"><% } %>
                    </form>
                </div>
            </fieldset>
            <fieldset id="second">
                <h2><img src="asset/bapp.png"> Application</h2>
                <h3>Process the application form</h3>
                    <div class="tab">
                        <button class="tablinks" onclick="openAnalyst(event, 'pending')">Pending</button>
                        <button class="tablinks" onclick="openAnalyst(event, 'others')">Others</button>
                        <div class="search-container">
                        <form method="post" action="search">
                            <input  type="text" name="name" placeholder="Search By Name.." required>
                            <button  type="submit" name="submit"><img src="asset/search.png"></button>
                      </form>
                        </div>
                    </div>
                    <div id="pending" class="tabcontent" style="display:block">
                        <table id="stat">
                            <tr>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Process</th>
                            </tr>
                            <tr><td colspan="3" style="text-align:center;background-color: black;color: white;">Volunteer</td></tr>
                            <% while(li.next()){ %>
                            <tr>
                                <td style="padding-left: 10px;width: 70%;"><%=li.getString(1)%></td>
                                <td class="center" style="width:15%;"><%=li.getString(2)%></td>
                                <td class="center" style="width:15%;"><a href="process.jsp?id=<%=li.getString(3)%>"><img src="asset/next.png" style="width:20px;"></a></td>
                            </tr>
                            <% } %>
                            <tr><td colspan="3" style="text-align:center;background-color: black;color: white;">Benefeciairies</td></tr>
                            <% while(lib.next()){ %>
                            <tr>
                                <td style="padding-left: 10px;"><%=lib.getString(1)%></td>
                                <td class="center"><%=lib.getString(2)%></td>
                                <td class="center"><a href="process.jsp?id=<%=lib.getString(3)%>"><img src="asset/next.png" style="width:20px;"></a></td>
                            </tr>
                            <% } %>
                        </table>
                    </div>
                    <div id="others" class="tabcontent">
                        <table id="stat">
                            <tr>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Process</th>
                            </tr>
                            <tr><td colspan="3" style="text-align:center;background-color: black;color: white;">Volunteer</td></tr>
                            <% while(lis.next()){ %>
                            <tr>
                                <td style="padding-left: 10px;width: 70%;"><%=lis.getString(1)%></td>
                                <td class="center" style="width:15%;"><%=lis.getString(2)%></td>
                                <td class="center" style="width:15%;"><a href="process.jsp?id=<%=lis.getString(3)%>"><img src="asset/next.png" style="width:20px;"></a></td>
                            </tr>
                            <% } %>
                            <tr><td colspan="3" style="text-align:center;background-color: black;color: white;">Benefeciairies</td></tr>
                            <% while(libs.next()){ %>
                            <tr>
                                <td style="padding-left: 10px;"><%=libs.getString(1)%></td>
                                <td class="center"><%=libs.getString(2)%></td>
                                <td class="center"><a href="process.jsp?id=<%=libs.getString(3)%>"><img src="asset/next.png" style="width:20px;"></a></td>
                            </tr>
                            <% } %>
                        </table>
                    </div>
            </fieldset>
            <fieldset id="event">
                <h2><img src="asset/bevent.png">Event</h2>
                <h3>Create and Edit Event</h3>
                <div class="tab">
                        <button class="tablinks1" onclick="openAnalyst1(event, 'setEvent')">Set Events</button>
                        <button class="tablinks1" onclick="openAnalyst1(event, 'eOthers')">Event Record</button>
                        <div class="search-container">
                        <form method="post" action="searchEvent">
                            <input  type="text" name="name" placeholder="Search By Event Name.." required="">
                            <button  type="submit" name="submit"><img src="asset/search.png"></button>
                      </form>
                        </div>
                </div>
                <div id="setEvent" class="tabcontent1">
                    <div style="padding: 10px;">
                        <h3>Set Event</h3>
                <form action="event" method="post">
                    Event Title
                    <input type="text" name="name" required="">
                    Address
                    <textArea name="address" required=""></textarea>
                    Date
                    <input type="text" id="datepicker" name="date" required="">
                    Start
                    <input type="time" name="start" required="">
                    End
                    <input type="time" name="end" required="">
                    <input type="submit" value="Set">
                </form>
                    </div>
                </div>
                <div id="eOthers" class="tabcontent1">
                    <div style="margin-top: 32px;margin-bottom: 20px;padding: 10px;">
                        <h3>Event Record</h3>
                    <% while(rst.next()){%>
                    <h2><%=rst.getString(1)%></h2>
                    <a href="delete_event?id=<%=rst.getString(6)%>" onclick="deleteAlert()"><img src="asset/delete.png" title="Delete"></a>
                    <a href="updateEvent.jsp?id=<%=rst.getString(6)%>"><img src="asset/refresh.png" style="float:right;" title="Update"></a>
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
                    <br><% } %>
                    </div>
                </div>
            </fieldset>
            <fieldset id="analyst">
                <h2><img src="asset/analysis.png"> Analysis</h2>
                <h3>Data Analysis For application form and Financial</h3>
                <div class="tab">
                    <button class="tablinks2" onclick="openAnalyst2(event, 'financial')">Financial</button>
                    <button class="tablinks2" onclick="openAnalyst2(event, 'financialReport')">Financial Report</button>
                    <button class="tablinks2" onclick="openAnalyst2(event, 'volunteer')">Volunteer</button>
                    <button class="tablinks2" onclick="openAnalyst2(event, 'beneficiairies')">Beneficiairies</button>
                </div>
                <div id="financial" class="tabcontent2">
                    <div style="padding:10px;">
                        <h3>Financial Activity</h3>
                <form action="financial" method="post">
                    Activity
                    <select name="activity">
                        <option value="none"></option>
                        <option value="programme">Programme</option>
                        <option value="aid">Aid</option>
                    </select><br>
                    Title
                    <input type="text" name="title" required="">
                    Month
                    <select name="month">
                        <option value="none"></option>
                        <option value="january">January</option>
                        <option value="february">February</option>
                        <option value="March">March</option>
                        <option value="April">April</option>
                        <option value="May">May</option>
                        <option value="June">June</option>
                        <option value="July">July</option>
                        <option value="August">August</option>
                        <option value="September">September</option>
                        <option value="October">October</option>
                        <option value="November">November</option>
                        <option value="December">December</option>
                    </select><br>
                    Year
                    <input type="text" name="year" pattern="[0-9]{4}" title="year should include four numbers only" required="">
                    Budget(RM)
                    <input type="text" name="budget" pattern="[0-9]{1,}" title="budget should include numbers only" required="">
                    <input type="submit" value="Submit">
                </form>
                        <div style="margin-top: 32px;margin-bottom: 20px;padding: 10px;">
                        <h3>Financial Report</h3>
                <table>
                    <tr>
                        <th>Activity</th>
                        <th>Title</th>
                        <th>Month</th>
                        <th>Year</th>
                        <th>Budget(RM)</th>
                    </tr>
                    <%
            Class.forName("com.mysql.jdbc.Driver");

            PreparedStatement finance = con.prepareStatement("select activity,title,month,year,budget,id from financial order by id desc");

            ResultSet f=finance.executeQuery();
            while(f.next()){ 
                %>
                    <tr>
                        <td><%=f.getString(1)%></td>
                        <td><%=f.getString(2)%></td>
                        <td style="text-align:center;"><%=f.getString(3)%></td>
                        <td style="text-align:center;"><%=f.getString(4)%></td>
                        <td style="text-align:center;"><%=f.getString(5)%></td>
                        <td style="text-align:center;"><a href="updateFinancial.jsp?id=<%=f.getString(6)%>"><img src="asset/refresh.png"></a></td><% } %>
                    </tr>
                </table>
                    </div>
                    </div>
                </div>
                <div id="financialReport" class="tabcontent2">
                     <div id="chartContainerAvg" class="analyst"></div>
                      <div id="chartContainerSum" class="analyst"></div>
                    <%
       Class.forName("com.mysql.jdbc.Driver");
       PreparedStatement xyz=null;
       PreparedStatement xxx=null;
      
       String avgA="SELECT AVG(budget)FROM financial where activity='programme'";
       String avgB="SELECT AVG(budget)FROM financial where activity='aid'";
      
       xyz=con.prepareStatement(avgA);
       xxx=con.prepareStatement(avgB);
     
       ResultSet haha=xyz.executeQuery(avgA);//programme
       ResultSet hehe=xxx.executeQuery(avgB);//aid
      
        
                while(haha.next())
           {        
               while(hehe.next())
           {        
       
       PreparedStatement xy=null;
       PreparedStatement xx=null;
       PreparedStatement mar=null;
       PreparedStatement apr=null;
       PreparedStatement mei=null;
       PreparedStatement jun=null;
       PreparedStatement jul=null;
       PreparedStatement aug=null;
       PreparedStatement sep=null;
       PreparedStatement otk=null;
       PreparedStatement nov=null;
       PreparedStatement des=null;
      
       String janu="SELECT SUM(budget)FROM financial where month='january' and year='2018' ";
       String febr="SELECT SUM(budget)FROM financial where month='february' and year='2018' ";
       String aprl="SELECT SUM(budget)FROM financial where month='april' and year='2018' ";
       String marc="SELECT SUM(budget)FROM financial where month='march' and year='2018' ";
       String meii="SELECT SUM(budget)FROM financial where month='may' and year='2018' ";
       String junn="SELECT SUM(budget)FROM financial where month='june' and year='2018' ";
       String juli="SELECT SUM(budget)FROM financial where month='july' and year='2018' ";
       String augs="SELECT SUM(budget)FROM financial where month='august' and year='2018' ";
       String sept="SELECT SUM(budget)FROM financial where month='september' and year='2018' ";
       String oct="SELECT SUM(budget)FROM financial where month='october' and year='2018' ";
       String nove="SELECT SUM(budget)FROM financial where month='november' and year='2018' ";
       String dece="SELECT SUM(budget)FROM financial where month='december' and year='2018' ";
     
       xy=con.prepareStatement(janu);
       xx=con.prepareStatement(febr);
       apr=con.prepareStatement(aprl);
       mar=con.prepareStatement(marc);
       mei=con.prepareStatement(meii);
       jun=con.prepareStatement(junn);
       jul=con.prepareStatement(juli);
       aug=con.prepareStatement(augs);
       sep=con.prepareStatement(sept);
       otk=con.prepareStatement(oct);
       nov=con.prepareStatement(nove);
       des=con.prepareStatement(dece);
     
     
       ResultSet satu=xy.executeQuery(janu);//programme
       ResultSet dua=xx.executeQuery(febr);//aid
       ResultSet tiga=mar.executeQuery(marc);//programme
       ResultSet empat=apr.executeQuery(aprl);//aid
       ResultSet lima=mei.executeQuery(meii);//programme
       ResultSet enam=jun.executeQuery(junn);//aid
       ResultSet tujuh=jul.executeQuery(juli);//programme
       ResultSet lapan=aug.executeQuery(augs);//aid
       ResultSet bilan=sep.executeQuery(sept);//programme
       ResultSet puluh=otk.executeQuery(oct);//aid
       ResultSet belas=nov.executeQuery(nove);//programme
       ResultSet dubelas=des.executeQuery(dece);//aid
      
      PreparedStatement xyz1=null;
       PreparedStatement xxx1=null;
       PreparedStatement mar1=null;
       PreparedStatement apr1=null;
       PreparedStatement mei1=null;
       PreparedStatement jun1=null;
       PreparedStatement jul1=null;
       PreparedStatement aug1=null;
       PreparedStatement sep1=null;
       PreparedStatement otk1=null;
       PreparedStatement nov1=null;
       PreparedStatement des1=null;
      
       String janu1="SELECT SUM(budget)FROM financial where month='january' and year='2019' ";
       String febr1="SELECT SUM(budget)FROM financial where month='february' and year='2019' ";
       String aprl1="SELECT SUM(budget)FROM financial where month='april' and year='2019' ";
       String marc1="SELECT SUM(budget)FROM financial where month='march' and year='2019' ";
       String meii1="SELECT SUM(budget)FROM financial where month='may' and year='2019' ";
       String junn1="SELECT SUM(budget)FROM financial where month='june' and year='2019' ";
       String juli1="SELECT SUM(budget)FROM financial where month='july' and year='2019' ";
       String augs1="SELECT SUM(budget)FROM financial where month='august' and year='2019' ";
       String sept1="SELECT SUM(budget)FROM financial where month='september' and year='2019' ";
       String oct1="SELECT SUM(budget)FROM financial where month='october' and year='2019' ";
       String nove1="SELECT SUM(budget)FROM financial where month='november' and year='2019' ";
       String dece1="SELECT SUM(budget)FROM financial where month='december' and year='2019' ";
     
       xyz1=con.prepareStatement(janu1);
       xxx1=con.prepareStatement(febr1);
       apr1=con.prepareStatement(aprl1);
       mar1=con.prepareStatement(marc1);
       mei1=con.prepareStatement(meii1);
       jun1=con.prepareStatement(junn1);
       jul1=con.prepareStatement(juli1);
       aug1=con.prepareStatement(augs1);
       sep1=con.prepareStatement(sept1);
       otk1=con.prepareStatement(oct1);
       nov1=con.prepareStatement(nove1);
       des1=con.prepareStatement(dece1);
     
     
       ResultSet satu1=xyz1.executeQuery(janu1);//programme
       ResultSet dua1=xxx1.executeQuery(febr1);//aid
       ResultSet tiga1=mar1.executeQuery(marc1);//programme
       ResultSet empat1=apr1.executeQuery(aprl1);//aid
       ResultSet lima1=mei1.executeQuery(meii1);//programme
       ResultSet enam1=jun1.executeQuery(junn1);//aid
       ResultSet tujuh1=jul1.executeQuery(juli1);//programme
       ResultSet lapan1=aug1.executeQuery(augs1);//aid
       ResultSet bilan1=sep1.executeQuery(sept1);//programme
       ResultSet puluh1=otk1.executeQuery(oct1);//aid
       ResultSet belas1=nov1.executeQuery(nove1);//programme
       ResultSet dubelas1=des1.executeQuery(dece1);//aid
      
          while(satu.next())
           {                  
                while(dua.next())
           { 
                 while(tiga.next())
           {                  
                while(empat.next())
           {          
                while(lima.next())
           {
                while(enam.next())
           {        
                while(tujuh.next())
           {      
                while(lapan.next())
           {        
                while(bilan.next())
           {  
                while(puluh.next())
           {          
                while(belas.next())
           {
                while(dubelas.next())
           {        
              while(satu1.next())
           {                  
                while(dua1.next())
           { 
                 while(tiga1.next())
           {                  
                while(empat1.next())
           {          
                while(lima1.next())
           {
                while(enam1.next())
           {        
                while(tujuh1.next())
           {      
                while(lapan1.next())
           {        
                while(bilan1.next())
           {  
                while(puluh1.next())
           {          
                while(belas1.next())
           {
                while(dubelas1.next())
           {  
%>
<script>
  function func3 () {


var chartbud = new CanvasJS.Chart("chartContainerAvg", {
	exportEnabled: false,
	animationEnabled: true,
	title:{
		text: "State Operating Funds"
	},
	legend:{
		cursor: "pointer",
		itemclick: explodePie
	},
	data: [{
		type: "pie",
		showInLegend: true,
                startAngle: 270,
		yValueFormatString: "##0.00\"\"",
		toolTipContent: "{name}: <strong>{y}%</strong>",
		indexLabel: "{name} - RM {y}",
		dataPoints: [
			{ y: <%=haha.getString(1)%>, name: "Programme" },
			{ y: <%=hehe.getString(1)%>, name: "Aid" },
			
		]
	}]
});
chartbud.render();

function explodePie (e) {
	if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
		e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
	} else {
		e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
	}
	e.chart.render();

}

var chart = new CanvasJS.Chart("chartContainerSum", {
	animationEnabled: true,
	title: {
		text: "Monthly Budget"
	},
	axisX: {
		interval: 1,
		intervalType: "month",
		valueFormatString: "MMMM"
	},
	axisY: {
		title: "RM",
		suffix: ""
	},
	data: [{
		type: "line",
		name: "2018",
		connectNullData: true,
		//nullDataLineDashType: "solid",
		xValueFormatString: "MMM, YYYY",
		//yValueFormatString: "#,##0.##\"%\"",
                showInLegend: true,
		dataPoints: [
			{ label: "January", y:  <%=satu.getString(1)%> },
			{ label: "February", y:  <%=dua.getString(1)%> },
                        { label: "March", y:  <%=tiga.getString(1)%> },
			{ label: "April", y:  <%=empat.getString(1)%>},
                        { label: "May", y:  <%=lima.getString(1)%> },
			{ label: "June", y:  <%=enam.getString(1)%> },
                        { label: "July", y:  <%=tujuh.getString(1)%> },
			{ label: "August", y:  <%=lapan.getString(1)%>},
                        { label: "September", y:  <%=bilan.getString(1)%> },
			{ label: "October", y:  <%=puluh.getString(1)%> },
                        { label: "November", y:  <%=belas.getString(1)%> },
			{ label: "December", y:  <%=dubelas.getString(1)%>},
			
		]
	},
	{
		type: "line",
		name: "2019",
		color: "#C24642",
		axisYIndex: 0,
                connectNullData: true,
		showInLegend: true,
		dataPoints: [
			{ label: "January", y:  <%=satu1.getString(1)%> },
			{ label: "February", y:  <%=dua1.getString(1)%> },
                        { label: "March", y:  <%=tiga1.getString(1)%> },
			{ label: "April", y:  <%=empat1.getString(1)%>},
                        { label: "May", y:  <%=lima1.getString(1)%> },
			{ label: "June", y:  <%=enam1.getString(1)%> },
                        { label: "July", y:  <%=tujuh1.getString(1)%> },
			{ label: "August", y:  <%=lapan1.getString(1)%>},
                        { label: "September", y:  <%=bilan1.getString(1)%> },
			{ label: "October", y:  <%=puluh1.getString(1)%> },
                        { label: "November", y:  <%=belas1.getString(1)%> },
			{ label: "December", y:  <%=dubelas1.getString(1)%>},
		
			
		] 
	}]
});
chart.render();
function toggleDataSeries(e) {
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible ){
		e.dataSeries.visible = true;
	} else {
		e.dataSeries.visible = false;
	}
	chart.render();
}

}
</script>
   <% }}}}}}}}}}}}}}}}}}}}}}}} }}%>
                </div>
                <div id="volunteer" class="tabcontent2" style="display:block">
                    <h3>volunteer analysis</h3>
                    <div id="chartContainerinfo" class="analyst"></div>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        PreparedStatement type=null;
                        PreparedStatement apa=null;
                        Statement profilee=con.createStatement();

                        String wuary="select * from volunteer";
                        String typee="select count(transport)  from volunteer where transport='Yes'";
                        String apo="select count(transport) from volunteer where transport='No'";

                        type=con.prepareStatement(typee);
                        apa=con.prepareStatement(apo);

                        ResultSet rssw=type.executeQuery(typee);//single
                        ResultSet kw=apa.executeQuery(apo);//married

                        PreparedStatement foodhandlingA=null;
                        PreparedStatement foodhandlingB=null;

                        String foodhandlingyes="select count(foodhandling_exp) from volunteer where foodhandling_exp='Yes'";
                        String foodhandlingno="select count(foodhandling_exp)  from volunteer where foodhandling_exp='No'";

                        foodhandlingA=con.prepareStatement(foodhandlingyes);
                        foodhandlingB=con.prepareStatement(foodhandlingno);

                        ResultSet foodA=foodhandlingA.executeQuery(foodhandlingyes);//yes
                        ResultSet foodB=foodhandlingB.executeQuery(foodhandlingno);//no

                        PreparedStatement memberNGOA=null;
                        PreparedStatement memberNGOB=null;

                        String memberNGOyes="select count(member_of_ngo) from volunteer where member_of_ngo<>'No'";
                        String memberNGOno="select count(member_of_ngo)  from volunteer where member_of_ngo='No'";

                        memberNGOA=con.prepareStatement(memberNGOyes);
                        memberNGOB=con.prepareStatement(memberNGOno);

                        ResultSet memberA=memberNGOA.executeQuery(memberNGOyes);//yes
                        ResultSet memberB=memberNGOB.executeQuery(memberNGOno);//no

                        PreparedStatement voluntary_workA=null;
                        PreparedStatement voluntary_workB=null;

                        String voluntary_workyes="select count(voluntary_worK) from volunteer where voluntary_work<>'No'";
                        String voluntary_workno="select count(voluntary_worK) from volunteer where voluntary_work='No'";

                        voluntary_workA=con.prepareStatement(voluntary_workyes);
                        voluntary_workB=con.prepareStatement(voluntary_workno);

                        ResultSet voluntaryA=voluntary_workA.executeQuery(voluntary_workyes);//yes
                        ResultSet voluntaryB=voluntary_workB.executeQuery(voluntary_workno);//no
                        
                        while(rssw.next()){
                            while(kw.next()){
                                while(foodA.next()){
                                    while(foodB.next()){
                                        while(memberA.next()){
                                            while(memberB.next()){
                                                while(voluntaryA.next()){
                                                    while(voluntaryB.next()){        
                 %> 
              <script>
                  function func1 () {
                      var chart = new CanvasJS.Chart("chartContainerinfo", {
                            animationEnabled: true,
                            title:{
                                    text: "Volunteer Details"
                            },	
                            axisY: {

                                    titleFontColor: "#4F81BC",
                                    lineColor: "#4F81BC",
                                    labelFontColor: "#4F81BC",
                                    tickColor: "#4F81BC"
                            },
                            axisY2: {

                                    titleFontColor: "#C0504E",
                                    lineColor: "#C0504E",
                                    labelFontColor: "#C0504E",
                                    tickColor: "#C0504E"
                            },	
                            toolTip: {
                                    shared: true
                            },
                            legend: {
                                    cursor:"pointer",
                                    itemclick: toggleDataSeries
                            },
                            data: [{
                                    type: "column",
                                    name: "Yes",
                                    legendText: "Yes",
                                    showInLegend: true, 
                                    dataPoints:[
                                            { label: "Trasport", y: <%=rssw.getString(1)%> },
                                            { label: "Food Handling", y: <%=foodA.getString(1)%> },
                                            { label: "Member of NGO", y: <%=memberA.getString(1)%> },
                                            { label: "Voluntary Work", y: <%=voluntaryA.getString(1)%> }

                                    ]
                            },
                            {
                                    type: "column",	
                                    name: "No",
                                    legendText: "No",
                                    axisYType: "secondary",
                                    showInLegend: true,
                                    dataPoints:[
                                            { label: "Transport", y: <%=kw.getString(1)%> },
                                            { label: "Food Handling", y:<%=foodB.getString(1)%> },
                                            { label: "Member of NGO", y: <%=memberB.getString(1)%>},
                                            { label: "Voluntary Work", y:<%=voluntaryB.getString(1)%> }

                                    ]
                            }]
                    });
                    chart.render();

                    function toggleDataSeries(e) {
                            if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                                    e.dataSeries.visible = false;
                            }
                            else {
                                e.dataSeries.visible = true;
                            }
                            chart.render();
                        }
                        }//window.onload = func1 ;

                </script>

<% }}}}}}}} %>

                </div>
                <div id="beneficiairies" class="tabcontent2">
                    <h3>beneficiairies analysis</h3>
                    <div id="chartContainer" class="analyst"></div>
                    <div id="chartContainergender" class="analyst"></div>
                    <%
                        PreparedStatement campur=null;
                        PreparedStatement genderA=null;
                        PreparedStatement genderB=null;

                        String wuarys="select count(gender)  from beneficiaries where gender='Male Female'";
                        String gendermale="select count(gender)  from beneficiaries where gender='Male'";
                        String genderfemale="select count(gender) from beneficiaries where gender='Female'";

                        genderA=con.prepareStatement(gendermale);
                        genderB=con.prepareStatement(genderfemale);
                        campur=con.prepareStatement(wuarys);

                        ResultSet rstt=campur.executeQuery(wuarys);
                        ResultSet rsst=genderA.executeQuery(gendermale);//single
                        ResultSet kt=genderB.executeQuery(genderfemale);//married

                        PreparedStatement specificfoodA=null;
                        PreparedStatement specificfoodB=null;

                        String specificfoodyes="select count(specific_food) from beneficiaries where specific_food='Yes'";
                        String specificfoodno="select count(specific_food)  from beneficiaries where specific_food='No'";

                        specificfoodA=con.prepareStatement(specificfoodyes);
                        specificfoodB=con.prepareStatement(specificfoodno);

                        ResultSet foodAt=specificfoodA.executeQuery(specificfoodyes);//yes
                        ResultSet foodBt=specificfoodB.executeQuery(specificfoodno);//no

                        PreparedStatement vehicleA=null;
                        PreparedStatement vehicleB=null;

                        String vehicleyes="select count(vehicle) from beneficiaries where vehicle<>'No'";
                        String vehicleno="select count(vehicle)  from beneficiaries where vehicle='No'";

                        vehicleA=con.prepareStatement(vehicleyes);
                        vehicleB=con.prepareStatement(vehicleno);

                        ResultSet vehicA=vehicleA.executeQuery(vehicleyes);//yes
                        ResultSet vehicB=vehicleB.executeQuery(vehicleno);//no

                        PreparedStatement kitchenA=null;
                        PreparedStatement kitchenB=null;

                        String kitchenyes="select count(kitchen) from beneficiaries where kitchen='Yes'";
                        String kitchenno="select count(kitchen) from beneficiaries where kitchen='No'";

                        kitchenA=con.prepareStatement(kitchenyes);
                        kitchenB=con.prepareStatement(kitchenno);

                        ResultSet kitchA=kitchenA.executeQuery(kitchenyes);//yes
                        ResultSet kitchB=kitchenB.executeQuery(kitchenno);//no

                        PreparedStatement facilitiesA=null;
                        PreparedStatement facilitiesB=null;

                        String facilitiesyes="select count(facilities) from beneficiaries where facilities='Yes'";
                        String facilitiesno="select count(facilities)  from beneficiaries where facilities='No'";

                        facilitiesA=con.prepareStatement(facilitiesyes);
                        facilitiesB=con.prepareStatement(facilitiesno);

                        ResultSet faciliA=facilitiesA.executeQuery(facilitiesyes);//yes
                        ResultSet faciliB=facilitiesB.executeQuery(facilitiesno);//no

                        PreparedStatement coldstorageA=null;
                        PreparedStatement coldstorageB=null;

                        String coldstorageyes="select count(cold_storage) from beneficiaries where cold_storage='Yes'";
                        String coldstorageno="select count(cold_storage)  from beneficiaries where cold_storage='No'";

                        coldstorageA=con.prepareStatement(coldstorageyes);
                        coldstorageB=con.prepareStatement(coldstorageno);

                        ResultSet coldA=coldstorageA.executeQuery(coldstorageyes);//yes
                        ResultSet coldB=coldstorageB.executeQuery(coldstorageno);//no

                        PreparedStatement chefA=null;
                        PreparedStatement chefB=null;

                        String chefyes="select count(chef) from beneficiaries where chef='Yes'";
                        String chefno="select count(chef) from beneficiaries where chef='No'";

                        chefA=con.prepareStatement(chefyes);
                        chefB=con.prepareStatement(chefno);

                        ResultSet chA=chefA.executeQuery(chefyes);//yes
                        ResultSet chB=chefB.executeQuery(chefno);//no

                        PreparedStatement purchasefoodA=null;
                        PreparedStatement purchasefoodB=null;

                        String purchasefoodyes="select count(purchase_food) from beneficiaries where purchase_food<>'No'";
                        String purchasefoodno="select count(purchase_food)  from beneficiaries where purchase_food='No'";

                        purchasefoodA=con.prepareStatement(purchasefoodyes);
                        purchasefoodB=con.prepareStatement(purchasefoodno);

                        ResultSet purchaseA=purchasefoodA.executeQuery(purchasefoodyes);//yes
                        ResultSet purchaseB=purchasefoodB.executeQuery(purchasefoodno);//no 

                                 while(rsst.next()){
                                     while(kt.next())
                            {while(rstt.next())
                            {while(foodAt.next())
                            {while(foodBt.next())
                            {while(vehicA.next())
                            {while(vehicB.next())
                            {while(kitchA.next())
                            {while(kitchB.next())
                            {while(faciliA.next())
                            {while(faciliB.next())
                            {while(coldA.next())
                            {while(coldB.next())
                            {while(chA.next())
                            {while(chB.next())
                            {while(purchaseA.next())
                            {while(purchaseB.next()){        

                 %>
            <script>
                function func2  () {
                    var chartgender = new CanvasJS.Chart("chartContainergender", {
                        title:{
                                text:"Gender In Home"
                        },
                        axisX:{
                                interval: 1
                        },
                        axisY2:{
                                interlacedColor: "rgba(1,77,101,.2)",
                                gridColor: "rgba(1,77,101,.1)",
                        },
                        data: [{
                                type: "bar",
                                name: "Gender",
                                axisYType: "primary",
                                color: "#1E9624",
                                dataPoints: [
                                        { y: <%=rsst.getString(1)%>, label: "Male" },
                                        { y: <%=kt.getString(1)%>, label: "Female" },
                                        { y: <%=rstt.getString(1)%>, label: "Both" }	


                                ]
                        }]

                });
                chartgender.render();

                var chart = new CanvasJS.Chart("chartContainer", {
                        animationEnabled: true,
                        title:{
                                text: "Beneficial Details"
                        },	
                        axisY: {

                                titleFontColor: "#4F81BC",
                                lineColor: "#4F81BC",
                                labelFontColor: "#4F81BC",
                                tickColor: "#4F81BC"
                        },
                        axisY2: {

                                titleFontColor: "#C0504E",
                                lineColor: "#C0504E",
                                labelFontColor: "#C0504E",
                                tickColor: "#C0504E"
                        },	
                        toolTip: {
                                shared: true
                        },
                        legend: {
                                cursor:"pointer",
                                itemclick: toggleDataSeries
                        },
                        data: [{
                                type: "column",
                                name: "Yes",
                                legendText: "Yes",
                                showInLegend: true, 
                                dataPoints:[
                                        { label: "Food", y:<%= foodAt.getString(1)%> },
                                        { label: "Vehicle", y:<%= vehicA.getString(1)%> },
                                        { label: "Kitchen", y: <%= kitchA.getString(1)%> },
                                        { label: "Facilities", y: <%= faciliA.getString(1)%> },
                                        { label: "Cold storage", y: <%= coldA.getString(1)%> },
                                        { label: "Chef", y: <%= chA.getString(1)%> },
                                        { label: "Purchase food", y: <%= purchaseA.getString(1)%> }
                                ]
                        },
                        {
                                type: "column",	
                                name: "No",
                                legendText: "No",
                                axisYType: "secondary",
                                showInLegend: true,
                                dataPoints:[
                                        { label: "Food", y: <%= foodBt.getString(1)%> },
                                        { label: "Vehicle", y: <%= vehicB.getString(1)%>},
                                        { label: "Kitchen", y: <%= kitchB.getString(1)%> },
                                        { label: "Facilities", y: <%= faciliB.getString(1)%> },
                                        { label: "Cold storage", y: <%= coldB.getString(1)%> },
                                        { label: "Chef", y: <%= chB.getString(1)%> },
                                        { label: "Purchase food", y: <%= purchaseB.getString(1)%> }
                                ]
                        }]
                });
                chart.render();

                function toggleDataSeries(e) {
                        if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                                e.dataSeries.visible = false;
                        }
                        else {
                                e.dataSeries.visible = true;
                        }
                        chart.render();
                }

                }
                function start (){
                func1();
                func2();
                func3();
                func4();
                }
                window.onload = start;

            </script>
            <% }}}}}}}}}}}}}}}}} %>
              </div>
            </fieldset>
            <div class="floatSide">
                <a href="https://www.facebook.com/foodaidfoundation"><img src="asset/facebook.png"></a>
                <a href="https://www.instagram.com/FoodAidFoundation/"><img src="asset/instagram.png"></a>
                <a href="https://www.foodaidfoundation.org/"><img src="asset/website.png"></a>
            </div>
        </div>
    </body>
</html>
