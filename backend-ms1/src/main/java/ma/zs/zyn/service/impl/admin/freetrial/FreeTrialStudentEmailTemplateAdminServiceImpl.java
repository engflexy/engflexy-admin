package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.FreeTrialStudentEmailTemplate;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialStudentEmailTemplateCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.FreeTrialStudentEmailTemplateDao;
import ma.zs.zyn.dao.specification.core.freetrial.FreeTrialStudentEmailTemplateSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.FreeTrialStudentEmailTemplateAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialStudentEmailTemplateAdminServiceImpl extends AbstractServiceImpl<FreeTrialStudentEmailTemplate, FreeTrialStudentEmailTemplateCriteria, FreeTrialStudentEmailTemplateDao> implements FreeTrialStudentEmailTemplateAdminService {













    public void configure() {
        super.configure(FreeTrialStudentEmailTemplate.class, FreeTrialStudentEmailTemplateSpecification.class);
    }



    public FreeTrialStudentEmailTemplateAdminServiceImpl(FreeTrialStudentEmailTemplateDao dao) {
        super(dao);
    }

}
