package ma.zs.zyn.dao.facade.core.vocab;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.vocab.Vocabulary;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface VocabularyDao extends AbstractRepository<Vocabulary,Long>  {

    List<Vocabulary> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);
    List<Vocabulary> findByVocabularyQuizId(Long id);
    int deleteByVocabularyQuizId(Long id);
    long countByVocabularyQuizId(Long id);


}
