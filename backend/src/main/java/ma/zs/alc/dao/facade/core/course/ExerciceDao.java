package ma.zs.alc.dao.facade.core.course;

import org.springframework.data.jpa.repository.Query;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.course.Exercice;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface ExerciceDao extends AbstractRepository<Exercice,Long>  {

    List<Exercice> findByContentTypeId(Long id);
    int deleteByContentTypeId(Long id);
    long countByContentTypeCode(String code);
    List<Exercice> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);

    @Query("SELECT NEW Exercice(item.id,item.libelle) FROM Exercice item")
    List<Exercice> findAllOptimized();

}
