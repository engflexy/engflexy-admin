package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialConfiguration;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialConfigurationCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialConfigurationDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialConfigurationSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.FreeTrialConfigurationCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialConfigurationCollaboratorServiceImpl extends AbstractServiceImpl<FreeTrialConfiguration, FreeTrialConfigurationCriteria, FreeTrialConfigurationDao> implements FreeTrialConfigurationCollaboratorService {













    public void configure() {
        super.configure(FreeTrialConfiguration.class, FreeTrialConfigurationSpecification.class);
    }



    public FreeTrialConfigurationCollaboratorServiceImpl(FreeTrialConfigurationDao dao) {
        super(dao);
    }

}
