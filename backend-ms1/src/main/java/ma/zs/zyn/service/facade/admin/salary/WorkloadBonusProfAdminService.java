package ma.zs.zyn.service.facade.admin.salary;

import java.util.List;
import ma.zs.zyn.bean.core.salary.WorkloadBonusProf;
import ma.zs.zyn.dao.criteria.core.salary.WorkloadBonusProfCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface WorkloadBonusProfAdminService extends  IService<WorkloadBonusProf,WorkloadBonusProfCriteria>  {

    List<WorkloadBonusProf> findByWorkloadBonusId(Long id);
    int deleteByWorkloadBonusId(Long id);
    long countByWorkloadBonusCode(String code);
    List<WorkloadBonusProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<WorkloadBonusProf> findBySalaryId(Long id);
    int deleteBySalaryId(Long id);
    long countBySalaryCode(String code);




}
