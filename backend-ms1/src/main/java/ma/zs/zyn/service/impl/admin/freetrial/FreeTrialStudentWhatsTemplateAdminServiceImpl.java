package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.FreeTrialStudentWhatsTemplate;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialStudentWhatsTemplateCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.FreeTrialStudentWhatsTemplateDao;
import ma.zs.zyn.dao.specification.core.freetrial.FreeTrialStudentWhatsTemplateSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.FreeTrialStudentWhatsTemplateAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class FreeTrialStudentWhatsTemplateAdminServiceImpl extends AbstractServiceImpl<FreeTrialStudentWhatsTemplate, FreeTrialStudentWhatsTemplateCriteria, FreeTrialStudentWhatsTemplateDao> implements FreeTrialStudentWhatsTemplateAdminService {













    public void configure() {
        super.configure(FreeTrialStudentWhatsTemplate.class, FreeTrialStudentWhatsTemplateSpecification.class);
    }



    public FreeTrialStudentWhatsTemplateAdminServiceImpl(FreeTrialStudentWhatsTemplateDao dao) {
        super(dao);
    }

}
