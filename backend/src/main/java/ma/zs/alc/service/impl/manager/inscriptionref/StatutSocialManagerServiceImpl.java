package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.StatutSocial;
import ma.zs.alc.dao.criteria.core.inscriptionref.StatutSocialCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.StatutSocialDao;
import ma.zs.alc.dao.specification.core.inscriptionref.StatutSocialSpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.StatutSocialManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StatutSocialManagerServiceImpl extends AbstractServiceImpl<StatutSocial, StatutSocialCriteria, StatutSocialDao> implements StatutSocialManagerService {







    public StatutSocial findByReferenceEntity(StatutSocial t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<StatutSocial> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(StatutSocial.class, StatutSocialSpecification.class);
    }



    public StatutSocialManagerServiceImpl(StatutSocialDao dao) {
        super(dao);
    }

}
