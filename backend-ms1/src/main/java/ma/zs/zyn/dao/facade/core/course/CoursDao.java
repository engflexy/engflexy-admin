package ma.zs.zyn.dao.facade.core.course;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.course.Cours;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.course.Cours;
import java.util.List;


@Repository
public interface CoursDao extends AbstractRepository<Cours,Long>  {
    Cours findByCode(String code);
    int deleteByCode(String code);

    List<Cours> findByEtatCoursId(Long id);
    int deleteByEtatCoursId(Long id);
    long countByEtatCoursCode(String code);
    List<Cours> findByParcoursId(Long id);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);

    @Query("SELECT NEW Cours(item.id,item.libelle) FROM Cours item")
    List<Cours> findAllOptimized();

}
