package ma.zs.alc.dao.facade.core.quiz;

import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface QuizDao extends AbstractRepository<Quiz, Long> {
    Quiz findByRef(String ref);

    int deleteByRef(String ref);

    List<Quiz> findByExerciceId(Long id);

    int deleteByExerciceId(Long id);

    long countByExerciceLibelle(String code);

    @Query("SELECT NEW Quiz(item.id,item.lib) FROM Quiz item")
    List<Quiz> findAllOptimized();

}
