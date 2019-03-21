
package Controllers;

import Models.Klijent;
import Models.MenadzeriHotela;
import RepoPattern.KlijentRepo;
import RepoPattern.MenadzerHotelaRepo;
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
public class EditKlijent extends HttpServlet {


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
            Klijent klijent = new Klijent();
            klijent.setKlijentId(Integer.parseInt(request.getParameter("Klijent_Id")));
            klijent.setIme(request.getParameter("Ime"));
            klijent.setPrezime(request.getParameter("Prezime"));
            klijent.setKIme(request.getParameter("KIme"));
            klijent.setEmail(request.getParameter("Email"));
            klijent.setTelefon(request.getParameter("Telefon"));
            klijent.setAdresa(request.getParameter("Adresa"));
            klijent.setDrzava(request.getParameter("Drzava"));
            klijent.setGrad(request.getParameter("Grad"));
            klijent.setRola(request.getParameter("Rola"));
            
            String ulogovanaRola = (String)request.getSession().getAttribute("UlogovanaRola");
            if(ulogovanaRola.equals("2"))
                klijent.setPoeni(Integer.parseInt(request.getParameter("Poeni")));
            
            
            klijent.setPostanskiBroj(request.getParameter("PostanskiBroj"));

            if(new  KlijentRepo().update(klijent, ulogovanaRola)){
                if(klijent.getRola()!=null)
                    if(klijent.getRola().equals("3")){

                        MenadzeriHotela menadzerHotela = new MenadzeriHotela();
                        menadzerHotela.setHotelId(Integer.parseInt(request.getParameter("HotelId")));
                        menadzerHotela.setKlijentId(klijent.getKlijentId());
                        new MenadzerHotelaRepo().insert(menadzerHotela);
                    }
                response.sendRedirect("EditKlijent.jsp?Klijent_Id="+klijent.getKlijentId());
            }
                
            else
            {
                request.setAttribute("Klijent_Id", klijent.getKlijentId());
                request.setAttribute("rezultat", "False");
                request.getRequestDispatcher("EditKlijent.jsp").forward(request, response);
            }
            request.getSession().setAttribute("BrojPoenaKlijenta", new KlijentRepo().brojPoena((String)request.getSession().getAttribute("ulogovan")));
        } catch (SQLException ex) {
            Logger.getLogger(EditKlijent.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
