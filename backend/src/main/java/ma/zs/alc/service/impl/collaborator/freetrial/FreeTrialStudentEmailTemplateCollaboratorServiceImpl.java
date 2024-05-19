package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialStudentEmailTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialStudentEmailTemplateCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialStudentEmailTemplateDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialStudentEmailTemplateSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.FreeTrialStudentEmailTemplateCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialStudentEmailTemplateCollaboratorServiceImpl extends AbstractServiceImpl<FreeTrialStudentEmailTemplate, FreeTrialStudentEmailTemplateCriteria, FreeTrialStudentEmailTemplateDao> implements FreeTrialStudentEmailTemplateCollaboratorService {













    public void configure() {
        super.configure(FreeTrialStudentEmailTemplate.class, FreeTrialStudentEmailTemplateSpecification.class);
    }



    public FreeTrialStudentEmailTemplateCollaboratorServiceImpl(FreeTrialStudentEmailTemplateDao dao) {
        super(dao);
    }

}
