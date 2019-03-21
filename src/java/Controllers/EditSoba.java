package Controllers;

import Models.Soba;
import RepoPattern.SobeRepo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author andreja
 */
@MultipartConfig(maxFileSize = 161772716)
public class EditSoba extends HttpServlet {

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
        processRequest(request, response);
        Soba soba = new Soba();
        
        soba.setSobaId(Integer.parseInt(request.getParameter("Soba_Id")));
        soba.setBrojSobe(request.getParameter("BrojSobe"));
        soba.TipSobe.setTipSobeId(Integer.parseInt(request.getParameter("TipSobe")));
        soba.setOpis(request.getParameter("Opis"));
        soba.setKratkiOpis(request.getParameter("KratkiOpis"));
        soba.setCena(Double.parseDouble(request.getParameter("Cena")));
        soba.setKapacitet(Integer.parseInt(request.getParameter("Kapacitet")));
        soba.setPoeni(Integer.parseInt(request.getParameter("Poeni")));
        soba.setCenaUPoenima(Integer.parseInt(request.getParameter("CenaUPoenima")));
        Part part = request.getPart("file");
        
        try {
            
            String HotelID = new SobeRepo().update(soba, part);

            
            if(!(HotelID.equals(""))){
                response.sendRedirect("Sobe.jsp?Hotel_Id=" + HotelID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditSoba.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
