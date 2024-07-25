package ma.zs.alc.service.impl.manager.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialStudentWhatsTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialStudentWhatsTemplateCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialStudentWhatsTemplateDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialStudentWhatsTemplateSpecification;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialStudentWhatsTemplateManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class FreeTrialStudentWhatsTemplateManagerServiceImpl extends AbstractServiceImpl<FreeTrialStudentWhatsTemplate, FreeTrialStudentWhatsTemplateCriteria, FreeTrialStudentWhatsTemplateDao> implements FreeTrialStudentWhatsTemplateManagerService {














    public void configure() {
        super.configure(FreeTrialStudentWhatsTemplate.class, FreeTrialStudentWhatsTemplateSpecification.class);
    }



    public FreeTrialStudentWhatsTemplateManagerServiceImpl(FreeTrialStudentWhatsTemplateDao dao) {
        super(dao);
    }

}
