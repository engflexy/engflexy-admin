package ma.zs.zyn.service.facade.admin.pack;

import java.util.List;
import ma.zs.zyn.bean.core.pack.PackStudent;
import ma.zs.zyn.dao.criteria.core.pack.PackStudentCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface PackStudentAdminService extends  IService<PackStudent,PackStudentCriteria>  {

    List<PackStudent> findByParcoursId(Long id);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);
    List<PackStudent> findByPriceId(Long id);
    int deleteByPriceId(Long id);
    long countByPriceId(Long id);




}
