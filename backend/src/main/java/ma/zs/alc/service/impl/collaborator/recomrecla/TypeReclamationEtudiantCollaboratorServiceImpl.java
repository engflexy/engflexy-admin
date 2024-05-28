package ma.zs.alc.service.impl.collaborator.recomrecla;


import ma.zs.alc.bean.core.recomrecla.TypeReclamationEtudiant;
import ma.zs.alc.dao.criteria.core.recomrecla.TypeReclamationEtudiantCriteria;
import ma.zs.alc.dao.facade.core.recomrecla.TypeReclamationEtudiantDao;
import ma.zs.alc.dao.specification.core.recomrecla.TypeReclamationEtudiantSpecification;
import ma.zs.alc.service.facade.collaborator.recomrecla.TypeReclamationEtudiantCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TypeReclamationEtudiantCollaboratorServiceImpl extends AbstractServiceImpl<TypeReclamationEtudiant, TypeReclamationEtudiantCriteria, TypeReclamationEtudiantDao> implements TypeReclamationEtudiantCollaboratorService {






    public TypeReclamationEtudiant findByReferenceEntity(TypeReclamationEtudiant t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }


    public List<TypeReclamationEtudiant> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeReclamationEtudiant.class, TypeReclamationEtudiantSpecification.class);
    }



    public TypeReclamationEtudiantCollaboratorServiceImpl(TypeReclamationEtudiantDao dao) {
        super(dao);
    }

}
