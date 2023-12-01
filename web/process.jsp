<%-- 
    Document   : process
    Created on : May 10, 2019, 9:40:21 AM
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
        <title>Process</title>
        <style>
            body{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
                text-transform: capitalize;
            }
            input[type=submit]{
                border: none;
                padding: 7px;
                background-color: #1E9624;
                color: white;
                margin: 13px;
                width: 20%;
                float: right;
                
                text-transform: capitalize;
                transition: border 0.8s ease,color 0.8s,background 0.8s;
            }
            input[type=submit]:hover{
                color: #1E9624;
                border: 2px solid #1E9624;
                background: #ffffff;
            }
            #submit{
                padding: 7px;
                background-color: red;
                color: white;
                margin-top: 13px;
                width: 20%;
                transition: border 0.8s ease,color 0.8s,background 0.8s;
            }
            #submit:hover{
                color: red;
                border: 2px solid red;
                background: #ffffff;
            }
            .base{ /* Same as the width of the sidenav */
                padding: 0px 10px;
            }
            .section{
                margin: 0 auto;
                width:80%;
                padding:20px;
                margin-top:50px;
                margin-bottom:50px;
                border: 1px solid #1E9624;
                border-radius: 10px;
                box-shadow: 5px 10px 8px #888888;
            }
            table{
                width: 100%;
                margin: 0 auto;
                border-collapse: collapse;
            }
            tr:hover {background-color: #f5f5f5;}
            td{
                padding-left: 10px;
                height: 30px;
                border: 1px solid black;
            }
            h2{
                text-align: center;
                font-size: 20px;
                text-transform: uppercase;
            }
            h4{
                text-align: center;
            }
            a{
                text-decoration: none;
            }
            img{
                width: 30px;
            }
            .section .imgback{
                position: absolute;
                z-index: 1;
            }
        </style>
    </head>
    <body>
        <div class="base">
        <div class="section">
         <%
            String id= request.getParameter("id");
            request.getSession().setAttribute("id",id);
            Class.forName("com.mysql.jdbc.Driver");
            
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
    
    PreparedStatement profile = con.prepareStatement("select name,email,nric,contact,profession from account where id="+id+"");
    PreparedStatement email = con.prepareStatement("select email from account where id="+id+"");
    PreparedStatement v_details = con.prepareStatement("select voluntary_work,member_of_ngo,foodhandling_exp,transport,interest from volunteer where acc_id="+id+"");
    PreparedStatement b_details = con.prepareStatement("select type_of_home,no_of_people,age,gender,no_of_worker,"
            + "meals_per_day,religion,specific_food,vehicle,kitchen,facilities,cold_storage,chef,kind_of_food,purchase_food from beneficiaries where acc_id="+id+"");
    PreparedStatement info = con.prepareStatement("select name,address,telephone,mobile,email,fax,registration_no,owner from home_information where acc_id="+id+"");
    PreparedStatement work = con.prepareStatement("select company_name,position,year_from,year_to,last_salary,leave_reason from work_experience where acc_id="+id+"");
    PreparedStatement support = con.prepareStatement("select name,date_from,date_to,type_of_donation from support where acc_id="+id+"");
    
    ResultSet rs=profile.executeQuery();
    ResultSet ds=v_details.executeQuery();
    ResultSet bs=b_details.executeQuery();
    ResultSet in=info.executeQuery();
    ResultSet wk=work.executeQuery();
    ResultSet sp=support.executeQuery();
    ResultSet e=email.executeQuery();
    while(rs.next()){ 
%>
 <form action="process" method="post">
     <a href="admin.jsp" class="imgback"><img src="asset/back.png"></a>
 <h2><img src="asset/bapp.png"> Process</h2>
        <table>
            <tr>
                <td colspan="2" style="border:none;"><h4>Profile</h4></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=rs.getString(1)%></td>
            </tr>
            <tr>
                <td>email</td>
                <td style="text-transform:none;"><%=rs.getString(2)%></td>
            </tr>
            <tr>
                <td>nric</td>
                <td><%=rs.getString(3)%></td>
            </tr>
            <tr>
                <td>contact</td>
                <td><%=rs.getString(4)%></td>
            </tr>
            <tr>
                <td>profession</td>
                <td><%=rs.getString(5)%></td><% } while(ds.next()) { %>
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
       <% while (e.next()){ %>
            <a href="process?email=<%=e.getString(1)%>">
                <input type="submit" name="action" value="accept" >
                <input type="submit" id="submit" name="action" value="reject"></a><% } %>
        </form>
        </div>
        </div>
    </body>
</html>
