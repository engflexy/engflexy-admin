package ma.zs.alc.dao.facade.core.course;

import ma.zs.alc.bean.core.course.Cours;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CoursDao extends AbstractRepository<Cours, Long> {
    Cours findByCode(String code);

    int deleteByCode(String code);

    List<Cours> findByParcoursId(Long id);

    int deleteByParcoursId(Long id);

    long countByParcoursCode(String code);

    @Query("SELECT NEW Cours(item.id,item.libelle) FROM Cours item")
    List<Cours> findAllOptimized();

}
