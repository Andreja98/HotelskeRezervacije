package Controllers;

import Models.Klijent;
import RepoPattern.KlijentRepo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andreja
 */
public class PromeniLozinku extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            String staraLozinka = request.getParameter("StaraLozinka");
            String novaLozinka = request.getParameter("NovaLozinka");
            Klijent ulogovanKlijent = new KlijentRepo().selectByUsername((String)request.getSession().getAttribute("ulogovan"));
            
            if(new KlijentRepo().promenaLozinke(ulogovanKlijent.getKIme(), staraLozinka, novaLozinka)){
                request.setAttribute("Promena", "True");
                request.getRequestDispatcher("EditKlijent.jsp?Klijent_Id=" + ulogovanKlijent.getKlijentId()).forward(request, response);   
            }
            else{
                request.setAttribute("Promena", "False");
                request.getRequestDispatcher("EditKlijent.jsp?Klijent_Id=" + ulogovanKlijent.getKlijentId()).forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PromeniLozinku.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
