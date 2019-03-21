package Models;

/**
 *
 * @author andreja
 */
public class TipSobe {
    private Integer Id;
    private String Naziv;
    private Integer HotelID;
    
    public TipSobe(){}
    public TipSobe(Integer Id, String Naziv,Integer HotelID) {
        this.Id = Id;
        this.Naziv = Naziv;
        this.HotelID = HotelID;
    }
    public int getTipSobeId(){
        return  this.Id;
    }
    
    public  void setTipSobeId(Integer Id){
        this.Id = Id;
    }
    public String getNaziv() {
        return this.Naziv;
    }
    public void setNaziv(String Naziv) {
        this.Naziv = Naziv;
    } 
    
    public void SetHotelID(Integer HotelID) {
        this.HotelID = HotelID;
    }
    public Integer getHotelID(){
        return this.HotelID;
    }
   
    
}
