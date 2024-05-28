package ma.zs.alc.service.impl.admin.prof;


import ma.zs.alc.bean.core.prof.TypeCollaborator;
import ma.zs.alc.dao.criteria.core.prof.TypeCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.prof.TypeCollaboratorDao;
import ma.zs.alc.dao.specification.core.prof.TypeCollaboratorSpecification;
import ma.zs.alc.service.facade.admin.prof.TypeCollaboratorAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TypeCollaboratorAdminServiceImpl extends AbstractServiceImpl<TypeCollaborator, TypeCollaboratorCriteria, TypeCollaboratorDao> implements TypeCollaboratorAdminService {






    public TypeCollaborator findByReferenceEntity(TypeCollaborator t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }


    public List<TypeCollaborator> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeCollaborator.class, TypeCollaboratorSpecification.class);
    }



    public TypeCollaboratorAdminServiceImpl(TypeCollaboratorDao dao) {
        super(dao);
    }

}
