package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("        \n");
      out.write("             <!-- Custom CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"layout/css/bootstrap.min_1.css\"  type=\"text/css\"/>\n");
      out.write("        <link href=\"layout/css/customer.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"layout/css/main.css\" rel=\"stylesheet\">\n");
      out.write("        \n");
      out.write("         <!---Data table js--->\n");
      out.write("         <link rel=\"stylesheet\" type=\"text/css\" href=\"layout/dataTables/css/jquery.dataTables.css\">\n");
      out.write("        <script type=\"text/javascript\" src=\"layout/dataTables/js/jQuery.js\"></script>\n");
      out.write("       <script type=\"text/javascript\" src=\"layout/dataTables/js/jquery.dataTables.js\"></script>\n");
      out.write("       \n");
      out.write("        <!---Main js--->\n");
      out.write("        <script type=\"text/javascript\" src=\"layout/js/mian.js\"></script>\n");
      out.write("        \n");
      out.write("        <!---Date picke --->\n");
      out.write("        <link rel=\"stylesheet\" href=\"layout/datePicker/jquery-ui.js\">\n");
      out.write("    <script src=\"layout/datePicker/jquery-ui.min.js\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"layout/datePicker/jquery-ui.structure.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"layout/datePicker/jquery-ui.css\">\n");
      out.write("    <link href=\"layout/css/sidebarMenu.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("      <script>\n");
      out.write("  $(function() {\n");
      out.write("    $( \"#fromDate\" ).datepicker();\n");
      out.write("     $( \"#toDate\" ).datepicker();\n");
      out.write("     $( \"#otherDate1\" ).datepicker();\n");
      out.write("     $( \"#otherDate2\" ).datepicker();\n");
      out.write("  });\n");
      out.write(" </script>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("    <div   id=\"header\" class=\"container-fluid mainBackGround\" style=\"background-color: #2fa4e7; height:7.25%\" >\n");
      out.write("            <div class=\"container\">\n");
      out.write("              \n");
      out.write("                <div class=\"col-md-8\" > <img src=\"layout/image/Bannerogg.png\"> </div>\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("\n");
      out.write("                    <ul style=\"float: right;\">\n");
      out.write("                \n");
      out.write("                     \n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Navigation -->\n");
      out.write("        \n");
      out.write("       \n");
      out.write("        <!-- Page Content -->\n");
      out.write("        <div class=\"container-fluid mainBackGround\" >\n");
      out.write("            <div class=\"container\"  >\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"row\" class=\"col-md-12\" style=\" margin-top: 80px;\">\n");
      out.write("                    <!--Business form-->\n");
      out.write("                    <div class=\"whiteBackGround\">\n");
      out.write("                        ");

                            String msg=null;
                                  msg=  request.getParameter("msg");
                        if(msg==null){}else{
                        
      out.write("\n");
      out.write("                        <p class=\"alert-danger\">");
      out.print(msg);
      out.write("</p>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                        ");

                            String msgP=null;
                                  msgP=  request.getParameter("msgP");
                        if(msgP==null){}else{
                        
      out.write("\n");
      out.write("                        <p class=\"alert-success\">");
      out.print(msgP);
      out.write("</p>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("<form action=\"LoginController\" method=\"post\">\n");
      out.write("    \n");
      out.write("    <center><div class=\"panel panel-primary\" >\n");
      out.write("    <!-- Default panel contents -->\n");
      out.write("    <div class=\"panel-heading\" style=\"background-color: #ff6600\"><center>LOGIN</center>  </div>\n");
      out.write("    <div class=\"panel-body\">\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("    \n");
      out.write("    <center>  <div class=\"login\">\n");
      out.write("  <div class=\"login-header\">\n");
      out.write("    <h1></h1>\n");
      out.write("  </div>\n");
      out.write("       <div class=\"login-form\">\n");
      out.write("    <div class=\"form-group row\">\n");
      out.write("    <label for=\"todate\" class=\"col-sm-4 col-dm-4 control-label\">User Name</label>\n");
      out.write("    <div class=\"col-sm-4 col-dm-4\">\n");
      out.write("        <input name=\"userName\" type=\"text\"  class=\"form-control date\"  style=\"color: black\" placeholder=\"User Name\"/>\n");
      out.write("    </div>\n");
      out.write("    <span class=\"text-danger\" ></span>\n");
      out.write("</div>\n");
      out.write("           <div class=\"form-group row\">\n");
      out.write("    <label for=\"todate\" class=\"col-sm-4 col-dm-4 control-label\">Password</label>\n");
      out.write("    <div class=\"col-sm-4 col-dm-4\">\n");
      out.write("        <input name=\"password\" type=\"password\"  class=\"form-control date\"  style=\"color: black\" placeholder=\"Password\"/>\n");
      out.write("    </div>\n");
      out.write("    <span class=\"text-danger\" ></span>\n");
      out.write("</div>\n");
      out.write("           <input type=\"submit\" value=\"Login\">\n");
      out.write("    \n");
      out.write("    <br>\n");
      out.write("    <h6 class=\"no-access\">Can't access your account?</h6>\n");
      out.write("           </div>\n");
      out.write("</div>\n");
      out.write("</center>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write(" \n");
      out.write("<!--button content-->\n");
      out.write("\n");
      out.write("     \n");
      out.write("        </div>\n");
      out.write("  \n");
      out.write("    </center>\n");
      out.write("    </form>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("              </div>\n");
      out.write("                    <!--End of the Business form-->\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- /.container -->\n");
      out.write("\n");
      out.write("      \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
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
