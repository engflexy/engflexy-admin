package ma.zs.zyn.service.facade.admin.quiz;

import java.util.List;
import ma.zs.zyn.bean.core.quiz.Quiz;
import ma.zs.zyn.dao.criteria.core.quiz.QuizCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface QuizAdminService extends  IService<Quiz,QuizCriteria>  {

    List<Quiz> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);




}
