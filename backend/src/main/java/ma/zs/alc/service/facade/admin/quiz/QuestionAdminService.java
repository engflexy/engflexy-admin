package ma.zs.alc.service.facade.admin.quiz;

import java.util.List;
import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.dao.criteria.core.quiz.QuestionCriteria;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


public interface QuestionAdminService extends  IService<Question,QuestionCriteria>  {

    List<Question> findByTypeDeQuestionId(Long id);
    int deleteByTypeDeQuestionId(Long id);
    long countByTypeDeQuestionRef(String ref);
    List<Question> findByQuizId(Long id);
    int deleteByQuizId(Long id);
    long countByQuizRef(String ref);

}
