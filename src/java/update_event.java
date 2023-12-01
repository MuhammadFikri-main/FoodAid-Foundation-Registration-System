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
public class update_event extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try(PrintWriter out = response.getWriter()){
            String id = request.getParameter("id");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String date=request.getParameter("date");
            String start=request.getParameter("start");
            String end=request.getParameter("end");
      
      Class.forName("com.mysql.jdbc.Driver");

      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
      PreparedStatement pst = con.prepareStatement("update event set name='"+name+"',address='"+address+"',date='"+date+"',start='"+start+"',end='"+end+"' where id="+id+"");
      out.println(pst);
      int i = pst.executeUpdate();
      if(i!=0){
         // response.sendRedirect("admin.jsp");
       //out.println("success");
       response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Update Event Successfully');");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
      }
      else{
        //out.println("failed to insert the data");
        response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Update Event Failed');");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
      }
      
    }   catch (ClassNotFoundException ex) {
            Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
