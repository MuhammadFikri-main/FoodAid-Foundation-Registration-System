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
        <title>JSP Page</title>
        <style>
            body{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }
            #nav{
                height: 100%;
                width: 180px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                padding-top: 20px;
            }
            #nav a{
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
            }
            #nav a:hover {
                background-color: #1E9624;
                color: #f1f1f1;
              }
            .base{
                margin-left: 180px; /* Same as the width of the sidenav */
                padding: 0px 10px;
            }
            fieldset{
                margin: 0 auto;
                display: none;
                width:80%;
                padding:20px;
                margin-top:50px;
                border: 1px solid #1E9624;
            }
            #third{
                margin: 0 auto;
                display:block;
                width:80%;
                padding:20px;
                margin-top:50px;
            }
            input[type=submit]{
                border: none;
                padding: 7px;
                background-color: #1E9624;
                color: white;
                margin-top: 13px;
                width: 20%;
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
                width: 80%;
                margin: 0 auto;
                padding: 20px;
            }
            img{
                width: 20px;
            }
            table{
                width: 100%;
                margin: 0 auto;
                border-collapse: collapse;
            }
            tr:hover {background-color: #f5f5f5;}
            td{
                height: 30px;
                border: 1px solid black; 
            }
            table td a{
                text-decoration: none;
            }
            .center{
                text-align: center;
            }
            input[type=text],input[type=password]{
                width:100%;
                margin: 0px ;
                margin-bottom: 13px; 
                height:20px;
                padding:3px;
                border:1px solid black;
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
        document.getElementById("third").style.display = "none";
        document.getElementById("update").style.display = "none";
        document.getElementById("event").style.display = "none";
        document.getElementById("event").style.display = "none";
        }
        function update() {
        document.getElementById("first").style.display = "none";
        document.getElementById("second").style.display = "none";
        document.getElementById("third").style.display = "none";
        document.getElementById("update").style.display = "block";
        document.getElementById("event").style.display = "none";
        }
        function application() {
        document.getElementById("first").style.display = "none";
        document.getElementById("second").style.display = "block";
        document.getElementById("third").style.display = "none";
        document.getElementById("update").style.display = "none";
        document.getElementById("event").style.display = "none";
        }
        function analysis() {
        document.getElementById("first").style.display = "none";
        document.getElementById("second").style.display = "none";
        document.getElementById("third").style.display = "block";
        document.getElementById("update").style.display = "none";
        document.getElementById("event").style.display = "block";
        }
        function events() {
        document.getElementById("first").style.display = "none";
        document.getElementById("second").style.display = "none";
        document.getElementById("third").style.display = "block";
        document.getElementById("update").style.display = "none";
        document.getElementById("event").style.display = "block";
        }
        </script>
        <div id="nav">
            <img src="asset/faf.png" style="width: 100px;margin-left: 30px;margin-bottom: 20px;">
            <a href="#" onclick="profile()">Profile</a>
            <a href="#" onclick="application()">Application</a>
            <a href="#" onclick="events()">Event</a>
            <a href="logout">logout</a>
        </div>
        <%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no_cache");
            response.setHeader("Expires", "0");
            String username=(String) request.getSession().getAttribute("username");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");

            PreparedStatement pst = con.prepareStatement("select name,type,email,nric,contact,profession from account where username='"+username+"'");
            PreparedStatement p = con.prepareStatement("select name,email,nric,contact,profession,username,password,id from account where username='"+username+"'");
            PreparedStatement st = con.prepareStatement("select name,address,date,start,end from event");

            ResultSet rs=pst.executeQuery();
            ResultSet r=p.executeQuery();
            ResultSet rst=st.executeQuery();
            while(rs.next()){ 
        %> 
        <div class="base">
            <fieldset id="first">
                <div class="section">
                <h2><%=rs.getString(1)%></h2>
                <h3><%=rs.getString(2)%></h3>
                </div>
                <div class="section">
                <table>
                    <tr>
                        <td><img src="asset/email.png"></td>
                        <td>
                            Email<br><%=rs.getString(3)%>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="asset/card.png"></td>
                        <td>
                            Nric<br><%=rs.getString(4)%>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="asset/smartphone.png"></td>
                        <td>
                            Contact<br><%=rs.getString(5)%>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="asset/user.png"></td>
                        <td>
                            Profession<br><%=rs.getString(6)%><% } %>
                        </td>
                    </tr>
                </table>
                        <a href="#" onclick="update()"><input type="submit" value="Update"></a>
                </div>
                        
            </fieldset>
                        <fieldset id="update">
                            <div class="section">
        <h2>Profile!</h2>
        <form action="updateProfile" method="post">
            <% while(r.next()) {%>
            Name<br>
            <input type="text" name="name" value="<%=r.getString(1)%>"><br>
            Email<br>
            <input type="text" name="email" value="<%=r.getString(2)%>"> <br>
            NRIC No.<br>
            <input type="text" name="nric" value="<%=r.getString(3)%>"> <br>
            Contact No.<br>
            <input type="text" name="contact" value="<%=r.getString(4)%>"><br>
            Profession<br>
            <input type="text" name="profession" value="<%=r.getString(5)%>"><br>
            Username<br>
            <input type="text" name="username" value="<%=r.getString(6)%>"><br>
            Password<br>
            <input type="text" name="password" value="<%=r.getString(7)%>"><br>
            <input type="hidden" name="id" value="<%=r.getString(8)%>"><br>
            <input type="submit" value="Update"><% } %>
        </form>
                            </div>
                        </fieldset>
        <fieldset id="second">
            <%
            Class.forName("com.mysql.jdbc.Driver");
    
    PreparedStatement profile = con.prepareStatement("select name,email,nric,contact,profession from account where username='"+username+"'");
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
<h2>Application Form!</h2>
        <table>
            <tr>
                <td colspan="2"><h2>Profile!</h2></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=pr.getString(1)%></td>
            </tr>
            <tr>
                <td>email</td>
                <td><%=pr.getString(2)%></td>
            </tr>
            <tr>
                <td>nric</td>
                <td><%=pr.getString(3)%></td>
            </tr>
            <tr>
                <td>contact</td>
                <td><%=pr.getString(4)%></td>
            </tr>
            <tr>
                <td>profession</td>
                <td><%=pr.getString(5)%></td><% } while(ds.next()) { %>
            </tr>
            <tr>
                <td colspan="2"><h2>details!</h2></td>
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
                <td colspan="2"><h2>Home Information</h2></td>
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
                <td><%=in.getString(5)%></td>
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
            <tr>
                <td colspan="2"><h2>Home</h2></td>
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
                <td><%=bs.getString(15)%></td> <% } while(wk.next()) { %>
            </tr>
            <tr>
                <td colspan="2"><h2>working experience!</h2></td>
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
                <td colspan="2"><h2>support!</h2></td>
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
            
        </table>
        </fieldset>
                <fieldset id="third">
                    <h2>Event</h2>
                <% while(rst.next()){%>
                <table>
                    <tr>
                        <td>Name :</td>
                        <td><%=rst.getString(1)%></td>
                    </tr>
                    <tr>
                        <td>Address :</td>
                        <td><%=rst.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>Date :</td>
                        <td><%=rst.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>Time :</td>
                        <td><%=rst.getString(4)%> - <%=rst.getString(5)%></td>
                    </tr>
                </table>
                <% } %>
            </fieldset>
            <fieldset id="event">
                <h2>Event</h2>
                <form action="event" method="post">
                    Name<br>
                    <input type="text" name="name"><br>
                    Address<br>
                    <input type="text" name="address"> <br>
                    Date<br>
                    <input type="text" name="date"> <br>
                    Start<br>
                    <input type="text" name="start"><br>
                    End<br>
                    <input type="text" name="end"><br>
                    <input type="submit" value="Update">
                </form>
            </fieldset>
        </div>
    </body>
</html>
