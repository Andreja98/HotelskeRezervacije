
package Models;

/**
 *
 * @author andreja
 */
public class KreditnaKartica {
    private String Vrsta;
    private String Broj;
    private Integer MesecIsteka;
    private Integer GodinaIsteka;

    public KreditnaKartica() {}

    public KreditnaKartica(String Vrsta, String Broj, Integer MesecIsteka, Integer GodinaIsteka) {
        this.Vrsta = Vrsta;
        this.Broj = Broj;
        this.MesecIsteka = MesecIsteka;
        this.GodinaIsteka = GodinaIsteka;
    }
    public  void setVrsta(String Vrsta){
        this.Vrsta = Vrsta;
    }
    public String getVrsta(){
        return  this.Vrsta;
    }
    public  void setBroj(String Broj){
        this.Broj = Broj;
    }
    public String getBroj(){
        return  this.Broj;
    }
    public Integer getMesecIsteka(){
        return  this.MesecIsteka;
    }
    public  void setMesecIsteka(Integer MesecIsteka){
        this.MesecIsteka = MesecIsteka;
    }
    public Integer getGodinaIsteka(){
        return  this.GodinaIsteka;
    }
    public  void setGodinaIsteka(Integer GodinaIsteka){
        this.GodinaIsteka = GodinaIsteka;
    }

}
