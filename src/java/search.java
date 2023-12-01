/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nazrul Naim
 */
public class search extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Statement st;
        try (PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            
            Class.forName("com.mysql.jdbc.Driver");

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
            String pst ="select name,type,status,id from account where name='" + name + "' " ;
            
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
 
            System.out.println("query " + pst);
            st = con.createStatement();
            ResultSet rs = st.executeQuery(pst);
            
             while (rs.next()) {
                al = new ArrayList();
 
                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                
                System.out.println("al :: " + al);
                pid_list.add(al);
            }
 
            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("/searchview.jsp");
            view.forward(request, response);
            con.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
 }}