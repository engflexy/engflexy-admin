package ma.zs.alc.service.impl.admin.collab;


import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState;
import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorStateCriteria;
import ma.zs.alc.dao.facade.core.collab.PaiementInscriptionCollaboratorStateDao;
import ma.zs.alc.dao.specification.core.collab.PaiementInscriptionCollaboratorStateSpecification;
import ma.zs.alc.service.facade.admin.collab.PaiementInscriptionCollaboratorStateAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;



import java.util.List;
@Service
public class PaiementInscriptionCollaboratorStateAdminServiceImpl extends AbstractServiceImpl<PaiementInscriptionCollaboratorState, PaiementInscriptionCollaboratorStateCriteria, PaiementInscriptionCollaboratorStateDao> implements PaiementInscriptionCollaboratorStateAdminService {







    public PaiementInscriptionCollaboratorState findByReferenceEntity(PaiementInscriptionCollaboratorState t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<PaiementInscriptionCollaboratorState> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(PaiementInscriptionCollaboratorState.class, PaiementInscriptionCollaboratorStateSpecification.class);
    }



    public PaiementInscriptionCollaboratorStateAdminServiceImpl(PaiementInscriptionCollaboratorStateDao dao) {
        super(dao);
    }

}
