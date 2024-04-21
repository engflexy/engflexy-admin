package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.TeacherLocality;
import ma.zs.zyn.dao.criteria.core.inscriptionref.TeacherLocalityCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.TeacherLocalityDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.TeacherLocalitySpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.TeacherLocalityAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TeacherLocalityAdminServiceImpl extends AbstractServiceImpl<TeacherLocality, TeacherLocalityCriteria, TeacherLocalityDao> implements TeacherLocalityAdminService {






    public TeacherLocality findByReferenceEntity(TeacherLocality t){
        return  dao.findByCode(t.getCode());
    }


    public List<TeacherLocality> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TeacherLocality.class, TeacherLocalitySpecification.class);
    }



    public TeacherLocalityAdminServiceImpl(TeacherLocalityDao dao) {
        super(dao);
    }

}
