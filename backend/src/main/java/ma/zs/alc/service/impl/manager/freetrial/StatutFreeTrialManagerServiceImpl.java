package ma.zs.alc.service.impl.manager.freetrial;


import ma.zs.alc.bean.core.freetrial.StatutFreeTrial;
import ma.zs.alc.dao.criteria.core.freetrial.StatutFreeTrialCriteria;
import ma.zs.alc.dao.facade.core.freetrial.StatutFreeTrialDao;
import ma.zs.alc.dao.specification.core.freetrial.StatutFreeTrialSpecification;
import ma.zs.alc.service.facade.manager.freetrial.StatutFreeTrialManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatutFreeTrialManagerServiceImpl extends AbstractServiceImpl<StatutFreeTrial, StatutFreeTrialCriteria, StatutFreeTrialDao> implements StatutFreeTrialManagerService {







    public StatutFreeTrial findByReferenceEntity(StatutFreeTrial t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<StatutFreeTrial> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(StatutFreeTrial.class, StatutFreeTrialSpecification.class);
    }



    public StatutFreeTrialManagerServiceImpl(StatutFreeTrialDao dao) {
        super(dao);
    }

}
