package Models;

import java.sql.Time;

/**
 *
 * @author andreja
 */
public class Rezervacija {

    private Integer Id;
    private String DatumDolaska;
    private String DatumOdlaska;
    private String VremeOdlaska;
    private Double Novac;
    private Integer BrojOdraslih;
    private Integer BrojDece;
    private Integer SobaID;
    private Integer KlijentID;
    private boolean StatusRezervacije;
    public Soba soba = new Soba();
    public Klijent klijent = new Klijent();
    private Integer Poeni;

    public Rezervacija(){}
    public Rezervacija(Integer Id, String DatumDolaska, String DatumOdlaska, String VremeOdlaska, 
            Double Novac, Integer BrojOdraslih, Integer BrojDece, Integer SobaID, 
            Integer KlijentID, boolean StatusRezervacije, Integer Poeni) {
        this.Id = Id;
        this.DatumDolaska = DatumDolaska;
        this.DatumOdlaska = DatumOdlaska;
        this.VremeOdlaska = VremeOdlaska;
        this.Novac = Novac;
        this.BrojOdraslih = BrojOdraslih;
        this.BrojDece = BrojDece;
        this.StatusRezervacije = StatusRezervacije;
        this.SobaID = SobaID;
        this.KlijentID = KlijentID;
        this.Poeni = Poeni;
        
    }
    
    public int getRezervacijaId(){
        return  this.Id;
    }
    
    public  void setRezervacijaId(Integer Id){
        this.Id = Id;
    }
    
    public String getDatumDolaska(){
        return this.DatumDolaska;
    }
    public void setDatumDolaska(String DatumDolaska){
        this.DatumDolaska = DatumDolaska;
    }
    public String getDatumOdlaska(){
        return this.DatumOdlaska;
    }
    public void setDatumOdlaska(String DatumOdlaska){
        this.DatumOdlaska = DatumOdlaska;
    }
    public String getVremeOdlaska(){
        return this.VremeOdlaska;
    }
    public void setVremeOdlaska(String VremeOdlaska){
        this.VremeOdlaska = VremeOdlaska;
    }
    
    public double getNovac(){
        return this.Novac;
    }
    public void setNovac(double Novac){
        this.Novac = Novac;
    }
    public Integer getBrojOdraslih(){
        return  this.BrojOdraslih;
    }
    
    public  void setBrojOdraslih(Integer BrojOdraslih){
        this.BrojOdraslih = BrojOdraslih;
    }
    public Integer getBrojDece(){
        return  this.BrojDece;
    }
    
    public  void setBrojDece(Integer BrojDece){
        this.BrojDece = BrojDece;
    }
    
    public boolean getStatusRezervacije() {
        return this.StatusRezervacije;
    }
    public void setStatusRezervacije(boolean StatusRezervacije) {
        this.StatusRezervacije = StatusRezervacije;
    } 
    public Integer getSobaID(){
        return  this.SobaID;
    }
    
    public  void setSobaID(Integer SobaID){
        this.SobaID = SobaID;
    }
    public Integer getKlijentID(){
        return  this.KlijentID;
    }
    
    public  void setKlijentID(Integer KlijentID){
        this.KlijentID = KlijentID;
    }
    
    public Integer getPoeni(){
        return this.Poeni;
    }
    public void setPoeni(Integer Poeni){
        this.Poeni = Poeni;
    }
    
}
