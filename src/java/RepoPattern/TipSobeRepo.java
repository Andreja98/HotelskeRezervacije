package RepoPattern;

import DAO.TipSobeDAO;
import Models.TipSobe;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author andreja
 */
public class TipSobeRepo implements TipSobeDAO {

    Connection con;
    public TipSobeRepo() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TipSobeRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            Logger.getLogger(TipSobeRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    @Override
    public ArrayList<TipSobe> lista(String HotelID) throws SQLException{
        
        ArrayList<TipSobe> tipoviSoba = new ArrayList<TipSobe>();
        try {
           
             String select = "select *from TipSobe where HotelID = " + HotelID;
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             while(rs.next()){
                 TipSobe tipSobe = new TipSobe();
                 tipSobe.setTipSobeId(rs.getInt("Id"));
                 tipSobe.setNaziv(rs.getString("Naziv"));
                 tipSobe.SetHotelID(rs.getInt("HotelID"));
                 tipoviSoba.add(tipSobe);
             }
 
        } catch (SQLException ex) {
            Logger.getLogger(TipSobeRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        return tipoviSoba; 
    }
    @Override
    public boolean insert(TipSobe tipSobe) throws SQLException, IOException{
        String insert = "INSERT INTO `TipSobe`(`Naziv`, `HotelID`) "
                      + "VALUES (?,?)";
        try {
           
            PreparedStatement pst = con.prepareStatement(insert);
            
            pst.setString(1, tipSobe.getNaziv());
            pst.setInt(2, tipSobe.getHotelID());
            
 
            pst.executeUpdate();
           
            return true;
        } catch (SQLException ex) {
            return false;
        }
        
    }
    @Override
    public boolean brisanje (String Niz_ID) throws SQLException{
        try {
            
            String delete = "delete from  TipSobe where id in (" + Niz_ID +")";
            PreparedStatement ps  = con.prepareStatement(delete);

            ps.executeUpdate();
            return true;
  
        } catch (SQLException ex) {
            Logger.getLogger(HotelRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       return false;
    }
}
