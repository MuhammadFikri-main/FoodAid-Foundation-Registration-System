<%-- 
    Document   : updateEvent
    Created on : May 28, 2019, 11:56:57 AM
    Author     : Fikri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Event</title>
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
            }
            fieldset{
                border-radius: 10px;
                background-color: #ffff;
                margin: 30px auto;
                width:80%;
                border: 2px solid #1E9624;
                box-shadow: 5px 10px 8px #888888;
                padding:20px 10px;
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
            input[type=text],input[type=password],input[type=time]{
                width:99%;
                margin: 0px ;
                margin-bottom: 13px; 
                height:20px;
                padding:3px;
                border:2px solid #B0BEC5;
                background-color: white;
            }
            h2{
                text-align: center;
                font-size: 20px;
                text-transform: uppercase;
            }
            img{
                width: 30px;
            }
            #third .imgback{
                position: absolute;
                z-index: 1;
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
         <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
            String id = request.getParameter("id");

            PreparedStatement finance = con.prepareStatement("select activity,title,month,year,budget,id from financial where id='"+id+"' order by year asc,field(month,'january','february','march','april','may','june','july','august','september','october','october','november')");

            ResultSet f=finance.executeQuery();
            while(f.next()){
        %> 
        <fieldset id="third">
            <a href="admin.jsp" class="imgback"><img src="asset/back.png"></a>
                <div class="div">
                    <h2>Update Financial Record</h2>
                    <form action="updateFinancial" method="post">
                    Activity
                    <select name="activity">
                        <option value="<%=f.getString(1)%>" style="background-color: #A1213B;color: white;"><%=f.getString(1)%></option>
                        <option value="programme">Programme</option>
                        <option value="aid">Aid</option>
                    </select><br>
                    Title
                    <input type="text" name="title" value="<%=f.getString(2)%>">
                    Month
                    <select name="month">
                        <option value="<%=f.getString(3)%>" style="background-color: #A1213B;color: white;"><%=f.getString(3)%></option>
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
                    <input type="text" name="year" value="<%=f.getString(4)%>">
                    Budget
                    <input type="text" name="budget" value="<%=f.getString(5)%>">
                    <input type="text" name="id" value="<%=f.getString(6)%>" hidden><% } %>
                    <input type="submit" value="Update">
                </form>
                </div>
            </fieldset>
    </body>
</html>
