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
public class updateApplication extends HttpServlet {

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
         String acc_id = request.getParameter("acc_id");
            String username=(String) request.getSession().getAttribute("username");
       //volunteer
            String voluntary_work=request.getParameter("voluntary_work");
            String member_of_ngo=request.getParameter("member_of_ngo");
            String foodhandling_exp=request.getParameter("foodhandling_exp");
            String transport=request.getParameter("transport");
            String interest=request.getParameter("interest");
            
            //working ezp
            String company_name=request.getParameter("company_name");
  
            String position=request.getParameter("position");
            String year_from=request.getParameter("year_from");
            String year_to=request.getParameter("year_to");
            String last_salary=request.getParameter("last_salary");
            String leave_reason=request.getParameter("leave_reason");
             //benefial 
            /*String type_of_home=request.getParameter("type_of_home");
            String no_of_people=request.getParameter("no_of_people");
            String age=request.getParameter("age");
            String gender=request.getParameter("gender");
            String no_of_worker=request.getParameter("no_of_worker");
            String meals_per_day=request.getParameter("meals_per_day");
            String religion=request.getParameter("religion");
            String specific_food=request.getParameter("specific_food");
            String vehicle=request.getParameter("vehicle");
            String kitchen=request.getParameter("kitchen");
            String facilities=request.getParameter("facilities");
            String cold_storage=request.getParameter("cold_storage");
            String chef=request.getParameter("chef");
            String purchase_food=request.getParameter("purchase_food");
            String kind_of_food=request.getParameter("kind_of_food");*/
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
               specific_food+=lang4[i]+" ";
           }
           String vehicle="";
           String lang5[]=request.getParameterValues("vehicle");
           for(int i=0;i<lang5.length;i++){
               vehicle+=lang5[i]+" ";
           }
           String kitchen="";
           String lang6[]=request.getParameterValues("kitchen");
           for(int i=0;i<lang6.length;i++){
               kitchen+=lang6[i]+" ";
           }
           String facilities="";
           String lang7[]=request.getParameterValues("facilities");
           for(int i=0;i<lang7.length;i++){
               facilities+=lang7[i]+" ";
           }
           String cold_storage="";
           String lang8[]=request.getParameterValues("cold_storage");
           for(int i=0;i<lang8.length;i++){
               cold_storage+=lang8[i]+" ";
           }
           String chef="";
           String lang9[]=request.getParameterValues("chef");
           for(int i=0;i<lang9.length;i++){
               chef+=lang9[i]+" ";
           }
           String kind_of_food="";
           String lang10[]=request.getParameterValues("kind_of_food");
           for(int i=0;i<lang10.length;i++){
               kind_of_food+=lang10[i]+" ";
           }
           String purchase_food="";
           String lang11[]=request.getParameterValues("purchase_food");
           for(int i=0;i<lang11.length;i++){
               purchase_food+=lang11[i]+" ";
           }
            //home detail
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String telephone=request.getParameter("telephone");
            String mobile=request.getParameter("mobile");
            String email=request.getParameter("email");
            String fax=request.getParameter("fax");
            String registration_no=request.getParameter("registration_no");
            String owner=request.getParameter("owner");
            //support
            String name1=request.getParameter("name1");
            String date_from=request.getParameter("date_from");
            String date_to=request.getParameter("date_to");
            String type_of_donation=request.getParameter("type_of_donation");
            //account
//             String id = request.getParameter("id");
            String name2=request.getParameter("name2");
//            String user=(String) request.getSession().getAttribute("username");
            String email2=request.getParameter("email2");
          String nric2=request.getParameter("nric2");
            String address2=request.getParameter("address2");
            String contact=request.getParameter("contact");
            String profession=request.getParameter("profession");
            String password=request.getParameter("password");
         String types = request.getParameter ("type");
         
               out.println(id);
                out.println(acc_id);
            Class.forName("com.mysql.jdbc.Driver");

       
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
            //volunteer
      PreparedStatement pst = con.prepareStatement("update volunteer set voluntary_work='"+voluntary_work+"',member_of_ngo='"+member_of_ngo+"',foodhandling_exp='"+foodhandling_exp+"',transport='"+transport+"',interest='"+interest+"' where id="+id+"");
      PreparedStatement ok = con.prepareStatement("update work_experience set company_name='"+company_name+"',position='"+position+"',year_from='"+year_from+"',year_to='"+year_to+"',last_salary='"+last_salary+"',leave_reason='"+leave_reason+"' where id="+id+"");
      
      PreparedStatement type = con.prepareStatement("select type from account where id="+acc_id+"");   
            
      //benificaries
      PreparedStatement ub_details = con.prepareStatement("update beneficiaries set type_of_home='"+type_of_home+"',no_of_people='"+no_of_people+"',age='"+age+"',gender='"+gender+"',no_of_worker='"+no_of_worker+"',"
                        + "meals_per_day='"+meals_per_day+"',religion='"+religion+"',specific_food='"+specific_food+"',vehicle='"+vehicle+"',kitchen='"+kitchen+"',facilities='"+facilities+"',cold_storage='"+cold_storage+"',"
                         + "chef='"+chef+"',kind_of_food='"+kind_of_food+"',purchase_food='"+purchase_food+"' where id="+id+"");
      PreparedStatement uinfo = con.prepareStatement("update home_information set  name='"+name+"',address='"+address+"',telephone='"+telephone+"',mobile='"+mobile+"',email='"+email+"',fax='"+fax+"',registration_no='"+registration_no+"',owner ='"+owner+"'  where id="+id+"");
      PreparedStatement usupport = con.prepareStatement("update support set name='"+name1+"',date_from='"+date_from+"',date_to='"+date_to+"',type_of_donation='"+type_of_donation+"'  where id="+id+"");
      PreparedStatement lol = con.prepareStatement("update account set name='"+name2+"',email='"+email2+"',nric='"+nric2+"',address='"+address2+"',contact='"+contact+"',profession='"+profession+"' where id="+acc_id+"");
 
      PreparedStatement type1 = con.prepareStatement("select type from account where id="+id+" and type='volunteer'");   
      out.println(lol);
     
      ResultSet z = type1.executeQuery();
      PreparedStatement type2 = con.prepareStatement("select type from account where id="+id+" and type='beneficiairies'");
      ResultSet x = type2.executeQuery();
       

       
     ResultSet  y = type.executeQuery();
     y.next();
     
  
     if(     null != y.getString(1))switch (y.getString(1)) {
                 case "volunteer":
                     out.println(y.getString(1));
                     out.println(acc_id);
                     out.println(pst);
                     out.println(ok);
                     pst.executeUpdate();
                     ok.executeUpdate();
                    
                     break;
                 case "beneficiairies":
                     out.println(uinfo);
                     out.println(usupport);
                     out.println(ub_details);
                     uinfo.executeUpdate();
                     usupport.executeUpdate();
                     ub_details.executeUpdate();
                      
                     break;
                 default:
                     out.println("tiadk bolke ");
                     break;
             }
        int i = lol.executeUpdate();
         String in = y.getString("type");
      if(i!=0){
          if(in.equals("Executive")){
              out.println(in);
          response.sendRedirect("admin.jsp");
        out.println("Record has been inserted");
          }
          if(in.equals("volunteer")||in.equals("beneficiairies")){
              response.sendRedirect("volunteerHome.jsp");
          }
      }
      else{
        out.println("failed to insert the data");
      }
      
      
         }  catch (ClassNotFoundException ex) {
            Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
            out.print(ex);
        } catch (SQLException ex) {
            Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
            out.print(ex);
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
