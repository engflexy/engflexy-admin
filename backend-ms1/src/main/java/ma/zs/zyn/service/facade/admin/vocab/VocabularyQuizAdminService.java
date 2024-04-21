package ma.zs.zyn.service.facade.admin.vocab;

import java.util.List;
import ma.zs.zyn.bean.core.vocab.VocabularyQuiz;
import ma.zs.zyn.dao.criteria.core.vocab.VocabularyQuizCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface VocabularyQuizAdminService extends  IService<VocabularyQuiz,VocabularyQuizCriteria>  {

    List<VocabularyQuiz> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);




}
