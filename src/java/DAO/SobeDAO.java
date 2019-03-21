package DAO;

import Models.Soba;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author andreja
 */
public interface SobeDAO {
    
    ArrayList<Soba> listaSobaSelektovanogHotela(String Hotel_Id) throws SQLException;
    boolean insert(Soba soba, Part part) throws SQLException, IOException;
    void fotografije(HttpServletRequest request, HttpServletResponse response, String SobaId)throws ServletException, IOException, SQLException;
    Soba select(String Id) throws SQLException;
    String brisanje(String Id) throws SQLException;
    String update(Soba soba, Part part) throws SQLException, IOException;
    int maxKapacitetSobe(String Id) throws SQLException;
    
}
