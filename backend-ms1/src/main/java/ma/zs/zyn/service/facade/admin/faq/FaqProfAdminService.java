package ma.zs.zyn.service.facade.admin.faq;

import java.util.List;
import ma.zs.zyn.bean.core.faq.FaqProf;
import ma.zs.zyn.dao.criteria.core.faq.FaqProfCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface FaqProfAdminService extends  IService<FaqProf,FaqProfCriteria>  {

    List<FaqProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<FaqProf> findByAdminId(Long id);
    int deleteByAdminId(Long id);
    long countByAdminId(Long id);
    List<FaqProf> findByFaqTypeId(Long id);
    int deleteByFaqTypeId(Long id);
    long countByFaqTypeId(Long id);




}
