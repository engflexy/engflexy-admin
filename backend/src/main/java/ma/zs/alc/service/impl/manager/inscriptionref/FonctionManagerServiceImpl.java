package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.Fonction;
import ma.zs.alc.dao.criteria.core.inscriptionref.FonctionCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.FonctionDao;
import ma.zs.alc.dao.specification.core.inscriptionref.FonctionSpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.FonctionManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class FonctionManagerServiceImpl extends AbstractServiceImpl<Fonction, FonctionCriteria, FonctionDao> implements FonctionManagerService {







    public Fonction findByReferenceEntity(Fonction t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<Fonction> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Fonction.class, FonctionSpecification.class);
    }



    public FonctionManagerServiceImpl(FonctionDao dao) {
        super(dao);
    }

}
