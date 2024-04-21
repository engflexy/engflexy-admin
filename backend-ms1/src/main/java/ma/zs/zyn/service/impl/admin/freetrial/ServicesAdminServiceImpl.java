package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.Services;
import ma.zs.zyn.dao.criteria.core.freetrial.ServicesCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.ServicesDao;
import ma.zs.zyn.dao.specification.core.freetrial.ServicesSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.ServicesAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class ServicesAdminServiceImpl extends AbstractServiceImpl<Services, ServicesCriteria, ServicesDao> implements ServicesAdminService {






    public Services findByReferenceEntity(Services t){
        return  dao.findByCode(t.getCode());
    }


    public List<Services> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Services.class, ServicesSpecification.class);
    }



    public ServicesAdminServiceImpl(ServicesDao dao) {
        super(dao);
    }

}
