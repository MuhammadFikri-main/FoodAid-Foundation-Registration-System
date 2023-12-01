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
public class beneficialDetails extends HttpServlet {

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
            out.println("<title>Servlet beneficialDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet beneficialDetails at " + request.getContextPath() + "</h1>");
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
            String acc_name=(String) request.getSession().getAttribute("b_name");
            
           
           String type_of_home="";
           String lang[]=request.getParameterValues("type_of_home");
           for(int i=0;i<lang.length;i++){
               type_of_home+=lang[i]+" ";
           }
           
           String no_of_people = request.getParameter("no_of_people");
           
           String age="";
           String lang1[]=request.getParameterValues("age");
           for(int i=0;i<lang1.length;i++){
               age+=lang1[i]+" ";
           }
           String gender="";
           String lang2[]=request.getParameterValues("gender");
           for(int i=0;i<lang2.length;i++){
               gender+=lang2[i]+" ";
           }
           String no_of_worker = request.getParameter("no_of_worker");
           String meals_per_day = request.getParameter("meals_per_day");
           
           String religion="";
           String lang3[]=request.getParameterValues("religion");
           for(int i=0;i<lang3.length;i++){
               religion+=lang3[i]+" ";
           }
           String specific_food="";
           String lang4[]=request.getParameterValues("specific_food");
           for(int i=0;i<lang4.length;i++){
               specific_food+=lang4[i]+"";
           }
           String vehicle="";
           String lang5[]=request.getParameterValues("vehicle");
           for(int i=0;i<lang5.length;i++){
               vehicle+=lang5[i]+"";
           }
           String kitchen="";
           String lang6[]=request.getParameterValues("kitchen");
           for(int i=0;i<lang6.length;i++){
               kitchen+=lang6[i]+"";
           }
           String facilities="";
           String lang7[]=request.getParameterValues("facilities");
           for(int i=0;i<lang7.length;i++){
               facilities+=lang7[i]+"";
           }
           String cold_storage="";
           String lang8[]=request.getParameterValues("cold_storage");
           for(int i=0;i<lang8.length;i++){
               cold_storage+=lang8[i]+"";
           }
           String chef="";
           String lang9[]=request.getParameterValues("chef");
           for(int i=0;i<lang9.length;i++){
               chef+=lang9[i]+"";
           }
           String kind_of_food="";
           String lang10[]=request.getParameterValues("kind_of_food");
           for(int i=0;i<lang10.length;i++){
               kind_of_food+=lang10[i]+" ";
           }
           String purchase_food="";
           String lang11[]=request.getParameterValues("purchase_food");
           for(int i=0;i<lang11.length;i++){
               purchase_food+=lang11[i]+"";
           }
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
            PreparedStatement pst = con.prepareStatement("insert into beneficiaries (acc_id,type_of_home,no_of_people,age,gender,"
                    + "no_of_worker,meals_per_day,religion,specific_food,vehicle,"
                    + "kitchen,facilities,cold_storage,chef,kind_of_food,purchase_food)"
                        + "values ((select id from account where name='"+acc_name+"'),'"+type_of_home+"','"+no_of_people+"','"+age+"','"+gender+"',"
                                + "'"+no_of_worker+"','"+meals_per_day+"','"+religion+"','"+specific_food+"','"+vehicle+"',"
                                        + "'"+kitchen+"','"+facilities+"','"+cold_storage+"','"+chef+"','"+kind_of_food+"','"+purchase_food+"')");
                int x = pst.executeUpdate();
            if(x!=0){
                response.sendRedirect("homeDetails.jsp");
                out.println("details record has been inserted");
            }
            else{
              out.println("details failed to insert the data");
            }
    }   catch (ClassNotFoundException ex) { 
            Logger.getLogger(beneficialDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(beneficialDetails.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
