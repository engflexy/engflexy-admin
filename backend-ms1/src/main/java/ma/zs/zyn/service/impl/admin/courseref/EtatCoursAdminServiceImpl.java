package ma.zs.zyn.service.impl.admin.courseref;


import ma.zs.zyn.bean.core.courseref.EtatCours;
import ma.zs.zyn.dao.criteria.core.courseref.EtatCoursCriteria;
import ma.zs.zyn.dao.facade.core.courseref.EtatCoursDao;
import ma.zs.zyn.dao.specification.core.courseref.EtatCoursSpecification;
import ma.zs.zyn.service.facade.admin.courseref.EtatCoursAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class EtatCoursAdminServiceImpl extends AbstractServiceImpl<EtatCours, EtatCoursCriteria, EtatCoursDao> implements EtatCoursAdminService {






    public EtatCours findByReferenceEntity(EtatCours t){
        return  dao.findByCode(t.getCode());
    }


    public List<EtatCours> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(EtatCours.class, EtatCoursSpecification.class);
    }



    public EtatCoursAdminServiceImpl(EtatCoursDao dao) {
        super(dao);
    }

}
