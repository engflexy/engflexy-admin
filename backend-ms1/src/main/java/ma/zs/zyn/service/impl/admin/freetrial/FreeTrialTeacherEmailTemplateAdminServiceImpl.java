package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.FreeTrialTeacherEmailTemplate;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialTeacherEmailTemplateCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.FreeTrialTeacherEmailTemplateDao;
import ma.zs.zyn.dao.specification.core.freetrial.FreeTrialTeacherEmailTemplateSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.FreeTrialTeacherEmailTemplateAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialTeacherEmailTemplateAdminServiceImpl extends AbstractServiceImpl<FreeTrialTeacherEmailTemplate, FreeTrialTeacherEmailTemplateCriteria, FreeTrialTeacherEmailTemplateDao> implements FreeTrialTeacherEmailTemplateAdminService {













    public void configure() {
        super.configure(FreeTrialTeacherEmailTemplate.class, FreeTrialTeacherEmailTemplateSpecification.class);
    }



    public FreeTrialTeacherEmailTemplateAdminServiceImpl(FreeTrialTeacherEmailTemplateDao dao) {
        super(dao);
    }

}
