package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.EtatInscription;
import ma.zs.alc.dao.criteria.core.inscriptionref.EtatInscriptionCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.EtatInscriptionDao;
import ma.zs.alc.dao.specification.core.inscriptionref.EtatInscriptionSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.EtatInscriptionCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EtatInscriptionCollaboratorServiceImpl extends AbstractServiceImpl<EtatInscription, EtatInscriptionCriteria, EtatInscriptionDao> implements EtatInscriptionCollaboratorService {


    public EtatInscription findByReferenceEntity(EtatInscription t) {
        return t == null ? null : dao.findByRef(t.getRef());
    }


    public List<EtatInscription> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(EtatInscription.class, EtatInscriptionSpecification.class);
    }


    public EtatInscriptionCollaboratorServiceImpl(EtatInscriptionDao dao) {
        super(dao);
    }

}
