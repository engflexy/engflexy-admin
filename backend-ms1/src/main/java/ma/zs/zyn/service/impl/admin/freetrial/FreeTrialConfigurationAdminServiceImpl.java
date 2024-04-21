package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.FreeTrialConfiguration;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialConfigurationCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.FreeTrialConfigurationDao;
import ma.zs.zyn.dao.specification.core.freetrial.FreeTrialConfigurationSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.FreeTrialConfigurationAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialConfigurationAdminServiceImpl extends AbstractServiceImpl<FreeTrialConfiguration, FreeTrialConfigurationCriteria, FreeTrialConfigurationDao> implements FreeTrialConfigurationAdminService {













    public void configure() {
        super.configure(FreeTrialConfiguration.class, FreeTrialConfigurationSpecification.class);
    }



    public FreeTrialConfigurationAdminServiceImpl(FreeTrialConfigurationDao dao) {
        super(dao);
    }

}
