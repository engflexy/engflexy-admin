package ma.zs.alc.service.facade.collaborator.salary;

import java.util.List;
import ma.zs.alc.bean.core.salary.Salary;
import ma.zs.alc.dao.criteria.core.salary.SalaryCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface SalaryCollaboratorService extends  IService<Salary,SalaryCriteria>  {

    List<Salary> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);




}