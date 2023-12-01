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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fikri
 */
public class index extends HttpServlet {

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
            out.println("<title>Servlet index</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet index at " + request.getContextPath() + "</h1>");
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
        try (PrintWriter out = response.getWriter()) {
            
            String username=request.getParameter("username");
            request.getSession().setAttribute("username",username);
            String password=request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver");

            Connection con=DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/faf","root","");
            
            PreparedStatement exe = con.prepareStatement("Select id from account where username=? and password=? and status='Staff'");
                exe.setString(1, username);
                exe.setString(2, password);
                ResultSet x = exe.executeQuery();
            
            if(x.next()) 
               {
                   HttpSession session = request.getSession();
                   session.setAttribute("username",username);
                   response.sendRedirect("admin.jsp");
               }
            else
            {
                PreparedStatement pst = con.prepareStatement("Select name,password from account where username=? and password=?");
                pst.setString(1, username);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                
                if(rs.next())
                {
                    response.sendRedirect("volunteerHome.jsp");
                }
                else
                {
                    response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Username or Password is wrong');");
                    out.println("location='index.html';");
                    out.println("</script>");
                }
            }
        }  catch (SQLException ex) {
            Logger.getLogger(index.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(index.class.getName()).log(Level.SEVERE, null, ex);
        }}}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
 
