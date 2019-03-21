package RepoPattern;

import DAO.KlijentDAO;
import Models.Klijent;
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
public class KlijentRepo implements KlijentDAO{
    
    Connection con;
    public KlijentRepo() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
    
    @Override
    public boolean insert(Klijent klijent) throws SQLException{
        try {
            String insertToKlijent = "INSERT INTO `klijenti`(Ime, Prezime, KIme, Sifra, Email, Telefon,"
                    + " Adresa, Grad, Drzava, Poeni, PostanskiBroj, RolaID)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pst = con.prepareStatement(insertToKlijent);
            
            pst.setString(1, klijent.getIme());
            pst.setString(2, klijent.getPrezime());
            pst.setString(3, klijent.getKIme());
            pst.setString(4, klijent.getSifra());
            pst.setString(5, klijent.getEmail());
            pst.setString(6, klijent.getTelefon());
            pst.setString(7, klijent.getAdresa());
            pst.setString(8, klijent.getGrad());
            pst.setString(9, klijent.getDrzava());
            pst.setDouble(10, 0.0);
            pst.setString(11, klijent.getPostanskiBroj());
            pst.setInt(12, 1);
            
            
           pst.executeUpdate();
           
           return true;
        } catch (SQLException e) {
          
        }
       
        return false;
    }
    @Override
    public boolean logovanje(String username, String password) throws SQLException{
        
        
        String provera = "select * from Klijenti where KIme = '" + username+ "'  and Sifra = '"+ password+"'";
        
        PreparedStatement pst;        
        try {
            pst = con.prepareStatement(provera);
            ResultSet rs =  pst.executeQuery(provera);
            while(rs.next())
                return  true;
        
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        
       
      
        return false;
    }
    @Override
    public ArrayList<Klijent> lista() throws SQLException{ 
        ArrayList<Klijent> klijenti = new ArrayList<Klijent>();
        try {
           
             String select = "select *from klijenti";
        
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(select);
             
             while(rs.next()){
                 Klijent klijent = new Klijent();
                 klijent.setKlijentId(rs.getInt("Id"));
                 klijent.setIme(rs.getString("Ime"));
                 klijent.setPrezime(rs.getString("Prezime"));
                 klijent.setKIme(rs.getString("KIme"));
                 klijent.setEmail(rs.getString("Email"));
                 klijent.setTelefon(rs.getString("Telefon"));
                 klijent.setAdresa(rs.getString("Adresa"));
                 klijent.setGrad(rs.getString("Grad"));
                 klijent.setDrzava(rs.getString("Drzava"));
                 klijent.setRola(Integer.toString(rs.getInt("RolaID")));
                 klijent.setPoeni(rs.getInt("Poeni"));
                 klijent.setPostanskiBroj(rs.getString("PostanskiBroj"));
                 klijenti.add(klijent);
             }
 
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
           con.close();
        }
       
        
        
        return klijenti; 
    }
    @Override
    public void brisanje(String Id) throws SQLException{
 
        
        try {
            String delete = "delete from  klijenti where id = " + Id;
            PreparedStatement ps  = con.prepareStatement(delete);

            ps.executeUpdate();
  
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
    @Override
    public Klijent select(String Id) throws SQLException{

        Klijent klijent = new Klijent();
        try {
            String select = "select *from klijenti where id = " + Id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next()){
                klijent.setKlijentId(rs.getInt("Id"));
                klijent.setIme(rs.getString("Ime"));
                klijent.setPrezime(rs.getString("Prezime"));
                klijent.setKIme(rs.getString("KIme"));
                klijent.setEmail(rs.getString("Email"));
                klijent.setTelefon(rs.getString("Telefon"));
                klijent.setAdresa(rs.getString("Adresa"));
                klijent.setGrad(rs.getString("Grad"));
                klijent.setDrzava(rs.getString("Drzava"));
                klijent.setRola(Integer.toString( rs.getInt("RolaID")));
                klijent.setPoeni(rs.getInt("Poeni"));
                klijent.setPostanskiBroj(rs.getString("PostanskiBroj"));
        }
        
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
      
        return klijent;
    }
    @Override
    public Klijent selectByUsername(String Username) throws SQLException{

        Klijent klijent = new Klijent();
        try {
            String select = "select * from klijenti where Kime = '" + Username +"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next()){
                klijent.setKlijentId(rs.getInt("Id"));
                klijent.setIme(rs.getString("Ime"));
                klijent.setPrezime(rs.getString("Prezime"));
                klijent.setKIme(rs.getString("KIme"));
                klijent.setEmail(rs.getString("Email"));
                klijent.setTelefon(rs.getString("Telefon"));
                klijent.setAdresa(rs.getString("Adresa"));
                klijent.setGrad(rs.getString("Grad"));
                klijent.setDrzava(rs.getString("Drzava"));
                klijent.setRola(Integer.toString( rs.getInt("RolaID")));
                klijent.setPoeni(rs.getInt("Poeni"));
                klijent.setPostanskiBroj(rs.getString("PostanskiBroj"));
        }
        
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
       
      
        return klijent;
    }
    @Override
    public String Rola(String username, String password) throws SQLException{
        String select = "select RolaID from klijenti where sifra = '"+ password + "' and KIme = '" + username + "'";
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next())
                return rs.getString("RolaID");
            
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        
        return "Greska";
    }
    @Override
    public boolean update(Klijent klijent, String ulogovanaRola) throws SQLException{
        
        String poeni = "";
        String rolaID = "";
        if(ulogovanaRola.equals("2")){
            poeni = "Poeni = ?,";
            rolaID = "RolaID = ?,";
        }
            
        
        String deleteFromMenadzeri = "delete from  menadzerihotela where klijentId = " + klijent.getKlijentId();
        String update = "update klijenti "
                      + "set Ime = ?,"
                      + "Prezime = ?,"
                      + "KIme = ?,"
                      + "Email = ?,"
                      + "Telefon = ?,"
                      + "Adresa = ?,"
                      + "Drzava = ?,"
                      + "Grad = ?,"
                      + rolaID
                      + poeni
                      + "PostanskiBroj = ?"
                      + " where id = ?";
         
        try {
            //brisanje iz many to many tabele ako je prethodno bio menadzer
            PreparedStatement pstDelete = con.prepareStatement(deleteFromMenadzeri);
            pstDelete.executeUpdate();
            
            PreparedStatement pst = con.prepareStatement(update);
            pst.setString(1, klijent.getIme());
            pst.setString(2, klijent.getPrezime());
            pst.setString(3, klijent.getKIme());
            pst.setString(4, klijent.getEmail());
            pst.setString(5, klijent.getTelefon());
            pst.setString(6, klijent.getAdresa());
            pst.setString(7, klijent.getDrzava());
            pst.setString(8, klijent.getGrad()); 
            

            if(ulogovanaRola.equals("2")){
                pst.setInt(9, Integer.parseInt(klijent.getRola()));
                pst.setDouble(10, klijent.getPoeni()); 
                pst.setString(11, klijent.getPostanskiBroj());
                pst.setInt(12, klijent.getKlijentId());
            }  
            else{
                pst.setString(9, klijent.getPostanskiBroj());
                pst.setInt(10, klijent.getKlijentId());
            }
            

            pst.executeUpdate();
            
            return true;
            
        } catch (SQLException e) {
          return false;
        }
       
    }
    @Override
    public boolean updatePoeniNakonPlacanjaNovcem(String Username, Integer BrojPoena) throws SQLException{
        String update = "update klijenti "
                      + "set Poeni = Poeni + " + BrojPoena 
                      + " where KIme = '" + Username +"'";
         
        try {
            PreparedStatement pst = con.prepareStatement(update);
            pst.executeUpdate();           
            return true;
            
        } catch (SQLException e) {
          return false;
        }
        
    }
    @Override
    public Integer brojPoena(String username) throws SQLException{
        String select = "select Poeni from klijenti where KIme = '" + username + "'";
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(select);

            while(rs.next())
               return rs.getInt("Poeni");
            
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            con.close();
        }
        return 0;
    }
    @Override
    public boolean updatePoeniNakonPlacanjaPoenima(String Username, Integer BrojPoena, Integer BrojPoenaSobe) throws SQLException{
        String update = "update klijenti "
                      + "set Poeni = Poeni - " + BrojPoena +" + " + BrojPoenaSobe
                      + " where KIme = '" + Username +"'";
        try {
            PreparedStatement pst = con.prepareStatement(update);
            pst.executeUpdate();           
            return true;
            
        } catch (SQLException e) {
          return false;
        }
        finally{
            con.close();
        }
    }
    @Override
    public boolean promenaLozinke(String username, String staraLozinka, String novaLozinka) throws SQLException{
        String select = "select Sifra from klijenti where KIme = '" + username + "' and Sifra = '" + staraLozinka + "'";
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(select);
            
            if(rs.next()){
                String update = "update klijenti set sifra = '" + novaLozinka +"' where KIme = '" + username + "'";
                st.executeUpdate(update);
                return true;
            }
            else
                return false;
              
            
        } catch (SQLException ex) {
            Logger.getLogger(KlijentRepo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally{
            con.close();
        }
        
    }
}
