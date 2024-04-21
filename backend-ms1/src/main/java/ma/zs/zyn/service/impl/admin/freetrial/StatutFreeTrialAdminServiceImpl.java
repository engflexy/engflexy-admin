package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.StatutFreeTrial;
import ma.zs.zyn.dao.criteria.core.freetrial.StatutFreeTrialCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.StatutFreeTrialDao;
import ma.zs.zyn.dao.specification.core.freetrial.StatutFreeTrialSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.StatutFreeTrialAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class StatutFreeTrialAdminServiceImpl extends AbstractServiceImpl<StatutFreeTrial, StatutFreeTrialCriteria, StatutFreeTrialDao> implements StatutFreeTrialAdminService {






    public StatutFreeTrial findByReferenceEntity(StatutFreeTrial t){
        return  dao.findByCode(t.getCode());
    }


    public List<StatutFreeTrial> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(StatutFreeTrial.class, StatutFreeTrialSpecification.class);
    }



    public StatutFreeTrialAdminServiceImpl(StatutFreeTrialDao dao) {
        super(dao);
    }

}
