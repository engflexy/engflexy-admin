package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialTeacherEmailTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialTeacherEmailTemplateCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialTeacherEmailTemplateDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialTeacherEmailTemplateSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.FreeTrialTeacherEmailTemplateCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialTeacherEmailTemplateCollaboratorServiceImpl extends AbstractServiceImpl<FreeTrialTeacherEmailTemplate, FreeTrialTeacherEmailTemplateCriteria, FreeTrialTeacherEmailTemplateDao> implements FreeTrialTeacherEmailTemplateCollaboratorService {













    public void configure() {
        super.configure(FreeTrialTeacherEmailTemplate.class, FreeTrialTeacherEmailTemplateSpecification.class);
    }



    public FreeTrialTeacherEmailTemplateCollaboratorServiceImpl(FreeTrialTeacherEmailTemplateDao dao) {
        super(dao);
    }

}
