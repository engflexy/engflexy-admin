package ma.zs.alc.service.facade.manager.course;

import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.dao.criteria.core.course.ExerciceCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;



public interface ExerciceManagerService extends  IService<Exercice,ExerciceCriteria>  {

    List<Exercice> findByContentTypeId(Long id);
    int deleteByContentTypeId(Long id);
    long countByContentTypeCode(String code);
    List<Exercice> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);




}
