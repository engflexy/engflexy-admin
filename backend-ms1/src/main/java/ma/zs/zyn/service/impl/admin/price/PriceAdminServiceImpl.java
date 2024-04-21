package ma.zs.zyn.service.impl.admin.price;


import ma.zs.zyn.bean.core.price.Price;
import ma.zs.zyn.dao.criteria.core.price.PriceCriteria;
import ma.zs.zyn.dao.facade.core.price.PriceDao;
import ma.zs.zyn.dao.specification.core.price.PriceSpecification;
import ma.zs.zyn.service.facade.admin.price.PriceAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class PriceAdminServiceImpl extends AbstractServiceImpl<Price, PriceCriteria, PriceDao> implements PriceAdminService {








    public List<Price> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Price.class, PriceSpecification.class);
    }



    public PriceAdminServiceImpl(PriceDao dao) {
        super(dao);
    }

}
