package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.StatutSocial;
import ma.zs.zyn.dao.criteria.core.inscriptionref.StatutSocialCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.StatutSocialDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.StatutSocialSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.StatutSocialAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class StatutSocialAdminServiceImpl extends AbstractServiceImpl<StatutSocial, StatutSocialCriteria, StatutSocialDao> implements StatutSocialAdminService {






    public StatutSocial findByReferenceEntity(StatutSocial t){
        return  dao.findByCode(t.getCode());
    }


    public List<StatutSocial> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(StatutSocial.class, StatutSocialSpecification.class);
    }



    public StatutSocialAdminServiceImpl(StatutSocialDao dao) {
        super(dao);
    }

}
