package ma.zs.zyn.service.facade.admin.courseref;

import java.util.List;
import ma.zs.zyn.bean.core.courseref.LevelTestConfiguration;
import ma.zs.zyn.dao.criteria.core.courseref.LevelTestConfigurationCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface LevelTestConfigurationAdminService extends  IService<LevelTestConfiguration,LevelTestConfigurationCriteria>  {

    List<LevelTestConfiguration> findByParcoursId(Long id);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);




}
