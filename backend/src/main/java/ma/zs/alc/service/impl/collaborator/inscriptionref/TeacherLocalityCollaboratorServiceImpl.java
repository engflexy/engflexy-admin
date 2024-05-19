package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.TeacherLocality;
import ma.zs.alc.dao.criteria.core.inscriptionref.TeacherLocalityCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.TeacherLocalityDao;
import ma.zs.alc.dao.specification.core.inscriptionref.TeacherLocalitySpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.TeacherLocalityCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TeacherLocalityCollaboratorServiceImpl extends AbstractServiceImpl<TeacherLocality, TeacherLocalityCriteria, TeacherLocalityDao> implements TeacherLocalityCollaboratorService {






    public TeacherLocality findByReferenceEntity(TeacherLocality t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TeacherLocality> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TeacherLocality.class, TeacherLocalitySpecification.class);
    }



    public TeacherLocalityCollaboratorServiceImpl(TeacherLocalityDao dao) {
        super(dao);
    }

}
