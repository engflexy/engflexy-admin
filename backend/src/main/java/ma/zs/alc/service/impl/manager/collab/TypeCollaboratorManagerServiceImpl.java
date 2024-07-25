package ma.zs.alc.service.impl.manager.collab;


import ma.zs.alc.bean.core.collab.TypeCollaborator;
import ma.zs.alc.dao.criteria.core.collab.TypeCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.TypeCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.TypeCollaboratorSpecification;
import ma.zs.alc.service.facade.manager.collab.TypeCollaboratorManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeCollaboratorManagerServiceImpl extends AbstractServiceImpl<TypeCollaborator, TypeCollaboratorCriteria, TypeCollaboratorDao> implements TypeCollaboratorManagerService {







    public TypeCollaborator findByReferenceEntity(TypeCollaborator t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TypeCollaborator> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeCollaborator.class, TypeCollaboratorSpecification.class);
    }



    public TypeCollaboratorManagerServiceImpl(TypeCollaboratorDao dao) {
        super(dao);
    }

}
