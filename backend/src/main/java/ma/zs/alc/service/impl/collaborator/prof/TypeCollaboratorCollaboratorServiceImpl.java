package ma.zs.alc.service.impl.collaborator.prof;


import ma.zs.alc.bean.core.common.TypeCollaborator;
import ma.zs.alc.dao.criteria.core.prof.TypeCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.prof.TypeCollaboratorDao;
import ma.zs.alc.dao.specification.core.prof.TypeCollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.prof.TypeCollaboratorCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TypeCollaboratorCollaboratorServiceImpl extends AbstractServiceImpl<TypeCollaborator, TypeCollaboratorCriteria, TypeCollaboratorDao> implements TypeCollaboratorCollaboratorService {






    public TypeCollaborator findByReferenceEntity(TypeCollaborator t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
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
