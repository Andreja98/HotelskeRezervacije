package Models;

/**
 *
 * @author andreja
 */
public class MenadzeriHotela {
    
    private Integer Id;
    private Integer KlijentId;
    private Integer HotelId;

    public MenadzeriHotela(Integer Id, Integer KlijentId, Integer HotelId) {
        this.Id = Id;
        this.KlijentId = KlijentId;
        this.HotelId = HotelId;
    }
    public MenadzeriHotela(){ }
    
    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public Integer getKlijentId() {
        return KlijentId;
    }

    public void setKlijentId(Integer KlijentId) {
        this.KlijentId = KlijentId;
    }

    public Integer getHotelId() {
        return HotelId;
    }

    public void setHotelId(Integer HotelId) {
        this.HotelId = HotelId;
    }
}
