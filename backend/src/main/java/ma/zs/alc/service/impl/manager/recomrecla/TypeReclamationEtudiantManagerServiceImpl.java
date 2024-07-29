package ma.zs.alc.service.impl.manager.recomrecla;


import ma.zs.alc.bean.core.recomrecla.TypeReclamationEtudiant;
import ma.zs.alc.dao.criteria.core.recomrecla.TypeReclamationEtudiantCriteria;
import ma.zs.alc.dao.facade.core.recomrecla.TypeReclamationEtudiantDao;
import ma.zs.alc.dao.specification.core.recomrecla.TypeReclamationEtudiantSpecification;
import ma.zs.alc.service.facade.manager.recomrecla.TypeReclamationEtudiantManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TypeReclamationEtudiantManagerServiceImpl extends AbstractServiceImpl<TypeReclamationEtudiant, TypeReclamationEtudiantCriteria, TypeReclamationEtudiantDao> implements TypeReclamationEtudiantManagerService {







    public TypeReclamationEtudiant findByReferenceEntity(TypeReclamationEtudiant t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TypeReclamationEtudiant> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeReclamationEtudiant.class, TypeReclamationEtudiantSpecification.class);
    }



    public TypeReclamationEtudiantManagerServiceImpl(TypeReclamationEtudiantDao dao) {
        super(dao);
    }

}
