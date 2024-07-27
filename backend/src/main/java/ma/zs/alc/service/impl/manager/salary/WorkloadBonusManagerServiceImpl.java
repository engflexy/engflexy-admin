package ma.zs.alc.service.impl.manager.salary;


import ma.zs.alc.bean.core.salary.WorkloadBonus;
import ma.zs.alc.dao.criteria.core.salary.WorkloadBonusCriteria;
import ma.zs.alc.dao.facade.core.salary.WorkloadBonusDao;
import ma.zs.alc.dao.specification.core.salary.WorkloadBonusSpecification;
import ma.zs.alc.service.facade.manager.salary.WorkloadBonusManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class WorkloadBonusManagerServiceImpl extends AbstractServiceImpl<WorkloadBonus, WorkloadBonusCriteria, WorkloadBonusDao> implements WorkloadBonusManagerService {







    public WorkloadBonus findByReferenceEntity(WorkloadBonus t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<WorkloadBonus> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(WorkloadBonus.class, WorkloadBonusSpecification.class);
    }



    public WorkloadBonusManagerServiceImpl(WorkloadBonusDao dao) {
        super(dao);
    }

}
