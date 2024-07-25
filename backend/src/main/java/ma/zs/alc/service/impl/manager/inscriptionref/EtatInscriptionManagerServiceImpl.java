package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.EtatInscription;
import ma.zs.alc.dao.criteria.core.inscriptionref.EtatInscriptionCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.EtatInscriptionDao;
import ma.zs.alc.dao.specification.core.inscriptionref.EtatInscriptionSpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.EtatInscriptionManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EtatInscriptionManagerServiceImpl extends AbstractServiceImpl<EtatInscription, EtatInscriptionCriteria, EtatInscriptionDao> implements EtatInscriptionManagerService {







    public EtatInscription findByReferenceEntity(EtatInscription t){
        return t==null? null : dao.findByLibelle(t.getLibelle());
    }


    public List<EtatInscription> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(EtatInscription.class, EtatInscriptionSpecification.class);
    }



    public EtatInscriptionManagerServiceImpl(EtatInscriptionDao dao) {
        super(dao);
    }

}
