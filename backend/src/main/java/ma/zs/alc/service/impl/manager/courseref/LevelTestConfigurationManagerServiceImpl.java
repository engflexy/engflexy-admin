package ma.zs.alc.service.impl.manager.courseref;


import ma.zs.alc.bean.core.courseref.LevelTestConfiguration;
import ma.zs.alc.dao.criteria.core.courseref.LevelTestConfigurationCriteria;
import ma.zs.alc.dao.facade.core.courseref.LevelTestConfigurationDao;
import ma.zs.alc.dao.specification.core.courseref.LevelTestConfigurationSpecification;
import ma.zs.alc.service.facade.manager.course.ParcoursManagerService;
import ma.zs.alc.service.facade.manager.courseref.LevelTestConfigurationManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LevelTestConfigurationManagerServiceImpl extends AbstractServiceImpl<LevelTestConfiguration, LevelTestConfigurationCriteria, LevelTestConfigurationDao> implements LevelTestConfigurationManagerService {







    public void findOrSaveAssociatedObject(LevelTestConfiguration t){
        if( t != null) {
            t.setParcours(parcoursService.findOrSave(t.getParcours()));
        }
    }

    public List<LevelTestConfiguration> findByParcoursId(Long id){
        return dao.findByParcoursId(id);
    }
    public int deleteByParcoursId(Long id){
        return dao.deleteByParcoursId(id);
    }
    public long countByParcoursCode(String code){
        return dao.countByParcoursCode(code);
    }






    public void configure() {
        super.configure(LevelTestConfiguration.class, LevelTestConfigurationSpecification.class);
    }


    @Autowired
    private ParcoursManagerService parcoursService ;

    public LevelTestConfigurationManagerServiceImpl(LevelTestConfigurationDao dao) {
        super(dao);
    }

}
