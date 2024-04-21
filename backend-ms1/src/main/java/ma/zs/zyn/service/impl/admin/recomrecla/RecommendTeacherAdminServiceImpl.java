package ma.zs.zyn.service.impl.admin.recomrecla;


import ma.zs.zyn.bean.core.recomrecla.RecommendTeacher;
import ma.zs.zyn.dao.criteria.core.recomrecla.RecommendTeacherCriteria;
import ma.zs.zyn.dao.facade.core.recomrecla.RecommendTeacherDao;
import ma.zs.zyn.dao.specification.core.recomrecla.RecommendTeacherSpecification;
import ma.zs.zyn.service.facade.admin.recomrecla.RecommendTeacherAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.prof.ProfAdminService ;
import ma.zs.zyn.bean.core.prof.Prof ;

import java.util.List;
@Service
public class RecommendTeacherAdminServiceImpl extends AbstractServiceImpl<RecommendTeacher, RecommendTeacherCriteria, RecommendTeacherDao> implements RecommendTeacherAdminService {






    public RecommendTeacher findByReferenceEntity(RecommendTeacher t){
        return  dao.findByRef(t.getRef());
    }
    public void findOrSaveAssociatedObject(RecommendTeacher t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
        }
    }

    public List<RecommendTeacher> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }

    public List<RecommendTeacher> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(RecommendTeacher.class, RecommendTeacherSpecification.class);
    }


    @Autowired
    private ProfAdminService profService ;

    public RecommendTeacherAdminServiceImpl(RecommendTeacherDao dao) {
        super(dao);
    }

}
