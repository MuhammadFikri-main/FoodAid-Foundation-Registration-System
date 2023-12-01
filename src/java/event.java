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
public class event extends HttpServlet {

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
            out.println("<title>Servlet event</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet event at " + request.getContextPath() + "</h1>");
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
            
            String event=request.getParameter("name");
            String address=request.getParameter("address");
            String date=request.getParameter("date");
            String start=request.getParameter("start");
            String end=request.getParameter("end");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
            
                PreparedStatement pst = con.prepareStatement("insert into event (name,address,date,start,end)"
                        + "values ('"+event+"','"+address+"','"+date+"','"+start+"','"+end+"')");
                int i = pst.executeUpdate();
                
            if(i!=0){
                //response.sendRedirect("admin.jsp");
                //out.println("Record has been inserted");
                response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Set Event Successfully');");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
            }
            else{
              //out.println("failed to insert the data");
              response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Set Event Failed');");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
            }

    }   catch (ClassNotFoundException ex) {  
            Logger.getLogger(event.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(event.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
