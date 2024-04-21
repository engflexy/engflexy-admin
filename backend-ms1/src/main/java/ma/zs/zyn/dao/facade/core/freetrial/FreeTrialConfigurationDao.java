package ma.zs.zyn.dao.facade.core.freetrial;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.freetrial.FreeTrialConfiguration;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface FreeTrialConfigurationDao extends AbstractRepository<FreeTrialConfiguration,Long>  {



}
