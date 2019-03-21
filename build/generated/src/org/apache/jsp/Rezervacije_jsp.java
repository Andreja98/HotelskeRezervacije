package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import RepoPattern.RezervacijaRepo;
import Models.Rezervacija;

public final class Rezervacije_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Rezervacije</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("  \n");
      out.write("        <div style=\"padding-left:10%; padding-right: 10%;\">\n");
      out.write("        <table class=\"table table-hover table-dark\" style=\"background-color: #32383e; color:white;  font-family: Roboto;\">\n");
      out.write("         <thead>\n");
      out.write("                    <tr>\n");
      out.write("                      <th scope=\"col\">#</th>\n");
      out.write("                      <th scope=\"col\">Datum dolaska</th>\n");
      out.write("                      <th scope=\"col\">Datum odlaska</th>\n");
      out.write("                      <th scope=\"col\">Novac</th>\n");
      out.write("                      <th scope=\"col\">Broj odraslih</th>\n");
      out.write("                      <th scope=\"col\">Broj dece</th>\n");
      out.write("                      <th scope=\"col\">Broj sobe</th>\n");
      out.write("                      <th scope=\"col\">Ime klijenta</th>\n");
      out.write("                      <th scope=\"col\">Prezime klijenta</th>\n");
      out.write("                      <th scope=\"col\">Vreme odlaska</th>\n");
      out.write("                      <th scope=\"col\">Status rezervacije</th>\n");
      out.write("                    </tr>\n");
      out.write("         </thead>\n");
      out.write("         <tbody>\n");
      out.write("         ");

             int  i = 1;
             for(Rezervacija rezervacija : new RezervacijaRepo().lista()){
                    { 
      out.write("\n");
      out.write("                    \n");
      out.write("                        \n");
      out.write("                    <tr>\n");
      out.write("                      <td> ");
      out.print( i++ );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.getDatumDolaska() );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.getDatumOdlaska() );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.getNovac() );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.getBrojOdraslih() );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.getBrojDece() );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.soba.getBrojSobe() );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.klijent.getIme() );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.klijent.getPrezime());
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.getVremeOdlaska() );
      out.write(" </td>\n");
      out.write("                      <td>");
      out.print(rezervacija.getStatusRezervacije() );
      out.write(" </td>\n");
      out.write("                      <td> \n");
      out.write("                          \n");
      out.write("                         <a class=\"delete_link\"\n");
      out.write("                                    href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/EditKlijent.jsp?Rezervacija_Id=");
      out.print( rezervacija.getRezervacijaId());
      out.write("\" >\n");
      out.write("                                   <i class=\"fa fa-trash\"> Izmeni</i>                                  \n");
      out.write("                         </a>\n");
      out.write("                         <a class=\"delete_link\" style=\"color:red\"\n");
      out.write("                                    href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/Klijenti?Klijent_Id=");
      out.print( rezervacija.getRezervacijaId());
      out.write("\" >\n");
      out.write("                                   <i class=\"fa fa-trash\"> Obriši</i>                                  \n");
      out.write("                         </a>\n");
      out.write("                      </td>\n");
      out.write("                    </tr>\n");
      out.write("                 \n");
      out.write("             ");
}
             }
             
      out.write("\n");
      out.write("          </tbody>\n");
      out.write("         </table>\n");
      out.write("        </div>\n");
      out.write("           \n");
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
