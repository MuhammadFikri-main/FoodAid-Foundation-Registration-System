<%-- 
    Document   : update
    Created on : May 12, 2019, 11:00:27 PM
    Author     : Fikri
--%>

<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    
    String id = request.getParameter("id");
    String name=request.getParameter("name");
            String user=(String) request.getSession().getAttribute("username");
            String email=request.getParameter("email");
            String nric=request.getParameter("nric");
            String contact=request.getParameter("contact");
            String profession=request.getParameter("profession");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            if(user != null){
            Connection con = null;
      PreparedStatement pst = null;
      try{
          Class.forName("com.mysql.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
      String sql="update account set name=?,email=?,nric=?,contact=?,profession=?,username=?,password=? where username='Najib'";
      pst = con.prepareStatement(sql);
      pst.setString(1, name);
      pst.setString(2, email);
      pst.setString(3, nric);
      pst.setString(4, contact);
      pst.setString(5, profession);
      pst.setString(6, username);
      pst.setString(7, password);
      
      int i = pst.executeUpdate();
      if(i>0){
          response.sendRedirect("admin.jsp");
        out.println("Record has been inserted");
      }
      else{
        out.println("failed to insert the data");
      }}
      catch(SQLException sql)
        {
        request.setAttribute("error", sql);
        out.println(sql);
        }}
%>
