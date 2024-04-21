package ma.zs.zyn.dao.facade.core.inscriptionref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.EtatEtudiantSchedule;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.inscriptionref.EtatEtudiantSchedule;
import java.util.List;


@Repository
public interface EtatEtudiantScheduleDao extends AbstractRepository<EtatEtudiantSchedule,Long>  {
    EtatEtudiantSchedule findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW EtatEtudiantSchedule(item.id,item.libelle) FROM EtatEtudiantSchedule item")
    List<EtatEtudiantSchedule> findAllOptimized();

}
