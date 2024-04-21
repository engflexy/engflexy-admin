package ma.zs.zyn.dao.facade.core.prof;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.prof.TrancheHoraireProf;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface TrancheHoraireProfDao extends AbstractRepository<TrancheHoraireProf,Long>  {

    List<TrancheHoraireProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);


}