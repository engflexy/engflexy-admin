package ma.zs.zyn.dao.facade.core.quiz;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.quiz.Reponse;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.quiz.Reponse;
import java.util.List;


@Repository
public interface ReponseDao extends AbstractRepository<Reponse,Long>  {
    Reponse findByRef(String ref);
    int deleteByRef(String ref);

    List<Reponse> findByQuestionId(Long id);
    int deleteByQuestionId(Long id);
    long countByQuestionLibelle(String libelle);

    @Query("SELECT NEW Reponse(item.id,item.lib) FROM Reponse item")
    List<Reponse> findAllOptimized();

}
