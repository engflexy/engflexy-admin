package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.FreeTrialTeacherWhatsTemplate;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialTeacherWhatsTemplateCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.FreeTrialTeacherWhatsTemplateDao;
import ma.zs.zyn.dao.specification.core.freetrial.FreeTrialTeacherWhatsTemplateSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.FreeTrialTeacherWhatsTemplateAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialTeacherWhatsTemplateAdminServiceImpl extends AbstractServiceImpl<FreeTrialTeacherWhatsTemplate, FreeTrialTeacherWhatsTemplateCriteria, FreeTrialTeacherWhatsTemplateDao> implements FreeTrialTeacherWhatsTemplateAdminService {













    public void configure() {
        super.configure(FreeTrialTeacherWhatsTemplate.class, FreeTrialTeacherWhatsTemplateSpecification.class);
    }



    public FreeTrialTeacherWhatsTemplateAdminServiceImpl(FreeTrialTeacherWhatsTemplateDao dao) {
        super(dao);
    }

}
