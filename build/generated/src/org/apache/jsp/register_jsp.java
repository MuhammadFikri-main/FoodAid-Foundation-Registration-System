package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Register</title>\n");
      out.write("        <script src = \"http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("      <script src = \"http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                font-family: 'Montserrat', sans-serif;\n");
      out.write("            }\n");
      out.write("            body::-webkit-scrollbar {\n");
      out.write("                width: 0.8em;\n");
      out.write("                background-color: transparent;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            body::-webkit-scrollbar-track {\n");
      out.write("                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            body::-webkit-scrollbar-thumb {\n");
      out.write("              background-color: darkgrey;\n");
      out.write("              outline: 1px solid slategrey;\n");
      out.write("              border-radius: 10px;\n");
      out.write("            }\n");
      out.write("            .content{\n");
      out.write("                width:80%;\n");
      out.write("                margin:50px auto;\n");
      out.write("            }\n");
      out.write("            .main{\n");
      out.write("                float:left;\n");
      out.write("                width:100%;\n");
      out.write("            }\n");
      out.write("            #progressbar{\n");
      out.write("                margin:0;\n");
      out.write("                padding:0;\n");
      out.write("                font-size:18px;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            #active1{\n");
      out.write("                color:white;\n");
      out.write("                background-color: #1E9624;\n");
      out.write("                padding: 10px;\n");
      out.write("                border-radius: 4px;\n");
      out.write("            }\n");
      out.write("            fieldset{\n");
      out.write("                display:none;\n");
      out.write("                width:80%;\n");
      out.write("                margin: 0 auto;\n");
      out.write("                margin-top:30px;\n");
      out.write("                margin-bottom:30px;\n");
      out.write("                border-radius:10px;\n");
      out.write("                border: 2px solid #1E9624;\n");
      out.write("                box-shadow: 5px 10px 8px #888888;\n");
      out.write("            }\n");
      out.write("            #first{\n");
      out.write("                display:block;\n");
      out.write("                width:80%;\n");
      out.write("                border-radius:5px;\n");
      out.write("            }\n");
      out.write("            .base{\n");
      out.write("                width: 80%;\n");
      out.write("                margin: 0 auto;\n");
      out.write("                padding: 20px 0;\n");
      out.write("            }\n");
      out.write("            input[type=text],input[type=password],input[type=email]{\n");
      out.write("                width:98.5%;\n");
      out.write("                margin: 0px;\n");
      out.write("                margin-bottom: 13px; \n");
      out.write("                height:20px;\n");
      out.write("                padding:5px;\n");
      out.write("                border: 2px solid #B0BEC5;\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("            textArea{\n");
      out.write("                width:98.5%;\n");
      out.write("                margin: 0px;\n");
      out.write("                margin-bottom: 13px; \n");
      out.write("                height:50px;\n");
      out.write("                padding:5px;\n");
      out.write("                border: 2px solid #B0BEC5;\n");
      out.write("                background-color: white;\n");
      out.write("            }\n");
      out.write("            input[type=submit]{\n");
      out.write("                border: none;\n");
      out.write("                padding: 7px;\n");
      out.write("                background-color: #1E9624;\n");
      out.write("                color: white;\n");
      out.write("                width: 20%;\n");
      out.write("                float: right;\n");
      out.write("                transition: border 0.8s ease,color 0.8s,background 0.8s;\n");
      out.write("            }\n");
      out.write("            input[type=submit]:hover{\n");
      out.write("                color: #1E9624;\n");
      out.write("                border: 2px solid #1E9624;\n");
      out.write("                background: #ffffff;\n");
      out.write("            }\n");
      out.write("            h2,h3{\n");
      out.write("                text-align:center;\n");
      out.write("            }\n");
      out.write("            li{\n");
      out.write("                margin:30px;\n");
      out.write("                font-size: 15px;\n");
      out.write("                display:inline;\n");
      out.write("                color:#c1c5cc;\n");
      out.write("            }\n");
      out.write("            /*headings*/\n");
      out.write("            .fs-title {\n");
      out.write("                    font-size: 15px;\n");
      out.write("                    text-transform: uppercase;\n");
      out.write("                    color: #2C3E50;\n");
      out.write("                    margin-bottom: 10px;\n");
      out.write("            }\n");
      out.write("            .fs-subtitle {\n");
      out.write("                    font-weight: normal;\n");
      out.write("                    font-size: 13px;\n");
      out.write("                    color: #666;\n");
      out.write("            }\n");
      out.write("            img{\n");
      out.write("                width: 30px;\n");
      out.write("            }\n");
      out.write("    </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <script>\n");
      out.write("            var check = function() {\n");
      out.write("            if (document.getElementById('password').value ==\n");
      out.write("              document.getElementById('confirm-password').value) {\n");
      out.write("              document.getElementById('msg').style.color = 'green';\n");
      out.write("              document.getElementById('msg').innerHTML = 'matching';\n");
      out.write("              document.getElementById('submit').disabled = false;\n");
      out.write("            } else {\n");
      out.write("              document.getElementById('msg').style.color = 'red';\n");
      out.write("              document.getElementById('msg').innerHTML = 'not matching';\n");
      out.write("              document.getElementById('submit').disabled = true;\n");
      out.write("            }\n");
      out.write("          }\n");
      out.write("        </script>\n");
      out.write("       <!-- <script>\n");
      out.write("      $(document).ready(function() {\n");
      out.write("         function disablePrev() { window.history.forward() }\n");
      out.write("         window.onload = disablePrev();\n");
      out.write("         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }\n");
      out.write("      });\n");
      out.write("   </script>-->\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <!-- Multistep Form -->\n");
      out.write("            <div class=\"main\">\n");
      out.write("                    <form action=\"register\" method=\"post\">\n");
      out.write("                        <h3>Register</h3>\n");
      out.write("                        <!-- Fieldsets -->\n");
      out.write("                        <fieldset id=\"first\">\n");
      out.write("                            <div class=\"base\">\n");
      out.write("                                <label for=\"name\">Name</label><br>\n");
      out.write("                                <input type=\"text\" name=\"name\" required><br>\n");
      out.write("                                <label for=\"email\">Email</label><br>\n");
      out.write("                                <div class=\"fs-subtitle\">(e.g foodaid@gmail.com)</div>\n");
      out.write("                                <input type=\"email\" name=\"email\" pattern=\"[a-z0-9._%+-]+@[a-patz0-9.-]+\\.[a-z]{2,}$\" required><br>\n");
      out.write("                                <span id=\"validate\"></span>\n");
      out.write("                                <label for=\"nric\">NRIC No.</label><br>\n");
      out.write("                                <div class=\"fs-subtitle\">(e.g XXXXXX-XX-XXXX)</div>\n");
      out.write("                                <input type=\"text\" name=\"nric\" pattern=\"[0-9]{6}-[0-9]{2}-[0-9]{4}\" title=\"NRIC should include numbers only\" required><br>\n");
      out.write("                                <label for=\"address\">Address</label><br>\n");
      out.write("                                <textarea name=\"address\" required></textarea><br>\n");
      out.write("                                <label for=\"contact\">Contact No.</label><br>\n");
      out.write("                                <div class=\"fs-subtitle\">(e.g XXX-XXXXXXXX)</div>\n");
      out.write("                                <input type=\"text\" name=\"contact\" pattern=\"[0-9]{3}-[0-9]{7,8}\" title=\"Contact No should include numbers only\" required><br>\n");
      out.write("                                <label for=\"profession\">Profession or Working Experience</label><br>\n");
      out.write("                                <input type=\"text\" name=\"profession\" required><br>\n");
      out.write("                                <label for=\"username\">Username</label><br>\n");
      out.write("                                <div class=\"fs-subtitle\">*This is what you will use to login</div>\n");
      out.write("                                <input type=\"text\" name=\"username\" required><br>\n");
      out.write("                                <label for=\"password\">Password</label><br>\n");
      out.write("                                <input type=\"password\" name=\"password\" id=\"password\" onkeyup='check();' required><br>\n");
      out.write("                                <label for=\"confirm-password\">Confirm Password</label><br>\n");
      out.write("                                <div id='msg' class=\"fs-subtitle\"></div>\n");
      out.write("                                <input type=\"password\" name=\"confirm-password\" id=\"confirm-password\" onkeyup='check();' required><br>\n");
      out.write("                                <input type=\"submit\" value=\"Submit\" id=\"submit\">\n");
      out.write("                            </div>\n");
      out.write("                        </fieldset>\n");
      out.write("                    </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
