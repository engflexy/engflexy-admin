package ma.zs.alc.service.facade.collaborator.recomrecla;

import java.util.List;
import ma.zs.alc.bean.core.recomrecla.RecommendTeacher;
import ma.zs.alc.dao.criteria.core.recomrecla.RecommendTeacherCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface RecommendTeacherCollaboratorService extends  IService<RecommendTeacher,RecommendTeacherCriteria>  {

    List<RecommendTeacher> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);




}
