<%-- 
    Document   : updateProfile
    Created on : May 7, 2019, 11:59:33 AM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username=(String) request.getSession().getAttribute("username");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");

            PreparedStatement pst = con.prepareStatement("select name,email,nric,contact,profession,username,password,id from account where username='"+username+"'");

            ResultSet rs=pst.executeQuery();
            while(rs.next()){ 
        %> 
        <h1>update Profile!</h1>
        <form action="updateProfile" method="post">
            name : <input type="text" name="name" value="<%=rs.getString(1)%>"><br>
            Email :<input type="text" name="email" value="<%=rs.getString(2)%>"> <br>
            NRIC no. :<input type="text" name="nric" value="<%=rs.getString(3)%>"> <br>
            contact no. :<input type="text" name="contact" value="<%=rs.getString(4)%>"><br>
            profession :<input type="text" name="profession" value="<%=rs.getString(5)%>"><br>
            username :<input type="text" name="username" value="<%=rs.getString(6)%>"><br>
            password :<input type="text" name="password" value="<%=rs.getString(7)%>"><br>
            <input type="hidden" name="id" value="<%=rs.getString(8)%>"><br>
            <input type="submit" value="submit"><% } %>
        </form>
    </body>
</html>
