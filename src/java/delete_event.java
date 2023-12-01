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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nazrul Naim
 */
public class delete_event extends HttpServlet {
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Statement st;
        try (PrintWriter out = response.getWriter()) {

            String id = request.getParameter("id");
            
            Class.forName("com.mysql.jdbc.Driver");

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
            PreparedStatement pst = con.prepareStatement("delete from event where id= '" + id + "' ");
//            out.println(pst);
            response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("var r =confirm(\"Are You Sure To Delete This Event?\");");
                    out.println("if(r==false){\n" +
"            }");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
            int i = pst.executeUpdate();
            if(i!=0){
                //out.println("Record has been inserted");
               // response.sendRedirect("admin.jsp");
                response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Delete Event Successfully');");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
            }
            else{
              out.println("failed to delete the data");
              response.setContentType("text/html");
                    out.println("<script type = \"text/javascript\">");
                    out.println("alert('Delete Event Failed');");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
 }}