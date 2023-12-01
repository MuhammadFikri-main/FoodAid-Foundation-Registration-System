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
public class updateProfile extends HttpServlet {

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
            out.println("<title>Servlet updateProfile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProfile at " + request.getContextPath() + "</h1>");
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
         try(PrintWriter out = response.getWriter()){
            String id = request.getParameter("id");
            String name=request.getParameter("name");
            String user=(String) request.getSession().getAttribute("username");
            String email=request.getParameter("email");
            String nric=request.getParameter("nric");
            String address=request.getParameter("address");
            String contact=request.getParameter("contact");
            String profession=request.getParameter("profession");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
      
      Class.forName("com.mysql.jdbc.Driver");

      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
      PreparedStatement pst = con.prepareStatement("update account set name='"+name+"',email='"+email+"',nric='"+nric+"',address='"+address+"',contact='"+contact+"',profession='"+profession+"',username='"+username+"',password='"+password+"' where id="+id+"");
      PreparedStatement type = con.prepareStatement("select type from account where id="+id+"");
      //out.println(pst);
      int i = pst.executeUpdate();
      ResultSet y = type.executeQuery();
      while (y.next()){
          String in = y.getString("type");
      if(i!=0){
          if(in.equals("Executive")){
              //out.println(in);
              //response.sendRedirect("admin.jsp");
              response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Update Profile successfully');");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
          }
          if(in.equals("volunteer")||in.equals("beneficiairies")){
              //response.sendRedirect("volunteerHome.jsp");
              response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Update Profile successfully');");
                    out.println("location='volunteerHome.jsp';");
                    out.println("</script>");
              
          }
      }
      else{
        out.println("failed to insert the data");
      }
      
    } }  catch (ClassNotFoundException ex) {
            Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
