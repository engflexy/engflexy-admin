package ma.zs.zyn.service.facade.admin.quiz;

import java.util.List;
import ma.zs.zyn.bean.core.quiz.Question;
import ma.zs.zyn.dao.criteria.core.quiz.QuestionCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface QuestionAdminService extends  IService<Question,QuestionCriteria>  {

    List<Question> findByTypeDeQuestionId(Long id);
    int deleteByTypeDeQuestionId(Long id);
    long countByTypeDeQuestionRef(String ref);
    List<Question> findByQuizId(Long id);
    int deleteByQuizId(Long id);
    long countByQuizRef(String ref);
    List<Question> findByHomeWorkId(Long id);
    int deleteByHomeWorkId(Long id);
    long countByHomeWorkId(Long id);




}
