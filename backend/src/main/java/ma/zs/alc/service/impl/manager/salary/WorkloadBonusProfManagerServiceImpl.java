package ma.zs.alc.service.impl.manager.salary;


import ma.zs.alc.bean.core.salary.WorkloadBonusProf;
import ma.zs.alc.dao.criteria.core.salary.WorkloadBonusProfCriteria;
import ma.zs.alc.dao.facade.core.salary.WorkloadBonusProfDao;
import ma.zs.alc.dao.specification.core.salary.WorkloadBonusProfSpecification;
import ma.zs.alc.service.facade.manager.prof.ProfManagerService;
import ma.zs.alc.service.facade.manager.salary.SalaryManagerService;
import ma.zs.alc.service.facade.manager.salary.WorkloadBonusManagerService;
import ma.zs.alc.service.facade.manager.salary.WorkloadBonusProfManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkloadBonusProfManagerServiceImpl extends AbstractServiceImpl<WorkloadBonusProf, WorkloadBonusProfCriteria, WorkloadBonusProfDao> implements WorkloadBonusProfManagerService {







    public void findOrSaveAssociatedObject(WorkloadBonusProf t){
        if( t != null) {
            t.setWorkloadBonus(workloadBonusService.findOrSave(t.getWorkloadBonus()));
            t.setProf(profService.findOrSave(t.getProf()));
            t.setSalary(salaryService.findOrSave(t.getSalary()));
        }
    }

    public List<WorkloadBonusProf> findByWorkloadBonusId(Long id){
        return dao.findByWorkloadBonusId(id);
    }
    public int deleteByWorkloadBonusId(Long id){
        return dao.deleteByWorkloadBonusId(id);
    }
    public long countByWorkloadBonusCode(String code){
        return dao.countByWorkloadBonusCode(code);
    }
    public List<WorkloadBonusProf> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<WorkloadBonusProf> findBySalaryId(Long id){
        return dao.findBySalaryId(id);
    }
    public int deleteBySalaryId(Long id){
        return dao.deleteBySalaryId(id);
    }
    public long countBySalaryCode(String code){
        return dao.countBySalaryCode(code);
    }






    public void configure() {
        super.configure(WorkloadBonusProf.class, WorkloadBonusProfSpecification.class);
    }


    @Autowired
    private SalaryManagerService salaryService ;
    @Autowired
    private WorkloadBonusManagerService workloadBonusService ;
    @Autowired
    private ProfManagerService profService ;

    public WorkloadBonusProfManagerServiceImpl(WorkloadBonusProfDao dao) {
        super(dao);
    }

}
