package ma.zs.zyn.service.impl.admin.salary;


import ma.zs.zyn.bean.core.salary.WorkloadBonusProf;
import ma.zs.zyn.dao.criteria.core.salary.WorkloadBonusProfCriteria;
import ma.zs.zyn.dao.facade.core.salary.WorkloadBonusProfDao;
import ma.zs.zyn.dao.specification.core.salary.WorkloadBonusProfSpecification;
import ma.zs.zyn.service.facade.admin.salary.WorkloadBonusProfAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.salary.SalaryAdminService ;
import ma.zs.zyn.bean.core.salary.Salary ;
import ma.zs.zyn.service.facade.admin.salary.WorkloadBonusAdminService ;
import ma.zs.zyn.bean.core.salary.WorkloadBonus ;
import ma.zs.zyn.service.facade.admin.prof.ProfAdminService ;
import ma.zs.zyn.bean.core.prof.Prof ;

import java.util.List;
@Service
public class WorkloadBonusProfAdminServiceImpl extends AbstractServiceImpl<WorkloadBonusProf, WorkloadBonusProfCriteria, WorkloadBonusProfDao> implements WorkloadBonusProfAdminService {






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
    private SalaryAdminService salaryService ;
    @Autowired
    private WorkloadBonusAdminService workloadBonusService ;
    @Autowired
    private ProfAdminService profService ;

    public WorkloadBonusProfAdminServiceImpl(WorkloadBonusProfDao dao) {
        super(dao);
    }

}
