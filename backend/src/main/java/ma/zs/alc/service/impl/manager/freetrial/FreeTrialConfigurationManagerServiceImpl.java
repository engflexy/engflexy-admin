package ma.zs.alc.service.impl.manager.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialConfiguration;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialConfigurationCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialConfigurationDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialConfigurationSpecification;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialConfigurationManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;

@Service
public class FreeTrialConfigurationManagerServiceImpl extends AbstractServiceImpl<FreeTrialConfiguration, FreeTrialConfigurationCriteria, FreeTrialConfigurationDao> implements FreeTrialConfigurationManagerService {














    public void configure() {
        super.configure(FreeTrialConfiguration.class, FreeTrialConfigurationSpecification.class);
    }



    public FreeTrialConfigurationManagerServiceImpl(FreeTrialConfigurationDao dao) {
        super(dao);
    }

}
