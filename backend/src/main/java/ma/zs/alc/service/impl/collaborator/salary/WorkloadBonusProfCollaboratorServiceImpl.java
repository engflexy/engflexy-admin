package ma.zs.alc.service.impl.collaborator.salary;


import ma.zs.alc.bean.core.salary.WorkloadBonusProf;
import ma.zs.alc.dao.criteria.core.salary.WorkloadBonusProfCriteria;
import ma.zs.alc.dao.facade.core.salary.WorkloadBonusProfDao;
import ma.zs.alc.dao.specification.core.salary.WorkloadBonusProfSpecification;
import ma.zs.alc.service.facade.collaborator.salary.WorkloadBonusProfCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.salary.SalaryCollaboratorService ;
import ma.zs.alc.bean.core.salary.Salary ;
import ma.zs.alc.service.facade.collaborator.salary.WorkloadBonusCollaboratorService ;
import ma.zs.alc.bean.core.salary.WorkloadBonus ;
import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService ;
import ma.zs.alc.bean.core.prof.Prof ;

import java.util.List;
@Service
public class WorkloadBonusProfCollaboratorServiceImpl extends AbstractServiceImpl<WorkloadBonusProf, WorkloadBonusProfCriteria, WorkloadBonusProfDao> implements WorkloadBonusProfCollaboratorService {






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
    private SalaryCollaboratorService salaryService ;
    @Autowired
    private WorkloadBonusCollaboratorService workloadBonusService ;
    @Autowired
    private ProfCollaboratorService profService ;

    public WorkloadBonusProfCollaboratorServiceImpl(WorkloadBonusProfDao dao) {
        super(dao);
    }

}
