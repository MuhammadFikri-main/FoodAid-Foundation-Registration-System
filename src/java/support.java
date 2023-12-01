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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fikri
 */
public class support extends HttpServlet {

    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        // <editor-fold defaultstate="collapsed" desc=" Email ">
        final String username = "foodfoundationm@gmail.com";//your email id 
        final String password = "foundation123";// your password
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

// </editor-fold>
        
        
        try   {
            
            String acc_name=(String) request.getSession().getAttribute("b_name");            
            String name=request.getParameter("name");
            String date_from=request.getParameter("date_from");
            String date_to=request.getParameter("date_to");
            String type_of_donation=request.getParameter("type_of_donation");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faf","root","");
            
            PreparedStatement em = con.prepareStatement("select email from account where name='"+acc_name+"'");
                PreparedStatement pst = con.prepareStatement("insert into support (acc_id,name,date_from,date_to,type_of_donation)"
                        + "values ((select id from account where name='"+acc_name+"'),'"+name+"','"+date_from+"','"+date_to+"','"+type_of_donation+"')");
            
            int i = pst.executeUpdate();
            if(i!=0){
                
                ResultSet e=em.executeQuery();
                while(e.next()){
                String cth = e.getString(1);
                //out.println(cth);
                
                
                response.sendRedirect("index.html");
                out.println("Record has been inserted");
                
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.addRecipients(Message.RecipientType.CC,InternetAddress.parse(cth));
                message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(username));
                message.setContent("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
                "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" +
                "<head>\n" +
                "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
                "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n" +
                "  <title>Zen Flat Ping Email</title>\n" +
                "  <style type=\"text/css\" media=\"screen\">\n" +
                "\n" +
                "    /* Force Hotmail to display emails at full width */\n" +
                "    .ExternalClass {\n" +
                "      display: block !important;\n" +
                "      width: 100%;\n" +
                "    }\n" +
                "\n" +
                "    /* Force Hotmail to display normal line spacing */\n" +
                "    .ExternalClass,\n" +
                "    .ExternalClass p,\n" +
                "    .ExternalClass span,\n" +
                "    .ExternalClass font,\n" +
                "    .ExternalClass td,\n" +
                "    .ExternalClass div {\n" +
                "      line-height: 100%;\n" +
                "    }\n" +
                "\n" +
                "    body,\n" +
                "    p,\n" +
                "    h1,\n" +
                "    h2,\n" +
                "    h3,\n" +
                "    h4,\n" +
                "    h5,\n" +
                "    h6 {\n" +
                "      margin: 0;\n" +
                "      padding: 0;\n" +
                "    }\n" +
                "\n" +
                "    body,\n" +
                "    p,\n" +
                "    td {\n" +
                "      font-family: Arial, Helvetica, sans-serif;\n" +
                "      font-size: 15px;\n" +
                "      color: #333333;\n" +
                "      line-height: 1.5em;\n" +
                "    }\n" +
                "\n" +
                "    h1 {\n" +
                "      font-size: 24px;\n" +
                "      font-weight: normal;\n" +
                "      line-height: 24px;\n" +
                "    }\n" +
                "\n" +
                "    body,\n" +
                "    p {\n" +
                "      margin-bottom: 0;\n" +
                "      -webkit-text-size-adjust: none;\n" +
                "      -ms-text-size-adjust: none;\n" +
                "    }\n" +
                "\n" +
                "    img {\n" +
                "      outline: none;\n" +
                "      text-decoration: none;\n" +
                "      -ms-interpolation-mode: bicubic;\n" +
                "    }\n" +
                "\n" +
                "    a img {\n" +
                "      border: none;\n" +
                "    }\n" +
                "\n" +

                "\n" +
                "    table.background {\n" +
                "      margin: 0;\n" +
                "      padding: 0;\n" +
                "      width: 100% !important;\n" +
                "    }\n" +
                "\n" +
                "    .block-img {\n" +
                "      display: block;\n" +
                "      line-height: 0;\n" +
                "    }\n" +
                "\n" +
                "    a {\n" +
                "      color: white;\n" +
                "      text-decoration: none;\n" +
                "    }\n" +
                "\n" +
                "    a,\n" +
                "    a:link {\n" +
                "      color: #2A5DB0;\n" +
                "      text-decoration: underline;\n" +
                "    }\n" +
                "\n" +
                "    table td {\n" +
                "      border-collapse: collapse;\n" +
                "    }\n" +
                "\n" +
                "    td {\n" +
                "      vertical-align: top;\n" +
                "      text-align: left;\n" +
                "    }\n" +
                "\n" +
                "    .wrap {\n" +
                "      width: 600px;\n" +
                "    }\n" +
                "\n" +
                "    .wrap-cell {\n" +
                "      padding-top: 30px;\n" +
                "      padding-bottom: 30px;\n" +
                "    }\n" +
                "\n" +
                "    .header-cell,\n" +
                "    .body-cell,\n" +
                "    .footer-cell {\n" +
                "      padding-left: 20px;\n" +
                "      padding-right: 20px;\n" +
                "    }\n" +
                "\n" +
                "    .header-cell {\n" +
                "      background-color: #eeeeee;\n" +
                "      font-size: 24px;\n" +
                "      color: #ffffff;\n" +
                "    }\n" +
                "\n" +
                "    .body-cell {\n" +
                "      background-color: #ffffff;\n" +
                "      padding-top: 30px;\n" +
                "      padding-bottom: 34px;\n" +
                "    }\n" +
                "\n" +
                "    .footer-cell {\n" +
                "      background-color: #eeeeee;\n" +
                "      text-align: center;\n" +
                "      font-size: 13px;\n" +
                "      padding-top: 30px;\n" +
                "      padding-bottom: 30px;\n" +
                "    }\n" +
                "\n" +
                "    .card {\n" +
                "      width: 400px;\n" +
                "      margin: 0 auto;\n" +
                "    }\n" +
                "\n" +
                "    .data-heading {\n" +
                "      text-align: right;\n" +
                "      padding: 10px;\n" +
                "      background-color: #ffffff;\n" +
                "      font-weight: bold;\n" +
                "    }\n" +
                "\n" +
                "    .data-value {\n" +
                "      text-align: left;\n" +
                "      padding: 10px;\n" +
                "      background-color: #ffffff;\n" +
                "    }\n" +
                "\n" +
                "    .force-full-width {\n" +
                "      width: 100% !important;\n" +
                "    }\n" +
                "\n" +
                "  </style>\n" +
                "  <style type=\"text/css\" media=\"only screen and (max-width: 600px)\">\n" +
                "    @media only screen and (max-width: 600px) {\n" +
                "      body[class*=\"background\"],\n" +
                "      table[class*=\"background\"],\n" +
                "      td[class*=\"background\"] {\n" +
                "        background: #eeeeee !important;\n" +
                "      }\n" +
                "\n" +
                "      table[class=\"card\"] {\n" +
                "        width: auto !important;\n" +
                "      }\n" +
                "\n" +
                "      td[class=\"data-heading\"],\n" +
                "      td[class=\"data-value\"] {\n" +
                "        display: block !important;\n" +
                "      }\n" +
                "\n" +
                "      td[class=\"data-heading\"] {\n" +
                "        text-align: left !important;\n" +
                "        padding: 10px 10px 0;\n" +
                "      }\n" +
                "\n" +
                "      table[class=\"wrap\"] {\n" +
                "        width: 100% !important;\n" +
                "      }\n" +
                "\n" +
                "      td[class=\"wrap-cell\"] {\n" +
                "        padding-top: 0 !important;\n" +
                "        padding-bottom: 0 !important;\n" +
                "      }\n" +
                "    }\n" +
                "  </style>\n" +
                "</head>\n" +
                "\n" +
                "<body leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" offset=\"0\" bgcolor=\"\" class=\"background\">\n" +
                "  <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" class=\"background\">\n" +
                "    <tr>\n" +
                "      <td align=\"center\" valign=\"top\" width=\"100%\" class=\"background\">\n" +
                "        <center>\n" +
                "          <table cellpadding=\"0\" cellspacing=\"0\" width=\"600\" class=\"wrap\">\n" +
                "            <tr>\n" +
                "              <td valign=\"top\" class=\"wrap-cell\" style=\"padding-top:30px; padding-bottom:30px;\">\n" +
                "                <table cellpadding=\"0\" cellspacing=\"0\" class=\"force-full-width\">\n" +
                "                  <tr>\n" +
                "                   <td height=\"60\" valign=\"top\" class=\"header-cell\">\n" +
                "                      <img width=\"80\" height=\"80\" img src=\"http://www.fnb-facilities.com/Clients/fnb-facilities/foodaid.jpg\">\n" +
                "                    </td>\n" +
                "                  </tr>\n" +
                "                  <tr>\n" +
                "                    <td valign=\"top\" class=\"body-cell\">\n" +
                "\n" +
                "                      <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" bgcolor=\"#ffffff\">\n" +
                "                        <tr>\n" +
                "                          <td valign=\"top\" style=\"padding-bottom:15px; background-color:#ffffff;\">\n" +
                "                            <h1>Your Information has been Successfully Submitted and awaiting Verification</h1>\n" +
                "                          </td>\n" +
                "                        </tr>\n" +
                "                        <tr>\n" +
                "                          <td valign=\"top\" style=\"padding-bottom:20px; background-color:#ffffff;\">\n" +
                "                            <b>Hi Mr/Mr.s,</b><br>\n" +
                "                            Your information have been submit. Please <a href=\"https://www.foodaidfoundation.org/\">contact support</a> for any problems.\n" +
                "                          </td>\n" +
                "                        </tr>\n" +
                "                        <tr>\n" +
                "                          <td>\n" +
                "                            <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#ffffff\">\n" +
                "                              <tr>\n" +
                "                                <td style=\"width:200px;background:#008000;\">\n" +
                "                                  <div><!--[if mso]>\n" +
                "                                    <v:rect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"#\" style=\"height:40px;v-text-anchor:middle;width:200px;\" stroke=\"f\" fillcolor=\"#008000\">\n" +
                "                                      <w:anchorlock/>\n" +
                "                                      <center>\n" +
                "                                    <![endif]-->\n" +
                "                                        <a href=\"http://localhost:8080/FAF/index.html\"\n" +
                "                                  style=\"background-color:#008000;color:#ffffff;display:inline-block;font-family:sans-serif;font-size:18px;line-height:40px;text-align:center;text-decoration:none;width:200px;-webkit-text-size-adjust:none;\">Check Account</a>\n" +
                "                                    <!--[if mso]>\n" +
                "                                      </center>\n" +
                "                                    </v:rect>\n" +
                "                                  <![endif]--></div>\n" +
                "                                </td>\n" +
                "                                <td width=\"360\" style=\"background-color:#ffffff; font-size:0; line-height:0;\">&nbsp;</td>\n" +
                "                              </tr>\n" +
                "                            </table>\n" +
                "                          </td>\n" +
                "                        </tr>\n" +
                "                        <tr>\n" +
                "                          <td style=\"padding-top:20px;background-color:#ffffff;\">\n" +
                "                            Thank you so much,<br>\n" +
                "                            \"Food Banking For The Needy\"\n" +
                "                          </td>\n" +
                "                        </tr>\n" +
                "                      </table>\n" +
                "                    </td>\n" +
                "                  </tr>\n" +
                "                  <tr>\n" +
                "                    <td valign=\"top\" class=\"footer-cell\">\n" +
                "                      We Would Love to Have You Visit Soon!<br>\n" +
                "                      Food Aid Foundation\n" +
                "                    </td>\n" +
                "                  </tr>\n" +
                "                </table>\n" +
                "              </td>\n" +
                "            </tr>\n" +
                "          </table>\n" +
                "        </center>\n" +
                "      </td>\n" +
                "    </tr>\n" +
                "  </table>\n" +
                "\n" +
                "</body>\n" +
                "</html>","text/html" );
                message.setSubject("Benefeciairies Details");
                Transport.send(message);
                }
                
            }
            else{
              out.println("failed to insert the data");
            }

    }   catch (Exception e) {
            out.println(e);
        }
    }


}