package ma.zs.zyn.dao.facade.core.courseref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.courseref.EtatCours;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.courseref.EtatCours;
import java.util.List;


@Repository
public interface EtatCoursDao extends AbstractRepository<EtatCours,Long>  {
    EtatCours findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW EtatCours(item.id,item.libelle) FROM EtatCours item")
    List<EtatCours> findAllOptimized();

}
