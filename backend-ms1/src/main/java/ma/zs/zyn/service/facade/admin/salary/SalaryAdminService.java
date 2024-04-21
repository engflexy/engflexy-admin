package ma.zs.zyn.service.facade.admin.salary;

import java.util.List;
import ma.zs.zyn.bean.core.salary.Salary;
import ma.zs.zyn.dao.criteria.core.salary.SalaryCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface SalaryAdminService extends  IService<Salary,SalaryCriteria>  {

    List<Salary> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);




}
