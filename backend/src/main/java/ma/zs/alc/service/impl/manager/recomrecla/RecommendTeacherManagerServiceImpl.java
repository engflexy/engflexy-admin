package ma.zs.alc.service.impl.manager.recomrecla;


import ma.zs.alc.bean.core.recomrecla.RecommendTeacher;
import ma.zs.alc.dao.criteria.core.recomrecla.RecommendTeacherCriteria;
import ma.zs.alc.dao.facade.core.recomrecla.RecommendTeacherDao;
import ma.zs.alc.dao.specification.core.recomrecla.RecommendTeacherSpecification;
import ma.zs.alc.service.facade.manager.recomrecla.RecommendTeacherManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.prof.ProfManagerService ;

@Service
public class RecommendTeacherManagerServiceImpl extends AbstractServiceImpl<RecommendTeacher, RecommendTeacherCriteria, RecommendTeacherDao> implements RecommendTeacherManagerService {







    public RecommendTeacher findByReferenceEntity(RecommendTeacher t){
        return t==null? null : dao.findByRef(t.getRef());
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
    private ProfManagerService profService ;

    public RecommendTeacherManagerServiceImpl(RecommendTeacherDao dao) {
        super(dao);
    }

}
