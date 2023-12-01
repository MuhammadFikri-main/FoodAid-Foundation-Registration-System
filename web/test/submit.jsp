<%-- 
    Document   : submit
    Created on : May 17, 2019, 3:50:59 PM
    Author     : Fikri
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            String acc_name=(String) request.getSession().getAttribute("v_name");  
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");

            PreparedStatement profile = con.prepareStatement("select type,status,name,email,nric,contact,profession from account where username='"+acc_name+"'");
            PreparedStatement v_details = con.prepareStatement("select voluntary_work,member_of_ngo,foodhandling_exp,transport,interest from volunteer where acc_id=(select id from account where username='"+acc_name+"')");
            PreparedStatement work = con.prepareStatement("select company_name,position,year_from,year_to,last_salary,leave_reason from work_experience where acc_id=(select id from account where username='"+acc_name+"')");

            ResultSet pr=profile.executeQuery();
            ResultSet ds=v_details.executeQuery();
            ResultSet wk=work.executeQuery();
            while(pr.next()){
        %>  
        Application Type : <%=pr.getString(1)%><br>
        Status : <%=pr.getString(2)%>
        <table>
            <tr>
                <td colspan="2"><h2>Profile!</h2></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=pr.getString(3)%></td>
            </tr>
            <tr>
                <td>email</td>
                <td><%=pr.getString(4)%></td>
            </tr>
            <tr>
                <td>nric</td>
                <td><%=pr.getString(5)%></td>
            </tr>
            <tr>
                <td>contact</td>
                <td><%=pr.getString(6)%></td>
            </tr>
            <tr>
                <td>profession</td>
                <td><%=pr.getString(7)%></td><% } while(ds.next()) { %>
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
                <td><%=ds.getString(5)%></td><% } while(wk.next()) {%>
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
                <td><%=wk.getString(6)%></td><% } %>
            </tr>
        </table>
    </body>
</html>
