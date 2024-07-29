package ma.zs.alc.service.impl.manager.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialTeacherEmailTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialTeacherEmailTemplateCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialTeacherEmailTemplateDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialTeacherEmailTemplateSpecification;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialTeacherEmailTemplateManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class FreeTrialTeacherEmailTemplateManagerServiceImpl extends AbstractServiceImpl<FreeTrialTeacherEmailTemplate, FreeTrialTeacherEmailTemplateCriteria, FreeTrialTeacherEmailTemplateDao> implements FreeTrialTeacherEmailTemplateManagerService {














    public void configure() {
        super.configure(FreeTrialTeacherEmailTemplate.class, FreeTrialTeacherEmailTemplateSpecification.class);
    }



    public FreeTrialTeacherEmailTemplateManagerServiceImpl(FreeTrialTeacherEmailTemplateDao dao) {
        super(dao);
    }

}
