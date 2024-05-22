package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.StatutFreeTrial;
import ma.zs.alc.dao.criteria.core.freetrial.StatutFreeTrialCriteria;
import ma.zs.alc.dao.facade.core.freetrial.StatutFreeTrialDao;
import ma.zs.alc.dao.specification.core.freetrial.StatutFreeTrialSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.StatutFreeTrialCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class StatutFreeTrialCollaboratorServiceImpl extends AbstractServiceImpl<StatutFreeTrial, StatutFreeTrialCriteria, StatutFreeTrialDao> implements StatutFreeTrialCollaboratorService {






    public StatutFreeTrial findByReferenceEntity(StatutFreeTrial t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<StatutFreeTrial> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(StatutFreeTrial.class, StatutFreeTrialSpecification.class);
    }



    public StatutFreeTrialCollaboratorServiceImpl(StatutFreeTrialDao dao) {
        super(dao);
    }

}