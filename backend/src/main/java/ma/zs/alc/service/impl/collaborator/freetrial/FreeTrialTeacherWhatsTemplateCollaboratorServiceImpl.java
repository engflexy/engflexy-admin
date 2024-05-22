package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialTeacherWhatsTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialTeacherWhatsTemplateCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialTeacherWhatsTemplateDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialTeacherWhatsTemplateSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.FreeTrialTeacherWhatsTemplateCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialTeacherWhatsTemplateCollaboratorServiceImpl extends AbstractServiceImpl<FreeTrialTeacherWhatsTemplate, FreeTrialTeacherWhatsTemplateCriteria, FreeTrialTeacherWhatsTemplateDao> implements FreeTrialTeacherWhatsTemplateCollaboratorService {













    public void configure() {
        super.configure(FreeTrialTeacherWhatsTemplate.class, FreeTrialTeacherWhatsTemplateSpecification.class);
    }



    public FreeTrialTeacherWhatsTemplateCollaboratorServiceImpl(FreeTrialTeacherWhatsTemplateDao dao) {
        super(dao);
    }

}