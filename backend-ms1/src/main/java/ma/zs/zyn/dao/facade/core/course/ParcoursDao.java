package ma.zs.zyn.dao.facade.core.course;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.course.Parcours;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.course.Parcours;
import java.util.List;


@Repository
public interface ParcoursDao extends AbstractRepository<Parcours,Long>  {
    Parcours findByCode(String code);
    int deleteByCode(String code);

    List<Parcours> findByCentreId(Long id);
    int deleteByCentreId(Long id);
    long countByCentreRef(String ref);

    @Query("SELECT NEW Parcours(item.id,item.libelle) FROM Parcours item")
    List<Parcours> findAllOptimized();

}
