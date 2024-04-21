package ma.zs.zyn.service.facade.admin.faq;

import java.util.List;
import ma.zs.zyn.bean.core.faq.Faq;
import ma.zs.zyn.dao.criteria.core.faq.FaqCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface FaqAdminService extends  IService<Faq,FaqCriteria>  {

    List<Faq> findByFaqTypeId(Long id);
    int deleteByFaqTypeId(Long id);
    long countByFaqTypeId(Long id);




}
