package ma.zs.zyn.service.facade.admin.prof;

import java.util.List;
import ma.zs.zyn.bean.core.prof.ClassAverageBonusProf;
import ma.zs.zyn.dao.criteria.core.prof.ClassAverageBonusProfCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface ClassAverageBonusProfAdminService extends  IService<ClassAverageBonusProf,ClassAverageBonusProfCriteria>  {

    List<ClassAverageBonusProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<ClassAverageBonusProf> findBySalaryId(Long id);
    int deleteBySalaryId(Long id);
    long countBySalaryCode(String code);




}
