package ma.zs.alc.service.impl.manager.collab;


import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorStateCriteria;
import ma.zs.alc.dao.facade.core.collab.InscriptionCollaboratorStateDao;
import ma.zs.alc.dao.specification.core.collab.InscriptionCollaboratorStateSpecification;
import ma.zs.alc.service.facade.manager.collab.InscriptionCollaboratorStateManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InscriptionCollaboratorStateManagerServiceImpl extends AbstractServiceImpl<InscriptionCollaboratorState, InscriptionCollaboratorStateCriteria, InscriptionCollaboratorStateDao> implements InscriptionCollaboratorStateManagerService {







    public InscriptionCollaboratorState findByReferenceEntity(InscriptionCollaboratorState t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<InscriptionCollaboratorState> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(InscriptionCollaboratorState.class, InscriptionCollaboratorStateSpecification.class);
    }



    public InscriptionCollaboratorStateManagerServiceImpl(InscriptionCollaboratorStateDao dao) {
        super(dao);
    }

}
