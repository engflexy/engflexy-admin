package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialStudentWhatsTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialStudentWhatsTemplateCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialStudentWhatsTemplateDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialStudentWhatsTemplateSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.FreeTrialStudentWhatsTemplateCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialStudentWhatsTemplateCollaboratorServiceImpl extends AbstractServiceImpl<FreeTrialStudentWhatsTemplate, FreeTrialStudentWhatsTemplateCriteria, FreeTrialStudentWhatsTemplateDao> implements FreeTrialStudentWhatsTemplateCollaboratorService {













    public void configure() {
        super.configure(FreeTrialStudentWhatsTemplate.class, FreeTrialStudentWhatsTemplateSpecification.class);
    }



    public FreeTrialStudentWhatsTemplateCollaboratorServiceImpl(FreeTrialStudentWhatsTemplateDao dao) {
        super(dao);
    }

}
