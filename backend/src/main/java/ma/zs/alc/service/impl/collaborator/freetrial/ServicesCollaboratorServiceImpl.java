package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.Services;
import ma.zs.alc.dao.criteria.core.freetrial.ServicesCriteria;
import ma.zs.alc.dao.facade.core.freetrial.ServicesDao;
import ma.zs.alc.dao.specification.core.freetrial.ServicesSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.ServicesCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class ServicesCollaboratorServiceImpl extends AbstractServiceImpl<Services, ServicesCriteria, ServicesDao> implements ServicesCollaboratorService {






    public Services findByReferenceEntity(Services t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }


    public List<Services> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Services.class, ServicesSpecification.class);
    }



    public ServicesCollaboratorServiceImpl(ServicesDao dao) {
        super(dao);
    }

}
