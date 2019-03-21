package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import RepoPattern.SobeRepo;
import RepoPattern.SobeRepo;

public final class Rezervisi_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Rezerviši</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Bootstrap 4 DatePicker</title>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        </head>\n");
      out.write("    <body>\n");
      out.write("         ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("  \n");
      out.write("        ");
 int sobaMaxKapacitet = new SobeRepo().maxKapacitetSobe(request.getParameter("Soba_Id"));
      out.write("\n");
      out.write("        <center>\n");
      out.write("         <form action = \"KreiranjeRezervacije\" method=\"post\" >\n");
      out.write("             \n");
      out.write("           \n");
      out.write("             <input type=\"hidden\" value=\"");
      out.print(request.getParameter("Soba_Id"));
      out.write("\" name=\"Soba_Id\">\n");
      out.write("             Broj dece: \n");
      out.write("            <select name=\"BrojDece\" class=\"custom-select\" style=\"width:50px\">\n");
      out.write("                 \n");
      out.write("                ");
 for(int i = 1; i <= sobaMaxKapacitet; i++){
                    {
      out.write("\n");
      out.write("                       <option value=\"");
      out.print(i);
      out.write("\"> ");
      out.print(i);
      out.write(" </option>\n");
      out.write("                    ");
}  
                   }
                
      out.write("\n");
      out.write("             </select>\n");
      out.write("             <br> </br>\n");
      out.write("                 \n");
      out.write("             \n");
      out.write("             Broj odraslih:\n");
      out.write("                <select name=\"BrojOdraslih\" class=\"custom-select\" style=\"width:50px\">\n");
      out.write("\n");
      out.write("                   ");
 for(int i = 1; i <= sobaMaxKapacitet; i++){
                       {
      out.write("\n");
      out.write("                          <option value=\"");
      out.print(i);
      out.write("\"> ");
      out.print(i);
      out.write(" </option>\n");
      out.write("                       ");
}  
                      }
                   
      out.write("\n");
      out.write("                </select>\n");
      out.write("                <br> </br>\n");
      out.write("                Datum dolaska:  \n");
      out.write("                <input type=\"date\" name=\"DatumDolaska\" class=\"form-control\" style=\"width:250px\" onkeydown=\"return false\">  \n");
      out.write("                Datum odlaska:  \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <input type=\"date\" name=\"DatumOdlaska\" class=\"form-control\" style=\"width:250px\" onkeydown=\"return false\">  \n");
      out.write("                 <script type=\"text/javascript\">\n");
      out.write("                    $(function () {\n");
      out.write("                        $('#DatumDolaska').datetimepicker({\n");
      out.write("                            format: 'LT'\n");
      out.write("                        });\n");
      out.write("                    });\n");
      out.write("                </script>\n");
      out.write("             \n");
      out.write("         </form>\n");
      out.write("             \n");
      out.write("        </center>    \n");
      out.write("          \n");
      out.write("    </body>\n");
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
