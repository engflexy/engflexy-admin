package ma.zs.alc.service.facade.admin.course;

import java.util.List;
import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.dao.criteria.core.course.ExerciceCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface ExerciceAdminService extends  IService<Exercice,ExerciceCriteria>  {

    List<Exercice> findByContentTypeId(Long id);
    int deleteByContentTypeId(Long id);
    long countByContentTypeCode(String code);
    List<Exercice> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);


    Exercice findByNumero(Long numero);

}
