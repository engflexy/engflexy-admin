package ma.zs.alc.service.impl.manager.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialStudentEmailTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialStudentEmailTemplateCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialStudentEmailTemplateDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialStudentEmailTemplateSpecification;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialStudentEmailTemplateManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;

@Service
public class FreeTrialStudentEmailTemplateManagerServiceImpl extends AbstractServiceImpl<FreeTrialStudentEmailTemplate, FreeTrialStudentEmailTemplateCriteria, FreeTrialStudentEmailTemplateDao> implements FreeTrialStudentEmailTemplateManagerService {














    public void configure() {
        super.configure(FreeTrialStudentEmailTemplate.class, FreeTrialStudentEmailTemplateSpecification.class);
    }



    public FreeTrialStudentEmailTemplateManagerServiceImpl(FreeTrialStudentEmailTemplateDao dao) {
        super(dao);
    }

}
