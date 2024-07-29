package ma.zs.alc.service.impl.manager.freetrial;


import ma.zs.alc.bean.core.freetrial.Services;
import ma.zs.alc.dao.criteria.core.freetrial.ServicesCriteria;
import ma.zs.alc.dao.facade.core.freetrial.ServicesDao;
import ma.zs.alc.dao.specification.core.freetrial.ServicesSpecification;
import ma.zs.alc.service.facade.manager.freetrial.ServicesManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServicesManagerServiceImpl extends AbstractServiceImpl<Services, ServicesCriteria, ServicesDao> implements ServicesManagerService {







    public Services findByReferenceEntity(Services t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<Services> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Services.class, ServicesSpecification.class);
    }



    public ServicesManagerServiceImpl(ServicesDao dao) {
        super(dao);
    }

}
