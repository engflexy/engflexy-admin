package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.InteretEtudiant;
import ma.zs.alc.dao.criteria.core.inscriptionref.InteretEtudiantCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.InteretEtudiantDao;
import ma.zs.alc.dao.specification.core.inscriptionref.InteretEtudiantSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.InteretEtudiantCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class InteretEtudiantCollaboratorServiceImpl extends AbstractServiceImpl<InteretEtudiant, InteretEtudiantCriteria, InteretEtudiantDao> implements InteretEtudiantCollaboratorService {






    public InteretEtudiant findByReferenceEntity(InteretEtudiant t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }


    public List<InteretEtudiant> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(InteretEtudiant.class, InteretEtudiantSpecification.class);
    }



    public InteretEtudiantCollaboratorServiceImpl(InteretEtudiantDao dao) {
        super(dao);
    }

}
