package ma.zs.zyn.dao.facade.core.courseref;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.courseref.LevelTestConfiguration;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface LevelTestConfigurationDao extends AbstractRepository<LevelTestConfiguration,Long>  {

    List<LevelTestConfiguration> findByParcoursId(Long id);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);


}
