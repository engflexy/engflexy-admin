package ma.zs.alc.service.facade.collaborator.courseref;

import java.util.List;
import ma.zs.alc.bean.core.courseref.LevelTestConfiguration;
import ma.zs.alc.dao.criteria.core.courseref.LevelTestConfigurationCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface LevelTestConfigurationCollaboratorService extends  IService<LevelTestConfiguration,LevelTestConfigurationCriteria>  {

    List<LevelTestConfiguration> findByParcoursId(Long id);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);




}
