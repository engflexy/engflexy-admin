package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.TypeCollaborator;
import ma.zs.alc.dao.criteria.core.collab.TypeCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.TypeCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.TypeCollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.collab.TypeCollaboratorCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeCollaboratorCollaboratorServiceImpl extends AbstractServiceImpl<TypeCollaborator, TypeCollaboratorCriteria, TypeCollaboratorDao> implements TypeCollaboratorCollaboratorService {


    public TypeCollaborator findByReferenceEntity(TypeCollaborator t) {
        return t.getLibelle() == null ? null : dao.findByLibelle(t.getLibelle());
    }


    public List<TypeCollaborator> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(TypeCollaborator.class, TypeCollaboratorSpecification.class);
    }


    public TypeCollaboratorCollaboratorServiceImpl(TypeCollaboratorDao dao) {
        super(dao);
    }

}
