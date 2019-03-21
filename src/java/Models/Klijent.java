package Models;

/**
 *
 * @author andreja
 */
public class Klijent {
    private Integer Id;
    private String Ime;
    private String Prezime;
    private String KIme;
    private String Sifra;
    private String Email;
    private String  Telefon;
    private String  Adresa;
    private String Grad;
    private String Drzava;
    private String Rola;
    private Integer Poeni;
    private String PostanskiBroj;
    private Integer HotelID;

    public Klijent() {
    }

    public Klijent(Integer Id, String Ime, String Prezime, String KIme, String Sifra, 
            String Email, String Telefon, String Adresa, String Grad,
            String Drzava, String Rola, Integer Poeni,String PostanskiBroj, Integer HotelID) {
        this.Id = Id;
        this.Ime = Ime;
        this.Prezime = Prezime;
        this.KIme = KIme;
        this.Sifra = Sifra;
        this.Email = Email;
        this.Telefon = Telefon;
        this.Adresa = Adresa;
        this.Grad = Grad;
        this.Drzava = Drzava;
        this.Rola = Rola;
        this.Poeni = Poeni;
        this.PostanskiBroj = PostanskiBroj;
        this.HotelID = HotelID;
    }
    
    public int getKlijentId(){
        return  this.Id;
    }
    
    public  void setKlijentId(Integer Id){
        this.Id = Id;
    }
    
    public String getIme() {
        return this.Ime;
    }
    public void setIme(String Ime) {
        this.Ime = Ime;
    } 
    public String getPrezime() {
        return this.Prezime;
    }
    public void setPrezime(String Prezime) {
        this.Prezime = Prezime;
    } 
    
    public String getKIme() {
        return this.KIme;
    }
    public void setKIme(String KorisnickoIme) {
        this.KIme = KorisnickoIme;
    } 
      public String getSifra() {
        return this.Sifra;
    }
    public void setSifra(String Sifra) {
        this.Sifra = Sifra;
    } 
    public String getEmail() {
        return this.Email;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    } 
    public String getTelefon() {
        return this.Telefon;
    }
    public void setTelefon(String Telefon) {
        this.Telefon = Telefon;
    } 
    public String getAdresa() {
        return this.Adresa;
    }
    public void setAdresa(String Adresa) {
        this.Adresa = Adresa;
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
    
    public String getRola() {
        return this.Rola ;
    }
    public void setRola(String Rola) {
        this.Rola = Rola;
    }  
    
 
     public String getPostanskiBroj() {
        return this.PostanskiBroj ;
    }
    public void setPostanskiBroj(String PostanskiBroj) {
        this.PostanskiBroj = PostanskiBroj;
    } 
    
    public int getHotelID(){
        return  this.HotelID;
    }
    
    public  void setHotelID(Integer HotelID){
        this.HotelID = HotelID;
    }

    public Integer getPoeni(){
        return this.Poeni;
    }
    
    public void setPoeni(Integer Poeni) {
        this.Poeni = Poeni;
    } 
    
    
}
