package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.InteretEtudiant;
import ma.zs.alc.dao.criteria.core.inscriptionref.InteretEtudiantCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.InteretEtudiantDao;
import ma.zs.alc.dao.specification.core.inscriptionref.InteretEtudiantSpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.InteretEtudiantManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class InteretEtudiantManagerServiceImpl extends AbstractServiceImpl<InteretEtudiant, InteretEtudiantCriteria, InteretEtudiantDao> implements InteretEtudiantManagerService {







    public InteretEtudiant findByReferenceEntity(InteretEtudiant t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<InteretEtudiant> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(InteretEtudiant.class, InteretEtudiantSpecification.class);
    }



    public InteretEtudiantManagerServiceImpl(InteretEtudiantDao dao) {
        super(dao);
    }

}
