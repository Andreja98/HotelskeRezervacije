package DAO;

import Models.Klijent;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author andreja
 */
public interface KlijentDAO {
    
    boolean insert(Klijent klijent) throws SQLException;
    boolean logovanje(String username, String password) throws SQLException;
    ArrayList<Klijent> lista() throws SQLException;
    void brisanje(String Id) throws SQLException;
    Klijent select(String Id) throws SQLException;
    Klijent selectByUsername(String Username) throws SQLException;
    String Rola(String username, String password) throws SQLException;
    boolean update(Klijent klijent, String ulogovanaRola) throws SQLException;
    boolean updatePoeniNakonPlacanjaNovcem(String Username, Integer BrojPoena) throws SQLException;
    Integer brojPoena(String username) throws SQLException;
    boolean updatePoeniNakonPlacanjaPoenima(String Username, Integer BrojPoena, Integer BrojPoenaSobe) throws SQLException;
    boolean promenaLozinke(String username, String staraLozinka, String novaLozinka) throws SQLException;
    
}
