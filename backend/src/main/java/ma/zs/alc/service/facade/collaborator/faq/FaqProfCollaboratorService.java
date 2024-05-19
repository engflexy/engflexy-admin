package ma.zs.alc.service.facade.collaborator.faq;

import java.util.List;
import ma.zs.alc.bean.core.faq.FaqProf;
import ma.zs.alc.dao.criteria.core.faq.FaqProfCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface FaqProfCollaboratorService extends  IService<FaqProf,FaqProfCriteria>  {

    List<FaqProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<FaqProf> findByFaqTypeId(Long id);
    int deleteByFaqTypeId(Long id);
    long countByFaqTypeId(Long id);




}
