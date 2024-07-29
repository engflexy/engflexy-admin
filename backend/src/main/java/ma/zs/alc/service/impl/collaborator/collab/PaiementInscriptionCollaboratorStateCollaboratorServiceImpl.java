package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState;
import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorStateCriteria;
import ma.zs.alc.dao.facade.core.collab.PaiementInscriptionCollaboratorStateDao;
import ma.zs.alc.dao.specification.core.collab.PaiementInscriptionCollaboratorStateSpecification;
import ma.zs.alc.service.facade.collaborator.collab.PaiementInscriptionCollaboratorStateCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaiementInscriptionCollaboratorStateCollaboratorServiceImpl extends AbstractServiceImpl<PaiementInscriptionCollaboratorState, PaiementInscriptionCollaboratorStateCriteria, PaiementInscriptionCollaboratorStateDao> implements PaiementInscriptionCollaboratorStateCollaboratorService {


    public PaiementInscriptionCollaboratorState findByReferenceEntity(PaiementInscriptionCollaboratorState t) {
        return t == null ? null : dao.findByCode(t.getCode());
    }


    public List<PaiementInscriptionCollaboratorState> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(PaiementInscriptionCollaboratorState.class, PaiementInscriptionCollaboratorStateSpecification.class);
    }


    public PaiementInscriptionCollaboratorStateCollaboratorServiceImpl(PaiementInscriptionCollaboratorStateDao dao) {
        super(dao);
    }

}
