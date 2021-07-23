
package connectionjdbc.other;


public class OtherService {
    
    private OtherDao otherDao;

    public OtherService() {
        otherDao = new OtherDao();
    }
    
    public int checkDiscountCode(String code){
        return otherDao.checkDiscountCode(code);
    }
    
    public void deleteDiscountCode(String code){
        otherDao.deleteDiscountCode(code);
    }
    
}
