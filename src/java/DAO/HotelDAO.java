package DAO;

import Models.Hotel;
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
public interface HotelDAO {
    
    boolean insert(Hotel hotel, Part part) throws SQLException;
    ArrayList<Hotel> lista() throws SQLException;
    void fotografije(HttpServletRequest request, HttpServletResponse response, String HotelID)
            throws ServletException, IOException, SQLException ;
    Hotel select(String Id) throws SQLException;
    boolean update(Hotel hotel, Part part) throws SQLException, IOException;
    void brisanje (String Id) throws SQLException;
    
}   
