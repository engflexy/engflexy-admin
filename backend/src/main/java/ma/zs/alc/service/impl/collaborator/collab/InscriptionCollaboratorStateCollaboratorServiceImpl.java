package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorStateCriteria;
import ma.zs.alc.dao.facade.core.collab.InscriptionCollaboratorStateDao;
import ma.zs.alc.dao.specification.core.collab.InscriptionCollaboratorStateSpecification;
import ma.zs.alc.service.facade.collaborator.collab.InscriptionCollaboratorStateCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;



import java.util.List;
@Service
public class InscriptionCollaboratorStateCollaboratorServiceImpl extends AbstractServiceImpl<InscriptionCollaboratorState, InscriptionCollaboratorStateCriteria, InscriptionCollaboratorStateDao> implements InscriptionCollaboratorStateCollaboratorService {







    public InscriptionCollaboratorState findByReferenceEntity(InscriptionCollaboratorState t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<InscriptionCollaboratorState> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(InscriptionCollaboratorState.class, InscriptionCollaboratorStateSpecification.class);
    }



    public InscriptionCollaboratorStateCollaboratorServiceImpl(InscriptionCollaboratorStateDao dao) {
        super(dao);
    }

    @Override
    public InscriptionCollaboratorState findByLibelle(String libelle) {
        return dao.findByLibelle(libelle);
    }
}
