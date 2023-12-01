/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fikri
 */
public class volunteerDetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet volunteerDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet volunteerDetails at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())  {
            String name=(String) request.getSession().getAttribute("v_name");
            
           
           String voluntary_work="";
           String lang[]=request.getParameterValues("voluntary_work");
           for(int i=0;i<lang.length;i++){
               voluntary_work+=lang[i]+"";
           }
           String member_of_ngo="";
           String lang1[]=request.getParameterValues("member_of_ngo");
           for(int i=0;i<lang1.length;i++){
               member_of_ngo+=lang1[i]+"";
           }
           String foodhandling_exp="";
           String lang2[]=request.getParameterValues("foodhandling_exp");
           for(int i=0;i<lang2.length;i++){
               foodhandling_exp+=lang2[i]+"";
           }
           String transport="";
           String lang3[]=request.getParameterValues("transport");
           for(int i=0;i<lang3.length;i++){
               transport+=lang3[i]+"";
           }
           String interest="";
           String lang4[]=request.getParameterValues("interest");
           for(int i=0;i<lang4.length;i++){
               interest+=lang4[i]+" ";
           }
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
            PreparedStatement pst = con.prepareStatement("insert into volunteer (acc_id,voluntary_work,member_of_ngo,foodhandling_exp,transport,interest)"
                        + "values ((select id from account where name='"+name+"'),'"+voluntary_work+"','"+member_of_ngo+"','"+foodhandling_exp+"','"+transport+"','"+interest+"')");
                int x = pst.executeUpdate();
            if(x!=0){
                response.sendRedirect("work_exp.jsp");
                out.println("details record has been inserted");
            }
            else{
              out.println("details failed to insert the data");
            }
    }   catch (ClassNotFoundException ex) {
            Logger.getLogger(volunteerDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(volunteerDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
    }}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
