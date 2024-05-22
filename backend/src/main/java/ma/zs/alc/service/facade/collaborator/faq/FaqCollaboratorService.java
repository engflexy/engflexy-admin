package ma.zs.alc.service.facade.collaborator.faq;

import java.util.List;
import ma.zs.alc.bean.core.faq.Faq;
import ma.zs.alc.dao.criteria.core.faq.FaqCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface FaqCollaboratorService extends  IService<Faq,FaqCriteria>  {

    List<Faq> findByFaqTypeId(Long id);
    int deleteByFaqTypeId(Long id);
    long countByFaqTypeId(Long id);




}