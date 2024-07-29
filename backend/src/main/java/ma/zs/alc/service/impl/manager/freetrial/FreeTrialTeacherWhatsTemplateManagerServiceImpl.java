package ma.zs.alc.service.impl.manager.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialTeacherWhatsTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialTeacherWhatsTemplateCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialTeacherWhatsTemplateDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialTeacherWhatsTemplateSpecification;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialTeacherWhatsTemplateManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class FreeTrialTeacherWhatsTemplateManagerServiceImpl extends AbstractServiceImpl<FreeTrialTeacherWhatsTemplate, FreeTrialTeacherWhatsTemplateCriteria, FreeTrialTeacherWhatsTemplateDao> implements FreeTrialTeacherWhatsTemplateManagerService {














    public void configure() {
        super.configure(FreeTrialTeacherWhatsTemplate.class, FreeTrialTeacherWhatsTemplateSpecification.class);
    }



    public FreeTrialTeacherWhatsTemplateManagerServiceImpl(FreeTrialTeacherWhatsTemplateDao dao) {
        super(dao);
    }

}
