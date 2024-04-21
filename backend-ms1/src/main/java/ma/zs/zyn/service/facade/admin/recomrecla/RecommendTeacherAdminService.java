package ma.zs.zyn.service.facade.admin.recomrecla;

import java.util.List;
import ma.zs.zyn.bean.core.recomrecla.RecommendTeacher;
import ma.zs.zyn.dao.criteria.core.recomrecla.RecommendTeacherCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface RecommendTeacherAdminService extends  IService<RecommendTeacher,RecommendTeacherCriteria>  {

    List<RecommendTeacher> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);




}
