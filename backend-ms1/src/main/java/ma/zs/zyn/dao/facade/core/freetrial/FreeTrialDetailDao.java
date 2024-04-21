package ma.zs.zyn.dao.facade.core.freetrial;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.freetrial.FreeTrialDetail;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface FreeTrialDetailDao extends AbstractRepository<FreeTrialDetail,Long>  {

    List<FreeTrialDetail> findByFreeTrialId(Long id);
    int deleteByFreeTrialId(Long id);
    long countByFreeTrialReference(String reference);
    List<FreeTrialDetail> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);


}
