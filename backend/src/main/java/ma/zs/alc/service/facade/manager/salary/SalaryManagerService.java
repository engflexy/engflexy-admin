package ma.zs.alc.service.facade.manager.salary;

import ma.zs.alc.bean.core.salary.Salary;
import ma.zs.alc.dao.criteria.core.salary.SalaryCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;



public interface SalaryManagerService extends  IService<Salary,SalaryCriteria>  {

    List<Salary> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);




}
