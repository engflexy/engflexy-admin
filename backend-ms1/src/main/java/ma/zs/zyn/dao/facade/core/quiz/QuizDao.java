package ma.zs.zyn.dao.facade.core.quiz;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.quiz.Quiz;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.quiz.Quiz;
import java.util.List;


@Repository
public interface QuizDao extends AbstractRepository<Quiz,Long>  {
    Quiz findByRef(String ref);
    int deleteByRef(String ref);

    List<Quiz> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);

    @Query("SELECT NEW Quiz(item.id,item.lib) FROM Quiz item")
    List<Quiz> findAllOptimized();

}
