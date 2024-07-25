package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.TeacherLocality;
import ma.zs.alc.dao.criteria.core.inscriptionref.TeacherLocalityCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.TeacherLocalityDao;
import ma.zs.alc.dao.specification.core.inscriptionref.TeacherLocalitySpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.TeacherLocalityManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherLocalityManagerServiceImpl extends AbstractServiceImpl<TeacherLocality, TeacherLocalityCriteria, TeacherLocalityDao> implements TeacherLocalityManagerService {







    public TeacherLocality findByReferenceEntity(TeacherLocality t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TeacherLocality> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TeacherLocality.class, TeacherLocalitySpecification.class);
    }



    public TeacherLocalityManagerServiceImpl(TeacherLocalityDao dao) {
        super(dao);
    }

}
