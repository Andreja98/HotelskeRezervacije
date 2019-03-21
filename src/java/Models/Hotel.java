package Models;

import java.sql.Blob;

/**
 *
 * @author andreja
 */
public class Hotel {
   
    private Integer Id;
    private String Naziv;
    private String  Adresa;
    private String Grad;
    private String Drzava;
    private Integer BrojZvezdica;
    private Blob Fotografija;
    private String  Opis;
    public Hotel(){
        
    }
    public Hotel(Integer Id, String Naziv, String Adresa, String Grad, String Drzava, Integer BrojZvezdica, Blob Fotografija, String Opis) {
        this.Id = Id;
        this.Naziv = Naziv;
        this.Adresa = Adresa;
        this.Grad = Grad;
        this.Drzava = Drzava;
        this.BrojZvezdica = BrojZvezdica;
        this.Fotografija = Fotografija;
        this.Opis = Opis;
    }
    
    public  void setHotelId(Integer Id){
        this.Id = Id;
    }
    public int getHotelId(){
        return  this.Id;
    }
    
    public String getNaziv() {
        return this.Naziv;
    }
    public void setNaziv(String Naziv) {
        this.Naziv = Naziv;
    } 
    
    public String getGrad() {
        return this.Grad;
    }
    public void setGrad(String Grad) {
        this.Grad = Grad;
    } 
    
    public String getDrzava() {
        return this.Drzava ;
    }
    public void setDrzava(String Drzava) {
        this.Drzava = Drzava;
    } 
    
    
    
    public String getAdresa() {
        return this.Adresa;
    }
    public void setAdresa(String Adresa) {
        this.Adresa = Adresa;
    } 
    
    public int getBrojZvezdica(){
        return  this.BrojZvezdica;
    }
    
    public  void setBrojZvezdica(Integer BrojZvezdica){
        this.BrojZvezdica = BrojZvezdica;
    }
    
    public Blob getFotografija() {
        return this.Fotografija;
    }
    public void setFotografija(Blob Fotografija) {
        this.Fotografija = Fotografija;
    } 
    
    public String getOpis() {
        return this.Opis;
    }
    public void setOpis(String Opis) {
        this.Opis = Opis;
    } 
    
}
