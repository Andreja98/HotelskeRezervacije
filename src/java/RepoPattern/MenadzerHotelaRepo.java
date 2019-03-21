package RepoPattern;

import DAO.MenadzerHotelaDAO;
import Models.MenadzeriHotela;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author andreja
 */
public class MenadzerHotelaRepo implements MenadzerHotelaDAO {
    
    Connection con;
    public MenadzerHotelaRepo() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MenadzerHotelaRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            Logger.getLogger(MenadzerHotelaRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    @Override
    public boolean insert(MenadzeriHotela menadzerHotela) throws SQLException{
        String delete = "delete from  menadzerihotela where klijentId = " + menadzerHotela.getKlijentId();
        String insert = "INSERT INTO menadzerihotela"
                     + " (KlijentID, HotelID) VALUES (?,?)";
        
        try {
            
            PreparedStatement pstDelete = con.prepareStatement(delete);
            pstDelete.executeUpdate();
            
            PreparedStatement pstInsert = con.prepareStatement(insert);
            
            pstInsert.setInt(1, menadzerHotela.getKlijentId());
            pstInsert.setInt(2, menadzerHotela.getHotelId());
            
            
            pstInsert.executeUpdate();
           
            return true;
        } catch (SQLException ex) {
            return false;
        } 
        
    }
    @Override
    public MenadzeriHotela select(Integer KlijentId) throws SQLException{
        MenadzeriHotela menadzerHotela = new MenadzeriHotela();
        
        try {
           
             String select = "select *from menadzerihotela where KlijentId = " + KlijentId;
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             while(rs.next()){               
                 menadzerHotela.setHotelId(rs.getInt("HotelId"));
                 menadzerHotela.setKlijentId(rs.getInt("KlijentId"));
                 menadzerHotela.setId(rs.getInt("Id"));               
             }
             
        } catch (SQLException ex) {
            Logger.getLogger(HotelRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        
        
        return menadzerHotela; 
    }
     public boolean allow(String HotelId, String HotelIDSession) throws SQLException{
        MenadzeriHotela menadzerHotela = new MenadzeriHotela();
        
        try {
           
             String select = "select *from menadzerihotela where HotelId = " + HotelId;
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             if(rs.next()){             
                    menadzerHotela.setHotelId(rs.getInt("HotelId"));
                    menadzerHotela.setKlijentId(rs.getInt("KlijentId"));
                    menadzerHotela.setId(rs.getInt("Id"));                                
             }
             else 
                 return false;
             
             if(menadzerHotela.getHotelId().equals(Integer.parseInt(HotelIDSession))) 
                 return true;
             
             else
                 return false;
             
             
        } catch (SQLException ex) {
            Logger.getLogger(HotelRepo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
            con.close();
        }
       
    }
}
