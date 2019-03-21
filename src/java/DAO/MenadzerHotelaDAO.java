package DAO;

import Models.MenadzeriHotela;
import java.sql.SQLException;

/**
 *
 * @author andreja
 */
public interface MenadzerHotelaDAO {
    
    boolean insert(MenadzeriHotela menadzerHotela) throws SQLException;
    MenadzeriHotela select(Integer KlijentId) throws SQLException;
    
}
