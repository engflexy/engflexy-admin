package ma.zs.zyn.dao.facade.core.freetrial;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.freetrial.StatutFreeTrial;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.freetrial.StatutFreeTrial;
import java.util.List;


@Repository
public interface StatutFreeTrialDao extends AbstractRepository<StatutFreeTrial,Long>  {
    StatutFreeTrial findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW StatutFreeTrial(item.id,item.libelle) FROM StatutFreeTrial item")
    List<StatutFreeTrial> findAllOptimized();

}
