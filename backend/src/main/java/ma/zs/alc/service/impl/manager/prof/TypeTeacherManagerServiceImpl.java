package ma.zs.alc.service.impl.manager.prof;


import ma.zs.alc.bean.core.prof.TypeTeacher;
import ma.zs.alc.dao.criteria.core.prof.TypeTeacherCriteria;
import ma.zs.alc.dao.facade.core.prof.TypeTeacherDao;
import ma.zs.alc.dao.specification.core.prof.TypeTeacherSpecification;
import ma.zs.alc.service.facade.manager.prof.TypeTeacherManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TypeTeacherManagerServiceImpl extends AbstractServiceImpl<TypeTeacher, TypeTeacherCriteria, TypeTeacherDao> implements TypeTeacherManagerService {







    public TypeTeacher findByReferenceEntity(TypeTeacher t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TypeTeacher> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeTeacher.class, TypeTeacherSpecification.class);
    }



    public TypeTeacherManagerServiceImpl(TypeTeacherDao dao) {
        super(dao);
    }

}
