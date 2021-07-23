
package connectionjdbc.location;

import java.util.List;
import model.location.District;
import model.location.Province;
import model.location.Village;
import model.location.Ward;


public class LocationService {
    
    private LocationDao ld;

    public LocationService() {
        ld = new LocationDao();
    }
    
    public List<Province> getListProvince(){
        return ld.getListProvince();
    }
    
    public List<District> getListDistrict(int idProvince){
        return ld.getListDistrict(idProvince);
    }
    
    public List<Ward> getListWard(int idWard){
        return ld.getListWard(idWard);
    }
    
    public List<Village> getListVillage(int idVillage){
        return ld.getListVillage(idVillage);
    }
    
    
}
